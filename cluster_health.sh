#!/bin/bash

user=root
pass=1234

curl -s -u "$user":"$pass" http://localhost:8529/_db/_system/_api/cluster/endpoints | tr "," "\n" | tr "{" "\n" | tr "}" "\n" > file_name

echo "---------------------------------"

node1=$(cat file_name  | awk NR==5 | cut -d : -f3 | cut -d '/' -f3)

if [ -z "$node1" ]
then
      echo "NODE-1 IS OFFLINE!!!"
else
      echo "NODE-01"
      echo "EndPoint IP: $node1"
      echo "Status: HEALTHY"
      echo "SyncStatus: $(curl -s -u "$user":"$pass" http://$node1:8529/_db/_system/_admin/status | tr "," "\n" | tr "{" "\n" | tr "}" "\n" | awk NR==18 | cut -d : -f2 | cut -d '"' -f2)"
      leader=$(curl -s -u "$user":"$pass" http://$node1:8529/_db/_system/_admin/status | tr "," "\n" | tr "{" "\n" | tr "}" "\n" | grep isFoxxmaster | cut -d : -f2 | cut -d '"' -f2)      
      if [ $leader == true ]
      then
      echo "ROLE: LEADER"
      else
      echo "ROLE: FOLLOWER"
      fi

fi
echo ""

node2=$(cat file_name  | awk NR==8 | cut -d : -f3 | cut -d '/' -f3)

if [ -z "$node2" ]
then
      echo "NODE-2 IS OFFLINE!!!"
else
      echo "NODE-02"
      echo "EndPoint IP: $node2"
      echo "Status: HEALTHY"
      echo "SyncStatus: $(curl -s -u "$user":"$pass" http://$node2:8529/_db/_system/_admin/status | tr "," "\n" | tr "{" "\n" | tr "}" "\n" | awk NR==18 | cut -d : -f2 | cut -d '"' -f2)"
      leader=$(curl -s -u "$user":"$pass" http://$node2:8529/_db/_system/_admin/status | tr "," "\n" | tr "{" "\n" | tr "}" "\n" | grep isFoxxmaster | cut -d : -f2 | cut -d '"' -f2)
      if [ $leader == true ]
      then
      echo "ROLE: LEADER"
      else
      echo "ROLE: FOLLOWER"
      fi
fi
echo ""

node3=$(cat file_name  | awk NR==11 | cut -d : -f3 | cut -d '/' -f3)

if [ -z "$node3" ]
then
      echo "NODE-3 IS OFFLINE!!!"
else
      echo "NODE-03"
      echo "EndPoint IP: $node3"
      echo "Status: HEALTHY"
      echo "SyncStatus: $(curl -s -u "$user":"$pass" http://$node3:8529/_db/_system/_admin/status | tr "," "\n" | tr "{" "\n" | tr "}" "\n" | awk NR==18 | cut -d : -f2 | cut -d '"' -f2)"
      leader=$(curl -s -u "$user":"$pass" http://$node3:8529/_db/_system/_admin/status | tr "," "\n" | tr "{" "\n" | tr "}" "\n" | grep isFoxxmaster | cut -d : -f2 | cut -d '"' -f2)
      if [ $leader == true ]
      then
      echo "ROLE: LEADER"
      else
      echo "ROLE: FOLLOWER"
      fi
fi
echo ""

echo "---------------------------------"
rm -rf file_name