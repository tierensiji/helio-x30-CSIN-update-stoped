su
#2.5内测版，加入联发科底层核心控制，强力一键710。
#作者：铁人司机————一个热爱安卓代码的北中医学生。

#一款优秀的调度首先体现在核心控制上，滑稽
#内测版暂时不做代码解释，节约时间，以最快速度，全力投入开发
echo "-1" > /proc/ppm/root_cluster
echo 0 > /proc/ppm/policy/hica_is_limit_big_freq
echo "0 2" > /proc/ppm/policy/userlimit_min_cpu_core
echo "1 0" > /proc/ppm/policy/userlimit_min_cpu_core
echo "2 0" > /proc/ppm/policy/userlimit_min_cpu_core
echo "0 4" > /proc/ppm/policy/userlimit_max_cpu_core
echo "1 4" > /proc/ppm/policy/userlimit_max_cpu_core
echo "2 2" > /proc/ppm/policy/userlimit_max_cpu_core
echo "0 249000" > /proc/ppm/policy/userlimit_min_cpu_freq
echo "1 279000" > /proc/ppm/policy/userlimit_min_cpu_freq
echo "2 328000" > /proc/ppm/policy/userlimit_min_cpu_freq
echo "0 1512000" > /proc/ppm/policy/userlimit_max_cpu_freq
echo "1 1818000" > /proc/ppm/policy/userlimit_max_cpu_freq
echo "2 2318000" > /proc/ppm/policy/userlimit_max_cpu_freq

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
chmod 0777 /sys/devices/system/cpu/power/autosuspend_delay_ms
echo 1000 > /sys/devices/system/cpu/power/autosuspend_delay_ms
#调节interactive调度器具体参数
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpufreq/interactive/boost
#调节升频时延
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo "18000 1145000:28000 1237000:38000 1347000:38000 1421000:38000 1512000:38000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
#调节升频频率
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo 1324000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
#调节升频所需负载条件
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo 85 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
#调节最小降频间隔
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo 8000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
#调节负载频率对应关系
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/target_loads
echo "10 249000:20 449000:30 648000:40 1005000:50 1237000:60 1421000:70 1604000:80 1828000:90 23 484000:33 687000:43 1053000:47 1200000:57 1472000:67 1571000:77 1917000:87 2197000:97 23 328000:33 771000:47 1169000:57 1475000:67 1766000:77 2057000:82 2318000:87 2408000:99" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
#调节CPU负载采样间隔
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/timer_slack
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 80000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
echo 80000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
#开启CPU提升I/O性能
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
echo 0 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy

#开启hps_eas动态调节
echo 1 > /proc/hps/eas_enabled
#限制boost核心数量
chmod 0777 /proc/hps/input_boost_cpu_num
chmod 0777 /proc/hps/big_task_enabled
chmod 0777 /proc/hps/heavy_task_enabled
echo 8 > /proc/hps/input_boost_cpu_num
echo 1 > /proc/hps/big_task_enabled
echo 0 > /proc/hps/heavy_task_enabled
#设置降频阈值
chmod 0666 /proc/hps/down_threshold
echo 30 > /proc/hps/down_threshold
#设置降频积极度（千万不能为零，不然重启……）
chmod 0666 /proc/hps/down_times
echo 2 > /proc/hps/down_times
#设置升频阈值
chmod 0666 /proc/hps/up_threshold
echo 30 > /proc/hps/up_threshold
#设置升频积极度（千万不能为零，不然重启……）
chmod 0666 /proc/hps/up_times
echo 6 > /proc/hps/up_times
#禁用加速
chmod 0666 /proc/hps/idle_threshold
chomd 0666 /proc/hps/idle_det_enabled
chmod 0666 /proc/hps/rush_boost_enabled
chmod 0666 /proc/hps/input_boost_enabled
chmod 0666 /proc/hps/power_mode
echo 10 > /proc/hps/idle_threshold
echo 1 > /proc/hps/idle_det_enabled
echo 1 > /proc/hps/rush_boost_enabled
echo 1 > /proc/hps/input_boost_enabled
echo 1 > /proc/hps/power_mode
#启用休眠
chmod 0666 /proc/hps/suspend_enabled
chmod 0666 /proc/hps/smart_det_enabled
chmod 0666 /sys/power/autosleep
chomd 0666 /sys/power/pm_freeze_timeout
echo 1 > /proc/hps/suspend_enabled
echo 0 > /proc/hps/smart_det_enabled
echo 1 > /sys/power/autosleep
echo 8000 > /sys/power/pm_freeze_timeout

