require 'darkshadow/tools/search/services_hash'
require 'darkshadow/reap/command_names'
require 'darkshadow/reap/banners'
require 'celluloid/current'
require 'socket'
require 'optparse'

module Scan
  class Scanner
    include Celluloid

    def initialize (ip, ports)
      @ip = ip
      @ports = ports
      @open_ports = []
      @services = ServiceHash.new
      @cp_count = 0
    end

    def udp_run
      start_port = @ports[0].to_i
      end_port   = @ports[1].to_i
      @cp_count = end_port
      until start_port >= end_port do
        udp_scan start_port
        start_port += 1
      end
    end

    # Send UDP Packets. If an ICMP port unreachable and
    # (type 3, code 3) is returned, the port is closed
    def udp_scan (port)
      begin
        sock = UDPSocket.new
        sock.send("", 0, @ip, port)
        @open_ports << port unless recv(1024)
      rescue
        sock.close if sock != nil
      end
    end


    def tcp_run
      start_port = @ports[0].to_i
      end_port   = @ports[1].to_i
      @cp_count = end_port
      until start_port >= end_port do
        tcp_scan start_port
        start_port += 1
      end
    end

    # Send SYN flags until you get a SYN/ACK
    # Send an ACK flag to complete TCP 3-Way Handshake
    def tcp_scan (port)
      begin
        sock = Socket.new(:INET, :STREAM, 0)
        raw = Socket.sockaddr_in(port, @ip)
        @open_ports << port if sock.connect(raw)
      rescue
        sock.close if sock != nil
      end
    end

    def display
      if @open_ports.empty?
        puts "darkshadow Scan Report"
        puts "Number of closed ports #{@cp_count-@open_ports.length}"
        $stderr.puts "[x] Sorry couldn't find a port :("
      else
        puts "darkshadow Scan Report"
        puts "Number of closed ports #{@cp_count-@open_ports.length}"
        puts "\n\tPort\tSTATE\tService"
        @open_ports.each do |op|
          puts "\t#{op}/tcp\topen\t#{@services.find_service_name(op)}"
        end
      end
    end
  end

  class Options
    def self.parse (args)
      options = {}
      parser = OptionParser.new do |opt|
        opt.banner = "#{Banners.rand_banner}\n\nUsage: #{DARK_SHADOW} #{PORT_SEARCH.colorize(:light_yellow)} [options]\nExample: #{DARK_SHADOW} #{PORT_SEARCH.colorize(:light_yellow)} --ip 192.168.1.1 -p 1,10000 --full-tcp"
        opt.separator ''
        opt.separator 'Options:'

        options[:check_ip] = false
        opt.on('--ip <ip>', String, "Enter ip address") do |ip|
          options[:ip] = ip
          options[:check_ip] = true
        end

        options[:full_tcp] = false
        opt.on('-t', '--full-tcp', "full tcp scan") do |tcp|
          options[:full_tcp] = true
        end

        options[:udp] = false
        opt.on('-u', '--udp', "udp scan") do |tcp|
          options[:udp] = true
        end

        opt.on('-p', '--ports <ports>', Array, "enter port numbers") do |ports|
          options[:ports] = ports
          if ports.length > 2
            $stderr.puts "[x] Can't have for than two ports"
            exit
          end
        end

        opt.on_tail('-h', '--help', 'Show this message') do
          $stdout.puts opt
          exit
        end
      end

      parser.parse!(args)

      raise OptionParser::MissingArgument, "[x] No options set, try #{DARK_SHADOW} #{PORT_SEARCH.colorize(:light_yellow)} -h for usage" if options.empty?
      options
    end
  end

  class Driver
    def initialize
      begin
        @opts = Options.parse(ARGV)
      rescue OptionParser::ParseError => e
        $stderr.puts "[x] #{e.message}"
        exit
      end
    end

    def run
      if @opts[:check_ip]
        # Default to ports 1 - 1024 if ports not specified
        @opts[:ports] = [1,1024] if @opts[:ports].nil?
        if @opts[:full_tcp]
          sp = Scanner.new @opts[:ip], @opts[:ports]
          sp.async.tcp_run
          sp.display
        elsif @opts[:udp]
          sp = Scanner.new @opts[:ip], @opts[:ports]
          sp.async.udp_run
          sp.display
        else
          $stderr.puts "[x] Need other options, ex. #{DARK_SHADOW} #{PORT_SEARCH.colorize(:light_yellow)} --ip 192.168.1.1 -p 1,1000 --full-tcp"
          exit
        end
      else
        $stderr.puts "[x] Missing Ip Address or ports missing"
        exit
      end
    end
  end
end

@driver = Scan::Driver.new
begin
	@driver.run
rescue ::StandardError => e
  $stderr.puts "[x] #{e.class}: #{e.message}"
end
