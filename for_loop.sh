
#!/bin/bash
if [ -z $1 ]
then
echo "usage: /root/makeusers testfile"
elif [ $1 = testfile ]
then
for i in $(cat /root/testfile |cut -d : -f1)

do 
useradd -s /bin/false $i
done
else
echo "Input file not found"



-z = zero length 

bash.sh $1 $2 $3 $4
