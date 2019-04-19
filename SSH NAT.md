# Goal
ssh to a machine behind a NAT from a another machine behind another NAT

# Requires
Two machines behind two different NATs (source, and target), and one global machine (server with a static ip)

# Setup
1. On the target machine:

    `ssh -f -N -T -R port1:localhost:22 user_on_server@server`

2. On the source machine:

    `ssh -f -N -T -L port2:localhost:port1 user_on_server@server`

# Connect
1. connect from source to target using 

    `ssh -p port2 user_on_target_machine@localhost`

2. You can actually setup port1 to be the same as port2
