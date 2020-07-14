#!/bin/bash 

# mount drives on Linux server first  
# mkdir for time machine location 
# then run the below commands :
sudo apt-get install netatalk libc6-dev avahi-daemon libnss-mdns
sudo vim /etc/nsswitch.conf # to replace the hosts line as below:
hosts:          files mdns4_minimal [NOTFOUND=return] dns mdns4 mdns
$ sudo vim /etc/avahi/services/afpd.service # to edit as below:
# <?xml version="1.0" standalone='no'?><!--*-nxml-*-->
# <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
# <service-group>
#     <name replace-wildcards="yes">%h</name>
#     <service>
#         <type>_afpovertcp._tcp</type>
#         <port>548</port>
#     </service>
#     <service>
#         <type>_device-info._tcp</type>
#         <port>0</port>
#         <txt-record>model=Xserve</txt-record>
#     </service>
# </service-group>
# $ sudo vim /etc/netatalk/AppleVolumes.default # to edit as below:
# # change the line ~/ to:
# /home/<username>/Xserve options:tm    
# $ sudo vim /etc/default/netatalk # to edit as below:
# # uncomment/ add the entries below:
# ATALKD_RUN=no
# PAPD_RUN=no
# CNID_METAD_RUN=yes
# AFPD_RUN=yes
# TIMELORD_RUN=no
# A2BOOT_RUN=no
sudo service avahi-daemon restart
sudo service netatalk restart