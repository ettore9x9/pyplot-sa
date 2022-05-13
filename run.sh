#!/bin/bash

new_arena=""

for i in {1..40}
do
	rm sr/robot/arenas/sunny_side_up_arena.pyc
	new_arena="sr/robot/arenas/arenas_for_statistical_analysis/sunny_side_up_arena${i}.py"
	cp $new_arena sr/robot/arenas/sunny_side_up_arena.py

	echo -e "--------------------------- \n TEST NUMBER ${i} with my_controller.py" >> analysis.log
	python2 run.py my_controller.py &
	sleep 800
	kill -9 $!

	echo -e "--------------------------- \n TEST NUMBER ${i} with given_controller.py" >> analysis.log
	python2 run.py given_controller.py &
	sleep 800
	kill -9 $!
done