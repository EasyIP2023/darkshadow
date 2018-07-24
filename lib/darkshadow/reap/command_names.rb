require 'darkshadow/version'
require 'colorize'

# Set command names
HELP           = 'help'.freeze
HELP_TAC       = '-h'.freeze
VERS           = 'version'.freeze
VERS_TAC       = '-v'.freeze
GENERATE       = 'gen'.freeze
PATTERN_CREATE = 'pate'.freeze
PATTERN_OFFSET = 'poset'.freeze
PACKET_SNIFFER = 'psniff'.freeze
EGG_HUNTER     = 'egghunt'.freeze
EXEC           = 'exec'.freeze
DARK_SHADOW    = 'darkshadow'.colorize(:light_red)

def help_message
  puts "Options:\n
    #{'Exploitation'.colorize(:light_red)}
    #{GENERATE.colorize(:light_green)} \t Exploit Code Generation
    #{PATTERN_CREATE.colorize(:light_green)} \t For Pattern Creating
    #{PATTERN_OFFSET.colorize(:light_green)} \t For Pattern Offsetting
    #{EGG_HUNTER.colorize(:light_green)} \t For Egghunting VAS (Virtual Address Space)\n
    #{'Sniffing'.colorize(:light_red)}
    #{PACKET_SNIFFER.colorize(:light_green)} \t For Packet Sniffing TCP/UDP/ICMP... Packets\n
    #{'Executions'.colorize(:light_red)}
    #{EXEC.colorize(:light_green)} \t For execting simple bash scripts that make life easier :)\n
    #{'Help Message'.colorize(:light_red)}
    #{HELP.colorize(:light_green)} \t for this message here
    #{VERS.colorize(:light_green)} \t for version number\n"
end

def display_version
  puts "darkshadow #{DarkShadow::VERSION}"
end
