#!/bin/bash
source /opt/ros/noetic/setup.bash
export ROS_PACKAGE_PATH=~/rc_ws:$ROS_PACKAGE_PATH
source ~/rc_ws/devel/setup.bash
ip="192.168.1.105"
export ROS_IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.17.0.1' | grep -v '192.168.100.2')
for i in {1..10}
do
    if [ "$ROS_IP" = "$ip" ]
    then
        break
    else
        sleep 1
        ROS_IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.17.0.1' | grep -v '192.168.100.2')
    fi
done
if test -z "${ROS_IP}"; then
  export ROS_IP=192.168.100.2
fi
export ROS_MASTER_URI=http://$ROS_IP:11311
roscore