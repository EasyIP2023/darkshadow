require 'darkshadow/reap/command_names'
require 'optparse'
require 'gdb'

module Fle
  class Options
    def self.parse(args)
      options = {}
      parser = OptionParser.new do |opt|
        opt.banner = "Usage: #{DARK_SHADOW} #{FLE.colorize(:light_yellow)} [options]\nExample: #{DARK_SHADOW} #{FLE.colorize(:light_yellow)} --init ./vuln_server"
        opt.separator ''
        opt.separator 'Options:'

        opt.on('-v', '--version <gdb-multiarch>', String, 'Specify what archeticuture') do |init|
          options[:init] = init
        end

        opt.on('-a', '--arch <cpu arch 32/64>', Interger, 'Specify what CPU archeticuture') do |arch|
          options[:arch] = arch
        end

        opt.on('-r', '--run', 'Run code in gdb') do
          options[:run] = true
        end

        opt.on('-i', '--init <executable>', String, 'Enter the executable file') do |exe|
          options[:exe] = exe
        end

        opt.on('-n', '--gdb-normal', 'Enter gdb normal') do
          options[:normal] = true
        end

        opt.on_tail('-h', '--help', 'Show this message') do
          $stdout.puts opt
          exit
        end
      end
      parser.parse!(args)

      raise OptionParser::MissingArgument, "No options set, try #{DARK_SHADOW} #{FLE.colorize(:light_yellow)} -h for usage" if options.empty?
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

    def check_init
      @opts[:init] == 'gdb-multiarch'
    end

    def run
      gdb = check_init ? GDB::GDB.new('arm.elf', gdb: 'gdb-multiarch') : GDB::GDB.new("-q #{@opts[:exe]}")
      gdb.execute('set verbose on')

      gdb.interact if @opts[:normal]

      gdb.break('main')
      gdb.run if @opts[:run]
      rdi = gdb.reg(:rdi)
      puts rdi
      rsi = gdb.reg(:rsi)
      puts rsi
      argv = gdb.readm(rsi, rdi, as: :u64)
      argv.map { |c| format('0x%x', c) }
      print argv
      puts
      puts gdb.writem(argv[2] + 5, 'FAT')
      puts gdb.execute('continue')
    end
  end
end

@driver = Fle::Driver.new
begin
  @driver.run
rescue ::StandardError => e
  warn "[x] #{e.class}: #{e.message}"
end
