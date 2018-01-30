require 'darkshadow/version'
require 'darkshadow/reap/command_names'

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
      when EGG_HUNTER
        require 'darkshadow/tools/exploit/egghunter'
      when PORT_SEARCH
        require 'darkshadow/tools/search/scan'
      when PACKET_SNIFFER
        require 'darkshadow/tools/sniffer/packet_sniffer'
      when HELP, HELP_TAC
        help_message
      when VERS, VERS_TAC
        display_version
      else
        puts '[x] No options selected, try: darkshadow -h for usage'
      end
    end
  end
end
