# TCP Portal
Just another simple TCP proxy that works on HTTP and HTTPS flows.  
Adapted from [Abghand](https://github.com/Yaser-Amiri/abghand) which uses google tcp proxy underneath.

To use TCP Portal, first you need to send your traffic to TCP Portal by setting DNS records in `/etc/hosts` or making DNS server to return the IP of the server that this application is running on.  
Then define the domains that you want to proxy their traffic in the config file.

``` yaml
- hostname: 'index.docker.io'
- hostname: 'registry.hub.docker.com'
- hostname: 'auth.docker.io'
- hostname: 'hub.docker.com'
- hostname: 'registry-1.docker.io'
- hostname: 'service-with-non-standard-port.com'
  port_set:
    - port_number: 8080
      type: "HTTP"
    - port_number: 11443
      type: "HTTPS"
```

#### Setting up:

To build and install from source code run the following commands:  

    go get 'github.com/hnaderi/tcp-portal'
    go build
    go install

To run tcp-portal on Docker:  

    docker run -d \
        -v $(pwd)/config.yml:/config.yml \
        -p 80:80 -p 443:443 hnaderi/tcp-portal
*Add or remove published ports based on your configuration.*
