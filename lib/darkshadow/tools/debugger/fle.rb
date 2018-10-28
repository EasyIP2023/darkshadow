require 'darkshadow/reap/command_names'
require 'darkshadow/reap/gdb_commands'
require 'optparse'
require 'gdb'

module Fle
  class Options
    def self.parse(args)
      options = {}
      parser = OptionParser.new do |opt|
        opt.banner = "Usage: #{DARK_SHADOW} #{FLE.colorize(:light_yellow)} [options]\nExample: #{DARK_SHADOW} #{FLE.colorize(:light_yellow)} --init ./vuln_server -a 64 -b 'main' -e 'run','print $rsi'"
        opt.separator ''
        opt.separator 'Options:'

        opt.on('-i', '--init <executable>', String, 'Enter the executable file') do |exe|
          options[:exe] = exe
        end

        opt.on('-a', '--arch <cpu arch 32/64>', Integer, 'Specify what CPU archeticuture') do |arch|
          options[:arch] = arch
        end

        opt.on('-b', '--brk \'main\',\'other breaks\'', Array, 'Enter where you want to set a break point') do |brk|
          options[:brk] = brk.map(&:to_s)
          options[:brk_check] = true
        end

        opt.on('-r', '--run', 'Run code in gdb') do
          options[:run] = true
        end

        opt.on('--rwo <\'-c "echo cat"\'>', String, 'Run code in gdb with options') do |run_with_opt|
          options[:run_opt] = run_with_opt
          options[:rwo] = true
        end

        opt.on('-n', '--gdb-normal', 'Enter gdb normal') do
          options[:normal] = true
        end

        opt.on('--reg <rdi,rsi,rsp>', Array, 'Enter register want to search') do |reg|
          options[:reg] = reg.map(&:to_s)
          options[:regi] = true
        end

        opt.on('-e', '--execute \'run\',\'print $rsi\'', Array, 'Execute gdb commands') do |exe_gdb|
          options[:exe_gdb] = exe_gdb.map(&:to_s)
          options[:exe_gdb_check] = true
        end

        options[:arm] = false
        opt.on('--arm', 'Only Specify if arm archeticuture') do
          options[:arm] = true
        end

        opt.on_tail('-h', '--help', 'Show this message') do
          warn '[x] Current main features to use -b for break -e for execute'
          warn '[x] This portion of darkshadow is still in Testing!!! ;)'
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

    def run
      gdb = @opts[:arm] ? GDB::GDB.new((@opts[:exe]).to_s, gdb: 'gdb-multiarch') : GDB::GDB.new("-q #{@opts[:exe]}")

      gdb.interact if @opts[:normal] # Go into gdb interactive mode if normal selected

      if @opts[:arch] == 32
        @opts[:brk].each { |b| gdb.break(b) } if @opts[:brk_check]

        if @opts[:run] && @opts[:rwo]
          warn '[x] Please decide if you want to just run or run with options'
          exit
        end

        puts gdb.run if @opts[:run]
        puts gdb.run(@opts[:run_opt]) if @opts[:rwo]

        reg = @opts[:r] ? cycle_through_reg_32bit(gdb, @opts[:reg]) : {}

        @opts[:exe_gdb].each { |e| execute(gdb, e) } if @opts[:exe_gdb_check]

        # Still in testing
        if @opts[:regi]
          reg = cycle_through_reg_64bit(gdb, @opts[:reg])

          argv = gdb.readm(reg[:esi], reg[:edi], as: :u64)

          argv.map { |c| format('0x%x', c) }
          print argv
          puts
          puts gdb.writem(argv[2] + 5, 'FAT')
          puts gdb.execute('continue')
        end
      elsif @opts[:arch] == 64
        @opts[:brk].each { |b| gdb.break(b) } if @opts[:brk_check]

        if @opts[:run] && @opts[:rwo]
          warn '[x] Please decide if you want to just run or run with options'
          exit
        end

        puts gdb.run if @opts[:run]
        puts gdb.run(@opts[:run_opt]) if @opts[:rwo]

        @opts[:exe_gdb].each { |e| execute(gdb, e) } if @opts[:exe_gdb_check]

        # Still in testing
        if @opts[:regi]
          reg = cycle_through_reg_64bit(gdb, @opts[:reg])

          argv = gdb.readm(reg[:rsi], reg[:rdi], as: :u64)

          argv.map { |c| format('0x%x', c) }
          print argv
          puts
          puts gdb.writem(argv[2] + 5, 'FAT')
          puts gdb.execute('continue')
        end
      else
        warn "No options set, try #{DARK_SHADOW} #{FLE.colorize(:light_yellow)} -h for usage"
      end
    end
  end
end

@driver = Fle::Driver.new
begin
  @driver.run
rescue ::StandardError => e
  warn "[x] #{e.class}: #{e.message}"
end