#修改动态机制
echo 0 > /proc/cpufreq/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_sched_disable
#设置升频阈值
chmod 0666 /proc/cpufreq/cpufreq_up_threshold_b
chmod 0666 /proc/cpufreq/cpufreq_up_threshold_l
chmod 0666 /proc/cpufreq/cpufreq_up_threshold_ll
chmod 0777 /proc/cpufreq/cpufreq_turbo_mode
chmod 0777 /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_turbo_mode
chmod 0777 /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_turbo_mode
chmod 0777 /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_turbo_mode
chmod 0777 /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_turbo_mode
echo 80 > /proc/cpufreq/cpufreq_up_threshold_b
echo 80 > /proc/cpufreq/cpufreq_up_threshold_l
echo 80 > /proc/cpufreq/cpufreq_up_threshold_ll
echo 1 > /proc/cpufreq/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_turbo_mode
#修改不同场景核心开启情况
chmod 0777  /dev/cpuset/background/cpus
chmod 0777  /dev/cpuset/background/effective_cpus
chmod 0777  /dev/cpuset/background/cpus_exclusive
chmod 0777  /dev/cpuset/background/sched_load_balance

echo "4-7" > /dev/cpuset/background/cpus
echo "4-7" > /dev/cpuset/background/effective_cpus
echo 0 > /dev/cpuset/background/cpus_exclusive
echo 0 > /dev/cpuset/background/sched_load_balance

chmod 0777  /dev/cpuset/foreground/cpus
chmod 0777  /dev/cpuset/foreground/effective_cpus
chmod 0777  /dev/cpuset/foreground/cpus_exclusive
chmod 0777  /dev/cpuset/foreground/sched_load_balance

echo "4-7" > /dev/cpuset/foreground/cpus
echo "4-7" > /dev/cpuset/foreground/effective_cpus
echo 0 > /dev/cpuset/foreground/cpus_exclusive
echo 1 > /dev/cpuset/foreground/sched_load_balance

chmod 0777  /dev/cpuset/foreground/boost/cpus
chmod 0777  /dev/cpuset/foreground/boost/effective_cpus
chmod 0777  /dev/cpuset/foreground/boost/cpus_exclusive
chmod 0777  /dev/cpuset/foreground/boost/sched_load_balance

echo "8-9"> /dev/cpuset/foreground/boost/cpus
echo "8-9" > /dev/cpuset/foreground/boost/effective_cpus
echo 0 > /dev/cpuset/foreground/boost/cpus_exclusive
echo 1 > /dev/cpuset/foreground/boost/sched_load_balance

chmod 0777  /dev/cpuset/mzperf_cancel/cpus
chmod 0777  /dev/cpuset/mzperf_cancel/effective_cpus
chmod 0777  /dev/cpuset/mzperf_cancel/cpus_exclusive
chmod 0777  /dev/cpuset/mzperf_cancel/sched_load_balance

echo "4-6" > /dev/cpuset/mzperf_cancel/cpus
echo "4-6" > /dev/cpuset/mzperf_cancel/effective_cpus
echo 0 > /dev/cpuset/mzperf_cancel/cpus_exclusive
echo 0 > /dev/cpuset/mzperf_cancel/sched_load_balance

chmod 0777  /dev/cpuset/mzperf_ctrl/cpus
chmod 0777  /dev/cpuset/mzperf_ctrl/effective_cpus
chmod 0777  /dev/cpuset/mzperf_ctrl/cpus_exclusive
chmod 0777  /dev/cpuset/mzperf_ctrl/sched_load_balance

echo "5-7" > /dev/cpuset/mzperf_ctrl/cpus
echo "5-7" > /dev/cpuset/mzperf_ctrl/effective_cpus
echo 0 > /dev/cpuset/mzperf_ctrl/cpus_exclusive
echo 0 > /dev/cpuset/mzperf_ctrl/sched_load_balance

chmod 0777  /dev/cpuset/system-background/cpus
chmod 0777  /dev/cpuset/system-background/effective_cpus
chmod 0777  /dev/cpuset/system-background/cpus_exclusive
chmod 0777  /dev/cpuset/system-background/sched_load_balance

echo "4-7" > /dev/cpuset/system-background/cpus
echo "4-7" > /dev/cpuset/system-background/effective_cpus
echo 1 > /dev/cpuset/system-background/cpus_exclusive
echo 1 > /dev/cpuset/system-background/sched_load_balance

chmod 0777  /dev/cpuset/top-app/cpus
chmod 0777  /dev/cpuset/top-app/effective_cpus
chmod 0777  /dev/cpuset/top-app/cpus_exclusive
chmod 0777  /dev/cpuset/top-app/sched_load_balance

echo "4-9" > /dev/cpuset/top-app/cpus
echo "4-9" > /dev/cpuset/top-app/effective_cpus
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
echo 5 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
echo 5 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
echo 5 > /proc/cpufreq/cpufreq_oppidx

chmod 0777 >/proc/hps/pwrseq
echo "2 0 1" >/proc/hps/pwrseq

