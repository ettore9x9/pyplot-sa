avg_dist = importdata("./data_collection/average_distance_from_obstacle.txt");
my_avg_dist = avg_dist(1:2:end);
gv_avg_dist = avg_dist(2:2:end);

min_dist = importdata("./data_collection/min_distance_from_obstacle.txt");
my_min_dist = min_dist(1:2:end);
gv_min_dist = min_dist(2:2:end);

lap_time = importdata("./data_collection/average_time_for_lap.txt");
my_lap_time = lap_time(1:2:end);
gv_lap_time = lap_time(2:2:end);
gv_lap_time(end+1) = NaN;

my_avg_dist_p = my_avg_dist ;
gv_avg_dist_p = gv_avg_dist ;
my_avg_dist_p(isnan(gv_avg_dist_p))=[];
gv_avg_dist_p(isnan(gv_avg_dist_p))=[];

my_min_dist_p = my_min_dist ;
gv_min_dist_p = gv_min_dist ;
my_min_dist_p(isnan(gv_min_dist_p))=[];
gv_min_dist_p(isnan(gv_min_dist_p))=[];

my_lap_time_p = my_lap_time ;
gv_lap_time_p = gv_lap_time ;
my_lap_time_p(isnan(gv_lap_time_p))=[];
gv_lap_time_p(isnan(gv_lap_time_p))=[];

writematrix(my_avg_dist, "./data_collection/filtered_data/average_distance/mine.txt")
writematrix(gv_avg_dist, "./data_collection/filtered_data/average_distance/given.txt")
writematrix(my_avg_dist_p, "./data_collection/filtered_data/average_distance/paired/mine.txt")
writematrix(gv_avg_dist_p, "./data_collection/filtered_data/average_distance/paired/given.txt")

writematrix(my_min_dist, "./data_collection/filtered_data/minimum_distance/mine.txt")
writematrix(gv_min_dist, "./data_collection/filtered_data/minimum_distance/given.txt")
writematrix(my_min_dist_p, "./data_collection/filtered_data/minimum_distance/paired/mine.txt")
writematrix(gv_min_dist_p, "./data_collection/filtered_data/minimum_distance/paired/given.txt")

writematrix(my_lap_time, "./data_collection/filtered_data/time_of_a_lap/mine.txt")
writematrix(gv_lap_time, "./data_collection/filtered_data/time_of_a_lap/given.txt")
writematrix(my_lap_time_p, "./data_collection/filtered_data/time_of_a_lap/paired/mine.txt")
writematrix(gv_lap_time_p, "./data_collection/filtered_data/time_of_a_lap/paired/given.txt")