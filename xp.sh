#!/bin/bash
data=( `cat /etc/xray/vmess.json | grep '^###' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/etc/xray/vmess.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/vmess.json
rm -f /etc/xray/$user-vmess.json 
fi
done
systemctl restart xray@vmess
#Trojan
data=( `cat /etc/xray/trojan.json | grep '^### trial-' | cut -d ' ' -f 2 | cut -d '-' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### trial-$user" "/etc/xray/trojan.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### trial-$user $exp/,/^},{/d" /etc/xray/trojan.json
fi
done
systemctl restart xray@trojan
#vless
data=( `cat /etc/xray/vless.json | grep '^### trial-' | cut -d ' ' -f 2 | cut -d '-' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### trial-$user" "/etc/xray/vless.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### trial-$user $exp/,/^},{/d" /etc/xray/vless.json
fi
done
systemctl restart xray@vless
#vlgrpc
data=( `cat /etc/xray/vlgrpc.json | grep '^### trial-' | cut -d ' ' -f 2 | cut -d '-' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### trial-$user" "/etc/xray/vlgrpc.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### trial-$user $exp/,/^},{/d" /etc/xray/vlgrpc.json
fi
done
systemctl restart xray@vlgrpc
#Trojanws
data=( `cat /etc/xray/trojanws.json | grep '^### trial-' | cut -d ' ' -f 2 | cut -d '-' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### trial-$user" "/etc/xray/trojanws.json" | cut -d ' ' -f 3)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" = "0" ]]; then
sed -i "/^### trial-$user $exp/,/^},{/d" /etc/xray/trojanws.json
fi
done
systemctl restart xray@trojanws
