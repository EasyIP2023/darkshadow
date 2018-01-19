require "darkshadow/version"
require "darkshadow/reap/command_names"

module DarkShadow
  class Reap
    def initialize(argv)
      case argv
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
  end
end
