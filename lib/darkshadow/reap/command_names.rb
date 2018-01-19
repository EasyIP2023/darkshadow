# Set command names
HELP           = "help"
HELP_TAC       = "-h"
GENERATE       = "gen"
PATTERN_CREATE = "pate"
PATTERN_OFFSET = "poset"
PORT_SEARCH    = "scan"
EGG_HUNTER     = "egghunt"

def help_message
  puts "Usage: darkshadow [options]\nExample: darkshadow pate -l 600"
  puts "\nOptions:
    #{GENERATE} \t Exploit Code Generation
    #{PATTERN_CREATE} \t For Pattern Creating
    #{PATTERN_OFFSET} \t For Pattern Offsetting
    #{PORT_SEARCH} \t For Port Searching
    #{EGG_HUNTER} \t For Egghunting VAS (Virtual Address Space)
    #{HELP} \t for this message here"
end
