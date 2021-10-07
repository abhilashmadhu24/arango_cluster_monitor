# arango_cluster_monitor

Bash script to monitor arangoDB cluster status with the help og arango APIs. For those who are not aware of arangoDB setup and architecture please have a look at my previous post about the same. https://github.com/abhilashmadhu24/ArrangoDB-cluster-with-ansible

This script will display the cluster endpoints, status, health and leader.

NP: Written for 3 cluster architecture, you can edit as per your architecture

Steps: Clone to your nodes as below

```
git clone https://github.com/abhilashmadhu24/arango_cluster_monitor.git
cd arango_cluster_monitor
edit cluster_health file with your user/credentials
cp cluster_health /usr/bin/
chmod +x /usr/bin/cluster_health
```

# Outputs:

![1](https://user-images.githubusercontent.com/50264439/136343867-6b4f52c3-be49-4296-96cf-30fce93c756c.png)


![2](https://user-images.githubusercontent.com/50264439/136343878-e57e34b1-dc77-438f-9e26-f66317cedddf.png)
