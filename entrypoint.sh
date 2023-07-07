#!/bin/sh

echo "########################"
echo ">> Service 'All': Status"
echo "########################"
rc-status -a

echo "#############################"
echo ">> Service 'crond': Adding..."
echo "#############################"
rc-update add crond

echo "##############################"
echo ">> Service 'crond': Stating..."
echo "##############################"
rc-service crond start

echo "########################"
echo ">> Service 'All': Status"
echo "########################"
rc-status -a

echo "######################################"
echo ">> Cron 'Docker Garbage Collector': Registering..."
echo "######################################"
echo "$CRON_EXPRESSION	sh /home/docker-gc.sh" >> /var/spool/cron/crontabs/root 

echo "###################"
echo ">> Cron: Listing..."
echo "###################"
crontab -l

tail -F null