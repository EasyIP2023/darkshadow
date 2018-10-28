require 'darkshadow/reap/command_names'
require 'optparse'
require 'socket'

module Send
  class Options
    def self.parse(args)
      options = {}
      parser = OptionParser.new do |opt|
        opt.banner = "Usage: #{DARK_SHADOW} #{SEND.colorize(:light_yellow)} [options]\nExample: #{DARK_SHADOW} #{SEND.colorize(:light_yellow)} --ip 192.168.0.0 -p 8080 -b AAAAAA --bs 920"
        opt.separator ''
        opt.separator 'Options:'

        opt.on('-p', '--port <port num>', Integer, 'Enter port number') do |port|
          options[:port] = port
        end

        opt.on('-i', '--ip <ip address>', String, 'Enter IP address') do |ip|
          options[:ip] = ip
        end

        opt.on('-b', '--buffer <buffer>', String, 'Input your string buffer') do |buff|
          options[:buffer] = buff
        end

        opt.on('--bs <buffer size>', Integer, 'Buffer size') do |bsize|
          options[:bsize] = bsize
        end

        opt.on_tail('-h', '--help', 'Show this message') do
          $stdout.puts opt
          exit
        end
      end
      parser.parse!(args)

      raise OptionParser::MissingArgument, "No options set, try #{DARK_SHADOW} #{SEND.colorize(:light_yellow)} -h for usage" if options.empty?
      options
    end
  end

  class Driver
    def initialize
      @opts = Options.parse(ARGV)
    rescue OptionParser::ParseError => e
      warn "[x] #{e.message}"
      exit
    end

    def run
      if @opts[:ip] && @opts[:port] && @opts[:buffer] && @opts[:bsize]
        buff = @opts[:buffer] * @opts[:bsize]

        s = TCPSocket.open(@opts[:ip], @opts[:port])

        s.send(buff, 0)
        s.close
      else
        warn 'You are missing options for'
        warn '   [x] ip'     if @opts[:ip].nil?
        warn '   [x] port'   if @opts[:port].nil?
        warn '   [x] buffer' if @opts[:buffer].nil?
        warn '   [x] bsize'  if @opts[:bsize].nil?
      end
    end
  end
end

@driver = Send::Driver.new
begin
  @driver.run
rescue ::StandardError => e
  warn "[x] #{e.class}: #{e.message}"
end