#moudle/ged
chmod 0666 /sys/module/ged/parameters/enabled_cpu_boost
chmod 0666 /sys/module/ged/parameters/enabled_gpu_boost
chmod 0666 /sys/module/ged/parameters/ged_boost_enable
chmod 0666 /sys/module/ged/parameters/gx_3D_benchmark_on
chmod 0666 /sys/module/ged/parameters/gx_game_mode
chmod 0777 /sys/module/ged/parameters/gx_dfps
chmod 0666 /sys/module/ged/parameters/gx_force_cpu_boost
chmod 0666 /sys/module/ged/parameters/boost_amp
chmod 0666 /sys/module/ged/parameters/boost_extra
chmod 0666 /sys/module/ged/parameters/cpu_boost_policy
echo 1 > /sys/module/ged/parameters/enabled_cpu_boost
echo 1 > /sys/module/ged/parameters/enabled_gpu_boost
echo 1 > /sys/module/ged/parameters/ged_boost_enable
echo 0 > /sys/module/ged/parameters/gx_3D_benchmark_on
echo 0 > /sys/module/ged/parameters/gx_game_mode
echo 45 > /sys/module/ged/parameters/gx_dfps
echo 0 > /sys/module/ged/parameters/gx_force_cpu_boost
echo 0 > /sys/module/ged/parameters/boost_amp
echo 0 > /sys/module/ged/parameters/boost_extra
echo 8 > /sys/module/ged/parameters/cpu_boost_policy

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
echo 1 > /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
echo 1 > /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
echo "8 570000" > /proc/gpufreq/gpufreq_limited_power
echo 0 > /proc/gpufreq/gpufreq_limited_thermal_ignore
echo 1 > /proc/gpufreq/gpufreq_volt_enable
echo 570000 > /proc/gpufreq/gpufreq_opp_max_freq
echo 166000 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_opp_freq
echo 1 > /proc/gpufreq/gpufreq_input_boost
echo 45 > /d/ged/hal/fps_upper_bound

#开启ksm
#busybox mkdir /sys/kernel/mm/ksm
#busybox touch /sys/kernel/mm/ksm/run
#echo 1 > /sys/kernel/mm/ksm/run
#开启zram
echo 1610612736 > /sys/block/zram0/disksize
busybox mkswap /dev/block/zram0
busybox swapon /dev/block/zram0
echo 0 > /proc/sys/vm/swappiness

#优化SD调度
chmod 0777 /sys/block/sda/queue/scheduler
chmod 0777 /sys/block/sdb/queue/scheduler
chmod 0777 /sys/block/sdc/queue/scheduler
chmod 0777 /sys/block/zram0/queue/scheduler
chmod 0777 /sys/block/ram0/queue/scheduler
echo "deadline" > /sys/block/sda/queue/scheduler
echo "deadline" > /sys/block/sdb/queue/scheduler
echo "deadline" > /sys/block/sdc/queue/scheduler
echo "deadline" > /sys/block/zram0/queue/scheduler
echo "deadline" > /sys/block/ram0/queue/scheduler
chmod 0777 /sys/block/sda/queue/nr_requests
chmod 0777 /sys/block/sdb/queue/nr_requests
chmod 0777 /sys/block/sdc/queue/nr_requests
chmod 0777 /sys/block/sda/queue/read_ahead_kb
chmod 0777 /sys/block/sdb/queue/read_ahead_kb
chmod 0777 /sys/block/sdc/queue/read_ahead_kb
echo 1024 > /sys/block/sda/queue/nr_requests
echo 1024 > /sys/block/sdb/queue/nr_requests
echo 1024 > /sys/block/sdc/queue/nr_requests
echo 1024 > /sys/block/sda/queue/read_ahead_kb
echo 1024 > /sys/block/sdb/queue/read_ahead_kb
echo 1024 > /sys/block/sdc/queue/read_ahead_kb

#优化ZRAM
chmod 0777 /proc/sys/vm/dirty_ratio
chmod 0777 /proc/sys/vm/dirty_background_ratio
chmod 0777 /proc/sys/vm/dirty_writeback_centisecs
chmod 0777 /proc/sys/vm/dirtytime_expire_seconds
chmod 0777 /proc/sys/vm/swappiness
chmod 0777 /proc/sys/vm/vfs_cache_pressure
echo 10 > /proc/sys/vm/dirty_ratio
echo 5 > /proc/sys/vm/dirty_background_ratio
echo 400 > /proc/sys/vm/dirty_writeback_centisecs
echo 1000 > /proc/sys/vm/dirtytime_expire_seconds
echo 0 > /proc/sys/vm/swappiness
echo 200 > /proc/sys/vm/vfs_cache_pressure

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


#POWERED BY 铁人司机
#完成日期：2019年4月13日 1：18