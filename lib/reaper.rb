require "reaper/version"

# Set command names
HELP           = "help"
HELP_TAC       = "-h"
GENERATE       = "gen"
PATTERN_CREATE = "pate"
PATTERN_OFFSET = "poset"
PORT_SEARCH    = "scan"

module Reaper
  def self.get_first_arg
    case ARGV[0]
    when GENERATE
      require 'reaper/tools/exploit/generate'
    when PATTERN_CREATE
      require 'reaper/tools/exploit/pattern_create'
    when PATTERN_OFFSET
      require 'reaper/tools/exploit/pattern_offset'
    when PORT_SEARCH
      require 'reaper/tools/search/scan'
    when HELP
      help_message
    when HELP_TAC
      help_message
    else
      puts '[x] No options selected, try: reaper -h for usage'
    end
  end

  def self.help_message
    puts "Usage: reaper [options]\nExample: reaper pate -l 600"
    puts "\nOptions:
      #{GENERATE} \t Exploit Code Generation
      #{PATTERN_CREATE} \t For Pattern Creating
      #{PATTERN_OFFSET} \t For Pattern Offsetting
      #{PORT_SEARCH} \t For Port Searching
      #{HELP} \t for this message here"
  end
end

# Get the first argument in the terminal
Reaper.get_first_arg
