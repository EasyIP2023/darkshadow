require "darkshadow/version"
require "darkshadow/command_names"

module DarkShadow
  def self.get_first_arg
    case ARGV[0]
    when GENERATE
      require 'darkshadow/tools/exploit/generate'
    when PATTERN_CREATE
      require 'darkshadow/tools/exploit/pattern_create'
    when PATTERN_OFFSET
      require 'darkshadow/tools/exploit/pattern_offset'
    when PORT_SEARCH
      require 'darkshadow/tools/search/scan'
    when HELP
      help_message
    when HELP_TAC
      help_message
    else
      puts '[x] No options selected, try: darkshadow -h for usage'
    end
  end

  def self.help_message
    puts "Usage: darkshadow [options]\nExample: darkshadow pate -l 600"
    puts "\nOptions:
      #{GENERATE} \t Exploit Code Generation
      #{PATTERN_CREATE} \t For Pattern Creating
      #{PATTERN_OFFSET} \t For Pattern Offsetting
      #{PORT_SEARCH} \t For Port Searching
      #{HELP} \t for this message here"
  end
end

# Get the first argument in the terminal
DarkShadow.get_first_arg
