echo 0 > /proc/gpufreq/gpufreq_opp_freq
#echo 237000 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_input_boost
echo "g_limited_max_id = 13, limit frequency = 315000" > /proc/gpufreq/gpufreq_limited_power
#echo 315000 > /proc/gpufreq/gpufreq_opp_max_freq