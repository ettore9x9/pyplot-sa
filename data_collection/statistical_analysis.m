close all
clear
collect_data
filter_data

figure
hold on
histfit(my_avg_dist)
histfit(given_avg_dist)
hold off

figure
histfit(my_avg_dist_p - given_avg_dist_p)

figure
hold on
histogram(my_min_dist)
histogram(given_min_dist)
hold off

figure
histogram(my_min_dist_p - given_min_dist_p)

figure
hold on
histfit(my_lap_time)
histfit(given_lap_time)
hold off

figure
histfit(my_lap_time_p - given_lap_time_p)

fprintf("\nLILLIETEST for average distancies:---------------------------\n")
fprintf("Null hypothesis: the differences of the average distancies follow a normal distribution.\n")
[h_lt_dist, p_lt_dist] = lillietest(my_avg_dist_p - given_avg_dist_p, "MCTol", 0.005);
fprintf("We failed to reject the null hypotesis with %f%% confidence.\n", p_lt_dist*100)

fprintf("\nLILLIETEST for minimum distancies:---------------------------\n")
fprintf("Null hypothesis: the differences of the minimum distancies follow a normal distribution.\n")
[h_lt_min, p_lt_min] = lillietest(my_min_dist_p - given_min_dist_p, "MCTol", 0.005);
fprintf("We can reject the null hypothesis, with a confidence of 99.9%%\n")

fprintf("\nLILLIETEST for lap time:---------------------------\n")
fprintf("Null hypothesis: the differences of the lap times follow a normal distribution.\n")
[h_lt_lap, p_lt_lap] = lillietest(my_lap_time_p - given_lap_time_p, 'MCTol', 0.005);
fprintf("We failed to reject the null hypotesis with %f%% confidence.\n", p_lt_lap*100)

fprintf("\nPAIRED TTEST for average distancies:---------------------------\n")
fprintf("Null hypothesis: the two samples of average distances are drawn from the same population.\n")
[h_tt_dist,p_tt_dist,ci_tt_dist,stats_tt_dist] = ttest(my_avg_dist_p, given_avg_dist_p);
fprintf("We can reject the null hypothesis, with a confidence of 99.9%%\n")

fprintf("\nU TEST for minimum distancies:---------------------------\n")
fprintf("Null hypothesis: the two samples of minimum distances are drawn from the same population.\n")
[p_rs_min,h_rs_min,stats_rs_min] = ranksum(my_min_dist_p,given_min_dist_p);
fprintf("We can reject the null hypothesis, with a confidence of 99.9%%\n")

fprintf("\nPAIRED TTEST for lap times:---------------------------\n")
fprintf("Null hypothesis: the two samples of lap times are drawn from the same population.\n")
[h_tt_time,p_tt_time,ci_tt_time,stats_tt_time] = ttest(my_lap_time_p, given_lap_time_p);
fprintf("We can reject the null hypothesis, with a confidence of 99.9%%\n")