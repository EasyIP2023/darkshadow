require 'darkshadow/version'

D_NONE    = 0
D_SUCCESS = 1
D_DANGER  = 2
D_INFO    = 3
D_WARNING = 4
D_RESET   = 5

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
SEND           = 'send'.freeze
FLE            = 'gdb'.freeze

def log_me(type, msg)
  case type
  when D_NONE
    "" "#{msg}"
  when D_SUCCESS
    "\x1B[32;1m" "#{msg}" "\x1b[0m"
  when D_DANGER
    "\x1B[31;1m" "#{msg}" "\x1b[0m"
  when D_INFO
    "\x1B[30;1m" "#{msg}" "\x1b[0m"
  when D_WARNING
    "\x1B[33;1m" "#{msg}" "\x1b[0m"
  when D_RESET
    "\x1b[0m" "#{msg}"
  else
    warn '[x] No color was selected'
  end
end

DARK_SHADOW = log_me(D_DANGER, 'darkshadow').freeze

def help_message
  puts "Options:\n
    #{log_me(D_DANGER, 'Exploitation')}
    #{log_me(D_WARNING, GENERATE)} #{log_me(D_INFO,"\t For Exploit Code Generation")}
    #{log_me(D_WARNING, PATTERN_CREATE)} #{log_me(D_INFO,"\t For Pattern Creating")}
    #{log_me(D_WARNING, PATTERN_OFFSET)} #{log_me(D_INFO,"\t For Pattern Offsetting")}
    #{log_me(D_WARNING, EGG_HUNTER)} #{log_me(D_INFO,"\t For Egghunting VAS (Virtual Address Space)\n")}
    #{log_me(D_DANGER, 'Sniffing')}
    #{log_me(D_WARNING, PACKET_SNIFFER)} #{log_me(D_INFO,"\t For Packet Sniffing TCP/UDP/ICMP... Packets\n")}
    #{log_me(D_DANGER, 'Executions')}
    #{log_me(D_WARNING, EXEC)} #{log_me(D_INFO,"\t For execting simple bash scripts that make life easier :)")}
    #{log_me(D_WARNING, SEND)} #{log_me(D_INFO,"\t For sending a buffer remotely to crash a program\n")}
    #{log_me(D_DANGER, 'Find Linux Exploit')}
    #{log_me(D_WARNING, FLE)} #{log_me(D_INFO,"\t For finding exploits in gdb without enter it\n")}
    #{log_me(D_DANGER, 'Help Message')}
    #{log_me(D_WARNING, HELP)} #{log_me(D_INFO,"\t For this message here")}
    #{log_me(D_WARNING, VERS)} #{log_me(D_INFO,"\t For version number\n")} #{log_me(D_RESET,"")}"
end

def display_version
  puts "#{log_me(W_INFO, 'darkshadow')} #{DarkShadow::VERSION}"
end
