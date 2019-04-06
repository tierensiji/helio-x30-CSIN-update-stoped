su
#2.3版本更新，根据酷友的反馈，做三模式切换版，做一些极限版。
#开始时间：2019年4月6日 21:10
#作者：铁人司机——一个热爱安卓代码的北中医学生。

#开启热插拔
echo 1 > /proc/hps/enabled
#设定interactive为当前调度器
chmod 0666 /sys/devices/system/cpu/cpufreq/poliocy0/scaling_governor
chmod 0666 /sys/devices/system/cpu/cpufreq/poliocy4/scaling_governor
chmod 0666 /sys/devices/system/cpu/cpufreq/poliocy8/scaling_governor
echo interactive > /sys/devices/system/cpu/cpufreq/poliocy0/scaling_governor
echo interactive > /sys/devices/system/cpu/cpufreq/poliocy4/scaling_governor
echo interactive > /sys/devices/system/cpu/cpufreq/poliocy8/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu8/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu9/cpufreq/scaling_governor
chmod 0777 /sys/devices/system/cpu/cpufreq/policy8/scaling_min_freq
chmod 0777 /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq
chmod 0777 /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
chmod 0777 /sys/devices/system/cpu/cpufreq/policy8/scaling_max_freq
chmod 0777 /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq
chmod 0777 /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
chmod 0777 /sys/devices/system/cpu/power/autosuspend_delay_ms
echo 328000 > /sys/devices/system/cpu/cpufreq/policy8/scaling_min_freq
echo 279000 > /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq
echo 249000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
echo 2600000 > /sys/devices/system/cpu/cpufreq/policy8/scaling_max_freq
echo 2197000 > /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq
echo 1898000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo 1000 > /sys/devices/system/cpu/power/autosuspend_delay_ms
#调节interactive调度器具体参数
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpufreq/interactive/boost
#调节升频时延
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo "78000 1145000:88000 98000:128000 1347000:108000 1421000:108000 1512000:108000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
#调节升频频率
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo 1347000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
#调节升频所需负载条件
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_freq
echo 95 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_freq
#调节最小降频间隔
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo 10000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
#调节负载频率对应关系
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/target_loads
echo "15 249000:25 648000:35 830000:55 1145000:75 1347000:85 1512000:91 1678000:99 25 484000:35 687000:45 1200000:50 1571000:60 1818000:70 2040000:85 2117000:91 2157000:99 15 328000:25 771000:35 1329000:45 1766000 50 2057000:70 2318000:85 2408000:91 2452000:99" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
#调节CPU负载采样间隔
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/timer_slack
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
#开启CPU提升I/O性能
chmod 0777 /sys/devices/system/cpu/cpufreq/io_is_busy
echo 0 > /sys/devices/system/cpu/cpufreq/io_is_busy


#开启hps_eas动态调节
echo 1 > /proc/hps/eas_enabled
#限制基本核心数量
chmod 0777 /proc/hps/num_base_perf_serv
echo "3 3 1" > /proc/hps/num_base_perf_serv
#限制boost核心数量
chmod 0777 /proc/hps/input_boost_cpu_num
chmod 0777 /proc/hps/big_task_enabled
chmod 0777 /proc/hps/heavy_task_enabled
echo 1 > /proc/hps/input_boost_cpu_num
echo 1 > /proc/hps/big_task_enabled
echo 0 > /proc/hps/heavy_task_enabled
#设置降频阈值
chmod 0666 /proc/hps/down_threshold
echo 50 > /proc/hps/down_threshold
#设置降频积极度（千万不能为零，不然重启……）
chmod 0666 /proc/hps/down_times
echo 4 > /proc/hps/down_times
#设置升频阈值
chmod 0666 /proc/hps/up_threshold
echo 60 > /proc/hps/up_threshold
#设置升频积极度（千万不能为零，不然重启……）
chmod 0666 /proc/hps/up_times
echo 6 > /proc/hps/up_times
#禁用加速
chmod 0666 /proc/hps/idle_threshold
chomd 0666 /proc/hps/idle_det_enabled
chmod 0666 /proc/hps/rush_boost_enabled
chmod 0666 /proc/hps/input_boost_enabled
chmod 0666 /proc/hps/power_mode
echo 5 > /proc/hps/idle_threshold
echo 1 > /proc/hps/idle_det_enabled
echo 0 > /proc/hps/rush_boost_enabled
echo 1 > /proc/hps/input_boost_enabled
echo 0 > /proc/hps/power_mode
#启用休眠
chmod 0666 /proc/hps/suspend_enabled
chmod 0666 /proc/hps/smart_det_enabled
chmod 0666 /sys/power/autosleep
chomd 0666 /sys/power/pm_freeze_timeout
echo 1 > /proc/hps/suspend_enabled
echo 0 > /proc/hps/smart_det_enabled
echo 1 > /sys/power/autosleep
echo 3000 > /sys/power/pm_freeze_timeout

