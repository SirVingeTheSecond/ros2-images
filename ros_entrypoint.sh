#!/bin/bash
set -e

# Check if ROS_DISTRO is set
if [ -z "$ROS_DISTRO" ]; then
    echo "Error: ROS_DISTRO is not set"
    exit 1
fi

# Check if the setup file exists
if [ ! -f "/opt/ros/${ROS_DISTRO}/setup.bash" ]; then
    echo "Error: ROS setup file not found at /opt/ros/${ROS_DISTRO}/setup.bash"
    exit 1
fi

# Source ROS 2 setup files
source "/opt/ros/${ROS_DISTRO}/setup.bash"

exec "$@"