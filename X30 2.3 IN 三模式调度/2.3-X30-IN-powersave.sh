su
#2.3版本更新，根据酷友的反馈，做三模式切换版，做一些极限版。
#开始时间：2019年4月6日 19：34
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
echo 2318000 > /sys/devices/system/cpu/cpufreq/policy8/scaling_max_freq
echo 1818000 > /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq
echo 1512000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo 1000 > /sys/devices/system/cpu/power/autosuspend_delay_ms
#调节interactive调度器具体参数
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpufreq/interactive/boost
#调节升频时延
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo "98000 1145000:108000 1237000:128000 1347000:138000 1421000:138000 1512000:138000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
#调节升频频率
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo 1347000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
#调节升频所需负载条件
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_freq
echo 95 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_freq
#调节最小降频间隔
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo 8000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
#调节负载频率对应关系
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/target_loads
echo "15 249000:25 449000:35 648000:55 1005000:75 1237000:85 1421000:91 1604000:99 25 484000:35 687000:45 1053000:50 1200000:60 1472000:70 1571000:85 1917000:91 2197000:99 15 328000:25 771000:35 1169000:45 1475000 50 1766000:70 2057000:85 2318000:91 2408000:99" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
#调节CPU负载采样间隔
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/timer_slack
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 80000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
echo 80000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
#开启CPU提升I/O性能
chmod 0777 /sys/devices/system/cpu/cpufreq/io_is_busy
echo 0 > /sys/devices/system/cpu/cpufreq/io_is_busy


#开启hps_eas动态调节
echo 1 > /proc/hps/eas_enabled
#限制基本核心数量
chmod 0777 /proc/hps/num_base_perf_serv
echo "2 2 1" > /proc/hps/num_base_perf_serv
#限制boost核心数量
chmod 0777 /proc/hps/input_boost_cpu_num
chmod 0777 /proc/hps/big_task_enabled
chmod 0777 /proc/hps/heavy_task_enabled
echo 0 > /proc/hps/input_boost_cpu_num
echo 0 > /proc/hps/big_task_enabled
echo 0 > /proc/hps/heavy_task_enabled
#设置降频阈值
chmod 0666 /proc/hps/down_threshold
echo 40 > /proc/hps/down_threshold
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
echo 0 > /proc/hps/idle_threshold
echo 1 > /proc/hps/idle_det_enabled
echo 0 > /proc/hps/rush_boost_enabled
echo 0 > /proc/hps/input_boost_enabled
echo 0 > /proc/hps/power_mode
#启用休眠
chmod 0666 /proc/hps/suspend_enabled
chmod 0666 /proc/hps/smart_det_enabled
chmod 0666 /sys/power/autosleep
chomd 0666 /sys/power/pm_freeze_timeout
echo 1 > /proc/hps/suspend_enabled
echo 0 > /proc/hps/smart_det_enabled
echo 1 > /sys/power/autosleep
echo 2000 > /sys/power/pm_freeze_timeout

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
echo 99 > /proc/cpufreq/cpufreq_up_threshold_b
echo 99 > /proc/cpufreq/cpufreq_up_threshold_l
echo 99 > /proc/cpufreq/cpufreq_up_threshold_ll
echo 0 > /proc/cpufreq/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_turbo_mode

#修改不同场景核心开启情况
#（默认分配更好，故不做修改）

#调节默认核心idx
chmod 0777 /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
chmod 0777 /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
chmod 0777 /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
chomd 0777 /proc/cpufreq/cpufreq_oppidx
echo 7 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
echo 5 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
echo 5 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
echo 5 > /proc/cpufreq/cpufreq_oppidx

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
echo 0 > /sys/module/ged/parameters/enabled_cpu_boost
echo 0 > /sys/module/ged/parameters/enabled_gpu_boost
echo 0 > /sys/module/ged/parameters/gx_3D_benchmark_on
echo 0 > /sys/module/ged/parameters/gx_game_mode
echo 30 > /sys/module/ged/parameters/gx_dfps
echo 0 > /sys/module/ged/parameters/gx_force_cpu_boost
echo 0 > /sys/module/ged/parameters/boost_amp
echo 0 > /sys/module/ged/parameters/boost_extra

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
echo "13 0" > /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
echo "13 0" > /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
echo "13 315000" > /proc/gpufreq/gpufreq_limited_power
echo "13 0" > /proc/gpufreq/gpufreq_limited_thermal_ignore
echo 1 > /proc/gpufreq/gpufreq_volt_enable
echo 315000 > /proc/gpufreq/gpufreq_opp_max_freq
echo 166000 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_input_boost
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
#完成日期：2019年4月6日 19:54