#修改动态机制
#echo 0 > /proc/cpufreq/cpufreq_sched_disable
#echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_sched_disable
#echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_sched_disable
#echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_sched_disable
#echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_sched_disable
#设置升频阈值
chmod 0666 /proc/cpufreq/cpufreq_up_threshold_b
chmod 0666 /proc/cpufreq/cpufreq_up_threshold_l
chmod 0666 /proc/cpufreq/cpufreq_up_threshold_ll
echo 93 > /proc/cpufreq/cpufreq_up_threshold_b
echo 93 > /proc/cpufreq/cpufreq_up_threshold_l
echo 93 > /proc/cpufreq/cpufreq_up_threshold_ll
echo 0 > /proc/cpufreq/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_turbo_mode
#修改不同场景核心开启情况
chmod 0777  /dev/cpuset/background/cpus
chmod 0777  /dev/cpuset/background/effective_cpus
chmod 0777  /dev/cpuset/background/cpus_exclusive
chmod 0777  /dev/cpuset/background/sched_load_balance

echo "0-3" > /dev/cpuset/background/cpus
echo "0-3" > /dev/cpuset/background/effective_cpus
echo 0 > /dev/cpuset/background/cpus_exclusive
echo 0 > /dev/cpuset/background/sched_load_balance

chmod 0777  /dev/cpuset/foreground/cpus
chmod 0777  /dev/cpuset/foreground/effective_cpus
chmod 0777  /dev/cpuset/foreground/cpus_exclusive
chmod 0777  /dev/cpuset/foreground/sched_load_balance

echo "4-7" > /dev/cpuset/foreground/cpus
echo "4-7" > /dev/cpuset/foreground/effective_cpus
echo 0 > /dev/cpuset/foreground/cpus_exclusive
echo 0 > /dev/cpuset/foreground/sched_load_balance

chmod 0777  /dev/cpuset/foreground/boost/cpus
chmod 0777  /dev/cpuset/foreground/boost/effective_cpus
chmod 0777  /dev/cpuset/foreground/boost/cpus_exclusive
chmod 0777  /dev/cpuset/foreground/boost/sched_load_balance

echo "8-9"> /dev/cpuset/foreground/boost/cpus
echo "8-9" > /dev/cpuset/foreground/boost/effective_cpus
echo 0 > /dev/cpuset/foreground/boost/cpus_exclusive
echo 0 > /dev/cpuset/foreground/boost/sched_load_balance

chmod 0777  /dev/cpuset/mzperf_cancel/cpus
chmod 0777  /dev/cpuset/mzperf_cancel/effective_cpus
chmod 0777  /dev/cpuset/mzperf_cancel/cpus_exclusive
chmod 0777  /dev/cpuset/mzperf_cancel/sched_load_balance

echo "0-3" > /dev/cpuset/mzperf_cancel/cpus
echo "0-3" > /dev/cpuset/mzperf_cancel/effective_cpus
echo 1 > /dev/cpuset/mzperf_cancel/cpus_exclusive
echo 1 > /dev/cpuset/mzperf_cancel/sched_load_balance

chmod 0777  /dev/cpuset/mzperf_ctrl/cpus
chmod 0777  /dev/cpuset/mzperf_ctrl/effective_cpus
chmod 0777  /dev/cpuset/mzperf_ctrl/cpus_exclusive
chmod 0777  /dev/cpuset/mzperf_ctrl/sched_load_balance

echo "0-3" > /dev/cpuset/mzperf_ctrl/cpus
echo "0-3" > /dev/cpuset/mzperf_ctrl/effective_cpus
echo 1 > /dev/cpuset/mzperf_ctrl/cpus_exclusive
echo 1 > /dev/cpuset/mzperf_ctrl/sched_load_balance

chmod 0777  /dev/cpuset/system-background/cpus
chmod 0777  /dev/cpuset/system-background/effective_cpus
chmod 0777  /dev/cpuset/system-background/cpus_exclusive
chmod 0777  /dev/cpuset/system-background/sched_load_balance

echo "0-3" > /dev/cpuset/system-background/cpus
echo "0-3" > /dev/cpuset/system-background/effective_cpus
echo 1 > /dev/cpuset/system-background/cpus_exclusive
echo 1 > /dev/cpuset/system-background/sched_load_balance

