su
#经过学习和测试，我发现使用hps锁核动态调节频率的方法会更加智能化，更加省电一些，对于高需求场景的适应能力也更强，对CPU的伤害也更小。
#本次学习主要解决了之前小核满频发热严重，执行大任务时随机卡顿的问题。
#鉴于以上情况，我放弃了之前的所有脚本和修改思路，代码全部进行重写。

#锁核
echo 0 > /proc/hps/enabled

#关闭多余核心，并用tasker设置区间轮流，避免过度使用单个核心。
#经测试，新方案中，双A53+A35是最佳搭配，基本能胜任各种场景。
echo 0 > /sys/devices/system/cpu/cpu0/online
echo 0 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo 1 > /sys/devices/system/cpu/cpu4/online
echo 1 > /sys/devices/system/cpu/cpu5/online
echo 1 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu7/online
echo 0 > /sys/devices/system/cpu/cpu8/online
echo 0 > /sys/devices/system/cpu/cpu9/online


echo 0 > /proc/gpufreq/gpufreq_opp_freq
#echo 237000 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_input_boost
echo "g_limited_max_id = 15, limit frequency = 166000" > /proc/gpufreq/gpufreq_limited_power
echo 166000 > /proc/gpufreq/gpufreq_opp_max_freq
