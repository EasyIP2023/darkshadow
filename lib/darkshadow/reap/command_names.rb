require 'darkshadow/reap/banners'
require 'darkshadow/version'
require 'colorize'

# Set command names
HELP           = "help"
HELP_TAC       = "-h"
VERS           = "version"
VERS_TAC       = "-v"
GENERATE       = "gen"
PATTERN_CREATE = "pate"
PATTERN_OFFSET = "poset"
PORT_SEARCH    = "scan"
EGG_HUNTER     = "egghunt"
DARK_SHADOW    = "darkshadow".colorize(:light_red)

def help_message
  puts Banners.rand_banner
  puts
  puts "Usage: #{DARK_SHADOW} [options]\nExample: #{DARK_SHADOW} #{PATTERN_CREATE.colorize(:light_yellow)} -l 600"
  puts "\nOptions:\n
    #{"Exploitation".colorize(:light_red)}
    #{GENERATE.colorize(:light_green)} \t Exploit Code Generation
    #{PATTERN_CREATE.colorize(:light_green)} \t For Pattern Creating
    #{PATTERN_OFFSET.colorize(:light_green)} \t For Pattern Offsetting
    #{EGG_HUNTER.colorize(:light_green)} \t For Egghunting VAS (Virtual Address Space)\n
    #{"Scanning".colorize(:light_red)}
    #{PORT_SEARCH.colorize(:light_green)} \t For Port Searching\n
    #{"Help Message".colorize(:light_red)}
    #{HELP.colorize(:light_green)} \t for this message here
    #{VERS.colorize(:light_green)} \t for version number\n"
end

def display_version
  puts "darkshadow #{DarkShadow::VERSION}"
end