chmod 0777  /dev/cpuset/top-app/cpus
chmod 0777  /dev/cpuset/top-app/effective_cpus
chmod 0777  /dev/cpuset/top-app/cpus_exclusive
chmod 0777  /dev/cpuset/top-app/sched_load_balance

echo "4-8" > /dev/cpuset/top-app/cpus
echo "4-8" > /dev/cpuset/top-app/effective_cpus
echo 0 > /dev/cpuset/top-app/cpus_exclusive
echo 0 > /dev/cpuset/top-app/sched_load_balance

chmod 0777  /dev/cpuset/cpus
chmod 0777  /dev/cpuset/effective_cpus
chmod 0777  /dev/cpuset/cpus_exclusive
chmod 0777  /dev/cpuset/sched_load_balance

echo "0-9" > /dev/cpuset/cpus
echo "0-9" > /dev/cpuset/effective_cpus
echo 0 > /dev/cpuset/cpus_exclusive
echo 0 > /dev/cpuset/sched_load_balance

#调节默认核心idx
chmod 0777 /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
chmod 0777 /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
chmod 0777 /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
chomd 0777 /proc/cpufreq/cpufreq_oppidx
echo 7 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
echo 2 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
echo 2 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
echo 2 > /proc/cpufreq/cpufreq_oppidx

chmod 0777 >/proc/hps/pwrseq
echo "0 1 2" >/proc/hps/pwrseq

chmod 0666 /sys/module/ged/parameters/enabled_cpu_boost
chmod 0666 /sys/module/ged/parameters/enabled_gpu_boost
chmod 0666 /sys/module/ged/parameters/gx_3D_benchmark_on
chmod 0666 /sys/module/ged/parameters/gx_game_mode
chmod 0777 /sys/module/ged/parameters/gx_dfps
chmod 0666 /sys/module/ged/parameters/gx_force_cpu_boost
chmod 0666 /sys/module/ged/parameters/boost_amp
chmod 0666 /sys/module/ged/parameters/boost_extra
echo 1 > /sys/module/ged/parameters/enabled_cpu_boost
echo 1 > /sys/module/ged/parameters/enabled_gpu_boost
echo 0 > /sys/module/ged/parameters/gx_3D_benchmark_on
echo 0 > /sys/module/ged/parameters/gx_game_mode
echo 30 > /sys/module/ged/parameters/gx_dfps
echo 0 > /sys/module/ged/parameters/gx_force_cpu_boost
echo 0 > /sys/module/ged/parameters/boost_amp
echo 1 > /sys/module/ged/parameters/boost_extra

#设置gpu压制
chmod 0666 /proc/gpufreq/gpufreq_debug
chmod 0666 /proc/gpufreq/gpufreq_debug
chmod 0777 /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
chmod 0777 /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
chmod 0777 /proc/gpufreq/gpufreq_limited_power
chmod 0777 /proc/gpufreq/gpufreq_limited_thermal_ignore
chmod 0777 /proc/gpufreq/gpufreq_volt_enable
chmod 0777 /proc/gpufreq/gpufreq_opp_max_freq
chmod 0777 /proc/gpufreq/gpufreq_opp_freq
chmod 0777 /proc/gpufreq/gpufreq_input_boost
chmod 0777 /d/ged/hal/fps_upper_bound
echo "8 0" > /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
echo "8 0" > /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
echo "8 570000" > /proc/gpufreq/gpufreq_limited_power
echo "8 0" > /proc/gpufreq/gpufreq_limited_thermal_ignore
echo 1 > /proc/gpufreq/gpufreq_volt_enable
echo 570000 > /proc/gpufreq/gpufreq_opp_max_freq
echo 166000 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_opp_freq
echo 1 > /proc/gpufreq/gpufreq_input_boost
echo 30 > /d/ged/hal/fps_upper_bound

开启ksm
busybox mkdir /sys/kernel/mm/ksm
busybox touch /sys/kernel/mm/ksm/run
echo 1 > /sys/kernel/mm/ksm/run
开启zram
echo 256m > /sys/block/zram0/disksize
busybox mkswap /dev/block/zram0
busybox swapon /dev/block/zram0
echo 30 > /proc/sys/vm/swappiness

#开启doze
#关闭Doze模式
#dumpsys deviceidle disable 
#查看Doze模式白名单
#dumpsys deviceidle whitelist +com.tencent.mm 
#dumpsys deviceidle whitelist +com.tencent.mobileqq  
#dumpsys deviceidle whitelist +com.meizu.flyme.service.find 
#启用Doze模式
#dumpsys deviceidle enable
#dumpsys deviceidle force-idle
#dumpsys battery unplug 
#am set-inactive 


#BY 铁人司机
#完成日期：2019年4月6日 19:25