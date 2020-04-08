FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
        git \
        wget \
        apache2 \
        python3 \
        python3-pip

#works for when youre cloing into container
#RUN echo 'cc2asn-mini --- docker' > /var/www/index.html
#RUN echo 'Listen 42069' > /etc/apache2/ports.conf
#RUN mkdir /working && cd /working && git clone https://github.com/mentalburden/cc2asn-mini

#Works for when youre git clone'ing onto host
RUN echo 'cc2asn-mini --- docker' > /var/www/index.html
RUN echo 'Listen 42069' > /etc/apache2/ports.conf
RUN mkdir /working && cd /working && mkdir cc2asn-mini && cd /working/cc2asn-mini
ADD ./* /working/cc2asn-mini

RUN pip3 install configobj
RUN pip3 install natsort
#RUN {get reverse shell}
RUN cd /working/cc2asn-mini && cp 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN cd /working/cc2asn-mini && ./RIR-downloader.sh
RUN cd /working/cc2asn-mini && ./SEF-parser.py
#RUN {build revsh 7min cronjob with echo >>}
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

EXPOSE 42069
