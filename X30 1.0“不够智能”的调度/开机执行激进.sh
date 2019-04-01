su
#经过学习和测试，我发现使用hps锁核动态调节频率的方法会更加智能化，更加省电一些，对于高需求场景的适应能力也更强，对CPU的伤害也更小。
#本次学习主要解决了之前小核满频发热严重，执行大任务时随机卡顿的问题。
#鉴于以上情况，我放弃了之前的所有脚本和修改思路，代码全部进行重写。

#设定interactive为当前调度器
echo interactive > /sys/devices/system/cpu/cpufreq/poliocy0/scaling_governor
echo interactive > /sys/devices/system/cpu/cpufreq/poliocy4/scaling_governor
echo interactive > /sys/devices/system/cpu/cpufreq/poliocy8/scaling_governor
#调节interactive调度器具体参数
#调节升频时延
echo "980000 1145:980000"> /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
#调节升频频率
echo 1769000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
#调节升频所需负载条件
echo 90 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_freq
#调节最小降频间隔
echo 4000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
#调节负载频率对应关系
echo "15 249000:25 449000:30 648000:50 1005000:70 1237000:85 1512000:91 1678000:96" > /sys/devices/system/cpu/cpufreq/interactive/target_load
#调节CPU负载采样间隔
echo 100000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
echo 360000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
#开启CPU提升I/O性能
echo 1 > /sys/devices/system/cpu/cpufreq/io_is_busy

#开启热插拔
echo 1 > /proc/hps/enabled
#开启hps_eas动态调节
echo 1 > /proc/hps/eas_enabled
#限制boost核心数量
echo 1 > /proc/hps/input_boost_cpu_num
echo 0 > /proc/hps/big_task_enabled
#限制加载核心
echo "3 3 1" > /proc/hps/num_limit_low_battery
echo "3 3 1" > /proc/hps/num_limit_power_serv
echo "3 3 1" > /proc/hps/num_limit_thermal
echo "3 3 1" > /proc/hps/num_limit_ultra_power_saving
echo "3 3 1" > /proc/hps/num_base_perf_serv
#设置降频阈值
echo 90 > /proc/hps/down_threshold
#设置降频积极度（千万不能为零，不然重启……）
echo 4 > /proc/hps/down_times
#设置降频阈值
echo 97 > /proc/hps/up_threshold
#设置降频积极度（千万不能为零，不然重启……）
echo 1 > /proc/hps/up_times
#禁用加速
echo 1 > /proc/hps/rush_boost_enabled
echo 1 > /proc/hps/input_boost_enabled
echo 1 > /proc/hps/power_mode
#启用休眠
echo 1 > /proc/hps/suspend_enabled
#以上为/proc/hps文件夹的全部调节。

#修改动态机制
echo 0 > /proc/cpufreq/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_sched_disable
#设置升频阈值
echo 95 > /proc/cpufreq/cpufreq_up_threshold_b
echo 90 > /proc/cpufreq/cpufreq_up_threshold_l
echo 93 > /proc/cpufreq/cpufreq_up_threshold_ll

#gpu用最低频率省电
echo 0 > /proc/gpufreq/gpufreq_opp_freq
echo 166000 > /proc/gpufreq/gpufreq_opp_freq
 #控制杂项
 echo 1 > /sys/power/autosleep
 echo 5000 > /sys/power/pm_freeze_timeout