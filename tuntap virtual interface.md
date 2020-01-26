#### Create a device named tap0 and give it an ip

```
ip tuntap add dev tap0 mode tap
ip addr add 192.168.1.2/24 dev tap0
ip link set dev tap0 up
```

#### To autocreate on boot: add to /etc/network/interfaces.template the following

```
auto tap0
iface tap0 inet manual
pre-up ip tuntap add dev tap0 mode tap
pre-up ip addr add 192.168.1.2/24 dev tap0
up ip link set dev tap0 up
```
