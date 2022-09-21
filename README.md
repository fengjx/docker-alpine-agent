# alpine ssh agent

sshd service support, you can use for ssh agent to access docker network

```bash
$ docker run -d -it --name agent -p 2200:22 -e pwd=1024  fengjx/alpine-agent
$ ssh -p 2200 root@localhost
root@localhost's password: # 1024
Welcome to Alpine!

The Alpine Wiki contains a large amount of how-to guides and general
information about administrating Alpine systems.
See <http://wiki.alpinelinux.org/>.

You can setup the system with the command: setup-alpine

You may change this message by editing /etc/motd.

4b4fe1fe59aa:~# 
```

