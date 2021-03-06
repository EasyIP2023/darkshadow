require 'darkshadow/version'
require 'darkshadow/reap/constants'

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
      when PACKET_SNIFFER
        require 'darkshadow/tools/sniffer/packet_sniffer'
      when EXEC
        require 'darkshadow/tools/exec/bash'
      when SEND
        require 'darkshadow/tools/exec/send'
      when FLE
        require 'darkshadow/tools/debugger/fle'
      when HELP, HELP_TAC
        help_message
      when VERS, VERS_TAC
        display_version
      else
        warn '[x] No options selected, try: darkshadow -h for usage'
      end
    end
  end
end
