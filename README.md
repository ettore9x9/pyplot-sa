Statistical Analysis comparing two autonomous robots
====================================================

>Statistical analysis of the first assignment of research track 1 course, considering two different implementations of the behavior.
>The goal of this assignment is to find out which one of the two implementations performs better in terms of:
* Average time to complete one lap.
* Overall minimum distance from obstacles.
* Average distance from obstacles.
* Percentage of failures, e. g., robot crashes, a robot going in the wrong directions, robot blocked in the circuit.

>The two implementations are:
* `my_controller.py`
* `given_controller.py`

>You can run them separately with:
```bash
$ python2 run.py my_controller.py
```
```bash
$ python2 run.py given_controller.py
```

Data collection
---------------

>The bash file `run.sh` performs the data collection autonomously, without user action.
>You can run the data collection (it takes about 13h) simply with:
```bash
$ ./run.sh
```
>In detail, it runs the robot implementations 30 times each, for three laps each run. Every couple of tests, it changes the arena, particularly the position of the silver tokens.
>All the 30 arenas are stored in the folder `./sr/robot/arenas/arenas_for_statistical_analysis`, the first arena is the default one.

>All the code needed to extract data from every run is in the python script: `funcAnalysis.py`, in particular:
* The `timer` class takes care of keeping the time of each lap.
* The `analyzer` class records the minimum distance from obstacles, detects the end of the lap, and reports failures.

>The folder `data_collection` stores all data extracted. If you need a more verbose output, you can look at the file `analysis.log`: which reports all the steps performed py the `run.sh`.

!!!! when the robot is blocked in the circuit, the average distance is falsed

Statistical analysis
--------------------


Conclusions
-----------