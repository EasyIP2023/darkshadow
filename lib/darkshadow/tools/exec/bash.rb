require 'darkshadow/reap/command_names'
require 'optparse'

module Bash
  class Options
    def self.parse(args)
      options = {}
      parser = OptionParser.new do |opt|
        opt.banner = "Usage: #{DARK_SHADOW} #{EXEC.colorize(:light_yellow)} [options]\nExample: #{DARK_SHADOW} #{EXEC.colorize(:light_yellow)} -l d"
        opt.separator ''
        opt.separator 'Options:'

        opt.on('-s', '--sudo', 'Execute with sudo permissions') do
          options[:sudo] = true
        end

        opt.on('--install-peda', 'Install the Python Exploit Development Assistance for GDB') do
          options[:peda] = true
        end

        opt.on('--shred <filename>', String, 'shred a file wiping bits to zero') do |file|
          options[:file] = file
          options[:shred] = true
        end

        opt.on('-l <(e/d) enable/disable ASLR> ', String, 'Setting Linux into a vulnerable state by temp disabling ASLR') do |ed|
          options[:vuln]    = true
          options[:enable]  = ed == 'e' || ed == 'enable' ? true : false
          options[:disable] = ed == 'd' || ed == 'disable' ? true : false
        end

        opt.on_tail('-h', '--help', 'Show this message') do
          $stdout.puts opt
          exit
        end
      end

      parser.parse!(args)

      raise OptionParser::MissingArgument, "No options set, try #{DARK_SHADOW} #{EXEC.colorize(:light_yellow)} -h for usage" if options.empty?
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
      if @opts[:shred]
        `#{'sudo' if @opts[:sudo]} shred -n 30 -uvz #{@opts[:file]}`
      elsif @opts[:peda]
        `git clone https://github.com/longld/peda.git ~/peda && echo "source ~/peda/peda.py" >> ~/.gdbinit && echo "DONE! debug your program with gdb and enjoy"` unless File.exist?('~/peda/peda.py')
      elsif @opts[:vuln]
        if @opts[:disable]
          # Temporarily disable ASLR && Allow ptrace processes
          `sudo sysctl -w kernel.randomize_va_space=0 && sudo sysctl -w kernel.yama.ptrace_scope=0`
          puts 'Temporarily disabled linux Adress Space Layout Randomization(ASLR)...'
          puts 'Allowing ptrace processes...'
        end
        if @opts[:enable]
          `sudo sysctl -w kernel.randomize_va_space=2 && sudo sysctl -w kernel.yama.ptrace_scope=1`
          puts 'Enabled Linux Adress Space Layout Randomization(ASLR)...'
          puts 'Reset ptrace processes...'
        end
      end
    end
  end
end

@driver = Bash::Driver.new
begin
  @driver.run
rescue ::Exception => e
  warn "[x] #{e.class}: #{e.message}"
end
