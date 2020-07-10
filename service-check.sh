
#!/bin/bash
  
service=(nginx logstash elasticsearch nginx logstash docker)
for service in "${service[@]}"
do
        response=$(ps -ef | grep -v grep | grep $service | wc -l)
        if [ "$response" != "0" ]
        then
                echo "services are running"
        else
                echo "services are stop"
                service $service start
                curl -X POST -H 'Content-type: application/json' --data '{"text":"'$service' is not responding, restarting service"}' https://hooks.slack.com/services/xxxxxxxxxxx
        fi
done

#logstash=$(ps -ef | grep -v grep | grep logstash |grep /etc/logstash/conf.d/input.conf |wc -l)
if (( $(ps -ef | grep -v grep | grep logstash |grep /etc/logstash/conf.d/input.conf |wc -l) > 0 ))
then
echo "logstash is running!!!"
else
echo "stopped"
/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/input.conf >/dev/null 2>&1 &
curl -X POST -H 'Content-type: application/json' --data '{"text":" logstash  is not responding, restarting service"}' https://hooks.slack.com/services/xxxxxxxxxxxxxxx
fi
