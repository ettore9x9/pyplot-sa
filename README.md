Statistical Analysis comparing two autonomous robots
====================================================

Statistical analysis of the first assignment of research track 1 course, considering two different implementations of the behavior.

The goal of this assignment is to find out which one of the two implementations performs better in terms of:
* Average time to complete one lap.
* Overall minimum distance from obstacles.
* Average distance from obstacles.
* Percentage of failures, e. g., robot crashes, robot going in the wrong directions, robot blocked in the circuit.

The two implementations are:
* `my_controller.py`
* `given_controller.py`

You can run them separately with:
```bash
$ python2 run.py my_controller.py
```
```bash
$ python2 run.py given_controller.py
```

Data collection
---------------

The bash file `run.sh` performs the data collection autonomously, without user action.

You can run the data collection (it takes about 18h) simply with:
```bash
$ ./run.sh
```
In detail, it runs the robot implementations 40 times each, for three laps each run. Every couple of tests, it changes the arena. Evry arena has a different location of silver tokens.

All the 40 arenas are stored in the folder `./sr/robot/arenas/arenas_for_statistical_analysis`, the first arena is the default one.

All the code needed to extract data from every run is in the python script: `funcAnalysis.py`, in particular:
* The `timer` class takes care of keeping the time of each lap.
* The `analyzer` class records the minimum distance from obstacles, detects the end of the lap, and reports failures.

The folder `data_collection` stores all data extracted. If you need a more verbose output, you can look at the file `analysis.log`: which reports all the steps performed py the `run.sh`.

The robot fails if it comes back in the wrong direction of if it remains blocked in the circuit. In this cases the measurements can be falsed, so it is better to discard the data. In particular:
* If the robot is blocked in the circuit, the average distance is falsed.
* If the robot performs only one lap, the average time of a lap is fased.
In this situation the data are discarded because considered corrupted.

Statistical analysis
--------------------

### Average distance from obstacles ###

<p align="center">
<img src="https://github.com/ettore9x9/rt2_statistical_analysis/blob/master/images/avg_dist.png" width=50% height=50%>
</p>

If we consider the difference for each instance of the test we obtain the following distribution.

<p align="center">
<img src="https://github.com/ettore9x9/rt2_statistical_analysis/blob/master/images/avg_dist_diff.png" width=50% height=50%>
</p>

To use the **paired ttest**, the difference of distancies must follow a normal distribution. To test if it is the case, we can use the **Shapiro-Wilk test**, designed specifically for small number of data.

>Null hypothesis: *the differences of the average distances follow a normal distribution*
>
>Results: 
>+ *H = 0*, 
>+ *p = 0.210160*
>
>We failed to reject the null hypotesis.




### Average time of a lap ###

<p align="center">
<img src="https://github.com/ettore9x9/rt2_statistical_analysis/blob/master/images/lap_times.png" width=50% height=50%>
</p>

<p align="center">
<img src="https://github.com/ettore9x9/rt2_statistical_analysis/blob/master/images/lap_time_diff.png" width=50% height=50%>
</p>

### Minimum distance from obstacles ###

<p align="center">
<img src="https://github.com/ettore9x9/rt2_statistical_analysis/blob/master/images/min_dist.png" width=50% height=50%>
</p>

<p align="center">
<img src="https://github.com/ettore9x9/rt2_statistical_analysis/blob/master/images/min_dist_diff.png" width=50% height=50%>
</p>


Conclusions
-----------