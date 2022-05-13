avg_dist = importdata("average_distance_from_obstacle.txt");
my_avg_dist = avg_dist(1:2:end);
given_avg_dist = avg_dist(2:2:end);

min_dist = importdata("min_distance_from_obstacle.txt");
my_min_dist = min_dist(1:2:end);
given_min_dist = min_dist(2:2:end);

lap_time = importdata("average_time_for_lap.txt");
my_lap_time = lap_time(1:2:end);
given_lap_time = lap_time(2:2:end);
given_lap_time(end+1) = NaN;