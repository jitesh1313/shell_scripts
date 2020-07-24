#!/bin/sh
used=$(df -H | grep -i /dev/xvda1 |awk '{ print $5 }')
max=85
echo $response
        if  [ ${used%?} -ge ${max%?}  ];
        then
                echo "enough space"
        else
                echo "Free space is less than 15%"

        fi
