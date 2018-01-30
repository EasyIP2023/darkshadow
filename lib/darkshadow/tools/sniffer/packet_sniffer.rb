require 'darkshadow/reap/command_names'

require 'darkshadow.so'
include Reap

puts "The Output will be written in a log file called dsniff_log.txt"
PSniff.start_sniffing
