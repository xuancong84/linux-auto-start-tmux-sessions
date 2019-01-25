#!/bin/bash

session_name=beiwe
cmds=("top"
"your-service-cmdline1"
"your-service-cmdline2"
"your-service-cmdlineN"
)

if [ "`tmux ls | grep $session_name`" ]; then
	echo "The service already started!" >&2
	exit 1
fi

# set screen size to be bigger, otherwise cannot contain too many panes
tmux new-session -s $session_name -d -x 320 -y 80

for i in `seq 0 $[${#cmds[*]}-1]`; do
	sleep 0.5
	tmux split-window
	sleep 0.5
	tmux select-layout tile
	sleep 0.5
	tmux send-keys -l "${cmds[i]}"
	sleep 0.5
	tmux send-keys Enter
done
