#!/bin/bash

# Define variables
APP_NAME="Unix"
APP_DIR="/Users/alexgrodetskiy/Desktop/Unix"
APP_PORT="5000"

# Define functions
start_app() {
    echo "Starting $APP_NAME..."
    cd $APP_DIR
    nohup python3 app.py >/dev/null 2>&1 &
    echo "Started $APP_NAME."
}

stop_app() {
    echo "Stopping $APP_NAME..."
    pkill -f "python3 app.py"
    echo "Stopped $APP_NAME."
}

restart_app() {
    stop_app
    start_app
}

# Check command line argument
if [ "$1" == "start" ]; then
    start_app
elif [ "$1" == "stop" ]; then
    stop_app
elif [ "$1" == "restart" ]; then
    restart_app
else
    echo "Usage: deploy.sh [start|stop|restart]"
fi
