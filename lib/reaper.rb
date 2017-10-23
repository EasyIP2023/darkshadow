require "reaper/version"

# Set command names
HELP = "help"
HELP_TAC = "-h"
GENERATE = "gen"
PATTERN_CREATE = "pate"
PATTERN_OFFSET = "poset"


module Reaper
  def self.get_first_arg
    arg = ARGV[0]
    if arg == GENERATE
      require 'reaper/tools/exploit/generate'
    elsif arg == PATTERN_CREATE
      require 'reaper/tools/exploit/pattern_create'
    elsif arg == PATTERN_OFFSET
      require 'reaper/tools/exploit/pattern_offset'
    elsif arg == HELP || arg == HELP_TAC
      help_message
    else
      puts '[x] No options selected, try: "reaper -h" for usage'
    end
  end

  def self.help_message
    puts "Usage: reaper [options]\nExample: reaper pate -l 600"
    puts "\nOptions:
      #{GENERATE} \t Exploit Code Generation
      #{PATTERN_CREATE} \t For Pattern Creating
      #{PATTERN_OFFSET} \t For Pattern Offsetting
      #{HELP} \t for this message here"
  end
end

# Get the first argument in the terminal
Reaper.get_first_arg
