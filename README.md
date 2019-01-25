# linux-auto-start-tmux-sessions
Bash script template for auto-start services in tmux sessions upon server boot up.

This script will create a headless tmux session, and for each service create a new pane and run the service inside the pane. 
You can put any number of services (i.e., your-service-cmdlineN) in the bash array.

To run the script automatically each time the server boots up, add the following line in /etc/rc.local
`su -l username -c ./start-services-in-tmux.sh`
