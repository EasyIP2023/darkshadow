#!/usr/bin/ruby

#require 'celluloid'
require 'socket'
require 'optparse'

module Scan

  class Scanner
    def initialize (ip, ports)
      @ip = ip
      @ports = ports
      @ports.each { |p| puts "#{ip}:#{p}"}
    end

    def scan (port)
      begin
        sock = Socket.new(:INET, :STREAM, 0)
        raw = Socket.sockaddr_in(port, @ip)
        @open_ports << port if sock.connect(raw)
      rescue
        sock.close if sock != nil
      end
    end

    def run

    end
  end

  class Options
    def self.parse (args)
      options = {}
      parser = OptionParser.new do |opt|
        opt.banner = "Usage: reaper gen [options]\nExample: reaper scan --ip 192.168.1.1 -p 1,10000"
        opt.separator ''
        opt.separator 'Options:'

        options[:check_ip] = false
        opt.on('--ip <ip>', String, "Enter ip address") do |ip|
          options[:ip] = ip
          options[:check_ip] = true
        end

        opt.on('-p', '--ports 1,1000', Array, "Search for open ports") do |ports|
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

      raise OptionParser::MissingArgument, '[x] No options set, try -h for usage' if options.empty?
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
        sp = Scanner.new @opts[:ip], @opts[:ports]
        #sp.async.run
      else
        $stderr.puts "[x] Missing Ip Address/Range"
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
