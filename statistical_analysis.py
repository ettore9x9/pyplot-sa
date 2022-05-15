from matplotlib import pyplot as plt




def readData(fileName):
        fileObj = open(fileName, "r") #opens the file in read mode
        data = fileObj.read().splitlines() #puts the file into an array
        fileObj.close()
        return data


my_avg_dist = readData("./data_collection/filtered_data/average_distance/mine.txt")
gv_avg_dist = readData("./data_collection/filtered_data/average_distance/given.txt")

my_min_dist = readData("./data_collection/filtered_data/minimum_distance/mine.txt")
gv_min_dist = readData("./data_collection/filtered_data/minimum_distance/given.txt")

my_lap_time = readData("./data_collection/filtered_data/time_of_a_lap/mine.txt")
gv_lap_time = readData("./data_collection/filtered_data/time_of_a_lap/given.txt")

_, bins, _ = plt.hist(my_avg_dist)

plt.plot()