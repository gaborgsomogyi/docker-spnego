# docker-spnego
Some browsers are running in limited environment in order to enforce security.
This is good from security perspective but it blocks some of the use-cases.
A good example is when one tries to access SPNEGO web pages. Such case one need
a valid TGT which is by default stored in the following file: `/tmp/krb5cc_$(uid)`.

Not all browsers are able to reach `/tmp` or any host OS directory.
A good example is when the  browser runs in a chroot environment.
Everything can be configured properly after some time, but I got tired that each
OS update makes some new tricks and I need to debug/configure days to make it work.

As a solution I've created a small docker image which contains just a chrome
which can do SPNEGO properly.

## How to build
```
git clone https://github.com/gaborgsomogyi/docker-spnego.git
cd docker-spnego
docker-compose build
```

## How to start SPNEGO client docker
```
# Before you start put the proper krb5.conf into the share/ directory 

./start.sh
```

## How to connect to the SPNEGO client docker
Open your favourite VNC client and connect to `localhost:5900`.
```
# Right click -> Applications -> Shells -> Bash

# Get TGT
kinit systest -l 7d
klist

# Open chrome
chrome.sh

# Open the SPNEGO protected page
# If chrome complains about certificate one can type "thisisunsafe" anywhere
# in the chrome window to proceed
```
