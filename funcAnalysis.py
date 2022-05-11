#!/usr/bin/env python

import time
import sys
import numpy as np
import logging

class timer():

	def __init__(self):

		# Timer starts
		self.start_time = time.time()
		self.last_time = self.start_time
		self.lap_num = 1
		self.lap_time = []
		self.total_time = 0

	def reset(self):
		self.start_time = time.time()
		self.last_time = start_time
		self.lap_num = 1
		self.lap_time = []
		self.total_time = 0

	def lap(self):
		# The current lap-time
		self.lap_time.append(round((time.time() - self.last_time), 2))

		# Total time elapsed since the timer started
		self.total_time = round((time.time() - self.start_time), 2)
		# Updating the previous total time and lap number
		self.last_time=time.time()
		self.lap_num+=1

	def log(self):
		lap_time_average = sum(self.lap_time)/len(self.lap_time)

		logging.basicConfig(filename='analysis.log', level=logging.INFO)
		logging.info("  Number of laps: %d", self.lap_num-1)
		logging.info("  Lap Time: ")
		for i in self.lap_time:
			logging.info("            %f ", i)
		logging.info("  Total time:   %f", self.total_time)
		logging.info("  Average time: %f", lap_time_average)

		f1 = open("./data_collection/average_time_for_lap.txt", mode="a")
		f1.write(str(lap_time_average))
		f1.write("\n")
		f1.close()

class analyzer:

	def __init__(self):
		self.timer = timer()
		self.min_dist = []
		self.collecting = True
		self.prevx = -8

	def update(self, R):

		if (R.location.x < -7) and (-5 < R.location.y < -3) and (time.time() - self.timer.last_time > 50):
			
			if self.prevx < -7:
				self.failure("The robot is running in the wrong direction.")

			else:
				self.timer.lap()

		self.prevx = R.location.x

		if self.timer.total_time > 790:
			self.failure("Time expired, the robot is blocked in the circuit.")

		dist = 100
		for token in R.see():
			if token.dist < dist:
				dist = token.dist

		self.min_dist.append(dist)

		if self.timer.lap_num == 4:
			self.log()

	def failure(self, str):
		logging.basicConfig(filename='analysis.log', level=logging.INFO)
		logging.info("  !!!FAILURE!!!: "+str)
		logging.info("---------------------------")
		self.collecting = False

		f1 = open("./data_collection/average_time_for_lap.txt", mode="a")
		f1.write("Nan\n")
		f1.close()

		f2 = open("./data_collection/min_distance_from_obstacle.txt", mode="a")
		f2.write("Nan\n")
		f2.close()

		f3 = open("./data_collection/average_distance_from_obstacle.txt", mode="a")
		f3.write("Nan\n")
		f3.close()

	def log(self):
		min_dist_average = sum(self.min_dist)/len(self.min_dist)
		nearest_obstacle = min(self.min_dist)

		logging.basicConfig(filename='analysis.log', level=logging.INFO)
		self.timer.log()
		logging.info("  Minimum distance from obstacles: %f", nearest_obstacle)
		logging.info("  Average distance from obstacles: %f", min_dist_average)

		logging.info("---------------------------")
		self.collecting = False

		f2 = open("./data_collection/min_distance_from_obstacle.txt", mode="a")
		f2.write(str(nearest_obstacle))
		f2.write("\n")
		f2.close()

		f3 = open("./data_collection/average_distance_from_obstacle.txt", mode="a")
		f3.write(str(min_dist_average))
		f3.write("\n")
		f3.close()


		