close all
clear
addpath '.\Shapiro-Wilk and Shapiro-Francia normality tests'
filter_data

figure
hold on
histfit(my_avg_dist)
histfit(gv_avg_dist)
xlabel("average distance from obstacles [m]")
ylabel("number of occurrences")
title("Average distancies")
legend("my\_controller", "fitted normal density", "given\_controller")
hold off

figure
hold on
histfit(my_avg_dist_p - gv_avg_dist_p)
xlabel("difference of average distance from obstacles [m]")
ylabel("number of occurrences")
title("Difference of average distancies")
legend("difference", "fitted normal density")
hold off

figure
hold on
histogram(my_min_dist)
histogram(gv_min_dist)
xlabel("minimum distance from obstacles [m]")
ylabel("number of occurrences")
title("Minimum distancies")
legend("my\_controller", "given\_controller")
hold off

figure
hold on
histogram(my_min_dist_p - gv_min_dist_p)
xlabel("difference of minimun distance from obstacles [m]")
ylabel("number of occurrences")
title("Difference of minimum distancies")
legend("difference")
hold off

figure
hold on
histfit(my_lap_time)
histfit(gv_lap_time)
xlabel("lap times [s]")
ylabel("number of occurrences")
title("Lap times")
legend("my\_controller", "fitted normal density", "given\_controller")
hold off

figure
hold on
histfit(my_lap_time_p - gv_lap_time_p)
xlabel("difference of lap times [s]")
ylabel("number of occurrences")
title("Difference of lap times")
legend("difference", "fitted normal density")
hold off

fprintf("\nShapiro-Wilk test for average distancies:---------------------------\n")
fprintf("Null hypothesis: the differences of the average distancies follow a normal distribution.\n")
[H_sw_dist, P_sw_dist, W_sw_dist] = swtest(my_avg_dist_p - gv_avg_dist_p);
fprintf("H = %d, p = %f\n", H_sw_dist, P_sw_dist)
fprintf("We failed to reject the null hypotesis.\n")

fprintf("\nPaired ttest for average distancies:---------------------------\n")
fprintf("Null hypothesis: the two samples of average distances are drawn from the same population.\n")
[H_tt_dist, P_tt_dist, CI_tt_dist, STATS_tt_dist] = ttest(my_avg_dist_p, gv_avg_dist_p);
fprintf("H = %d, p = %f\n", H_tt_dist, P_tt_dist)
fprintf("We can reject the null hypothesis.\n")

fprintf("\nShapiro-Wilk test for minimum distancies:---------------------------\n")
fprintf("Null hypothesis: the differences of the minimum distancies follow a normal distribution.\n")
[H_sw_min, P_sw_min, W_sw_min] = swtest(my_min_dist_p - gv_min_dist_p);
fprintf("H = %d, p = %f\n", H_sw_min, P_sw_min)
fprintf("We can reject the null hypothesis.\n")

fprintf("\nU-test for minimum distancies:---------------------------\n")
fprintf("Null hypothesis: the two samples of minimum distances are drawn from the same population.\n")
[P_rs_min, H_rs_min, STATS_rs_min] = ranksum(my_min_dist_p, gv_min_dist_p);
fprintf("H = %d, p = %f\n", H_rs_min, P_rs_min)
fprintf("We can reject the null hypothesis.\n")

fprintf("\nShapiro-Wilk test for lap times:---------------------------\n")
fprintf("Null hypothesis: the differences of the lap times follow a normal distribution.\n")
[H_sw_lap, P_sw_lap, W_sw_lap] = swtest(my_lap_time_p - gv_lap_time_p);
fprintf("H = %d, p = %f\n", H_sw_lap, P_sw_lap)
fprintf("We failed to reject the null hypotesis.\n")

fprintf("\nPaired ttest for lap times:---------------------------\n")
fprintf("Null hypothesis: the two samples of lap times are drawn from the same population.\n")
[H_tt_time, P_tt_time, CI_tt_time, STATS_tt_time] = ttest(my_lap_time_p, gv_lap_time_p);
fprintf("H = %d, p = %f\n", H_tt_time, P_tt_time)
fprintf("We can reject the null hypothesis.\n")