su
#在社区看到有魅友说x30太差，各种性能不行，被660吊打之类的话。我决定再次我我这个爱机pro7H写一个合一版本的智能调度文件，证明x30的实力。调度写好了一样可以赶上710，660不是x30的对手。不在以极致省电为目标，而是以智能为目标。
#因此，特别声明，本脚本可能不会太省电，不喜勿喷，谢谢！
#作者：铁人司机——一个热爱安卓代码的北中医学生。

#关闭热插拔
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
#echo 328000 > /sys/devices/system/cpu/cpufreq/policy8/scaling_min_freq
#echo 279000 > /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq
#echo 249000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
echo 100 > /sys/devices/system/cpu/power/autosuspend_delay_ms
#调节interactive调度器具体参数
echo 0 > /sys/devices/system/cpu/cpufreq/interactive/boost
#调节升频时延
echo 480000 > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
#调节升频频率
echo 1189000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
#调节升频所需负载条件
echo 90 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_freq
#调节最小降频间隔
echo 2000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
#调节负载频率对应关系
echo "15 249000:25 449000:30 648000:50 1005000:70 1237000:85 1512000:91 1678000:99 H50 1324000:70 1571000:85 1917000:91 2197000:99 50 1766000:70 2057000:85 2450000:91 2600000:99" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
#echo 93 > /sys/devices/system/cpu/cpufreq/interactive/target_loads
#调节CPU负载采样间隔
echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
#开启CPU提升I/O性能
echo 0 > /sys/devices/system/cpu/cpufreq/io_is_busy


#开启hps_eas动态调节
echo 1 > /proc/hps/eas_enabled
#限制boost核心数量
echo 8 > /proc/hps/input_boost_cpu_num
echo 0 > /proc/hps/big_task_enabled
echo 0 > /proc/hps/heavy_task_enabled
#设置降频阈值
echo 90 > /proc/hps/down_threshold
#设置降频积极度（千万不能为零，不然重启……）
echo 4 > /proc/hps/down_times
#设置降频阈值
echo 10 > /proc/hps/up_threshold
#设置降频积极度（千万不能为零，不然重启……）
echo 6 > /proc/hps/up_times
#禁用加速
echo 0 > /proc/hps/idle_threshold
echo 1 > /proc/hps/idle_det_enabled
echo 0 > /proc/hps/rush_boost_enabled
echo 0 > /proc/hps/input_boost_enabled
echo 0 > /proc/hps/power_mode
#启用休眠
echo 1 > /proc/hps/suspend_enabled
echo 0 > /proc/hps/smart_det_enabled
echo 1 > /sys/power/autosleep
echo 3000 > /sys/power/pm_freeze_timeout

#修改动态机制
echo 0 > /proc/cpufreq/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_sched_disable
#设置升频阈值
echo 90 > /proc/cpufreq/cpufreq_up_threshold_b
echo 90 > /proc/cpufreq/cpufreq_up_threshold_l
echo 90 > /proc/cpufreq/cpufreq_up_threshold_ll
echo 0 > /proc/cpufreq/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_turbo_mode
#echo 2117000 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_freq
#修改不同场景核心开启情况
chmod 0666  /dev/cpuset/background/cpus
chmod 0666  /dev/cpuset/background/effective_cpus
chmod 0666  /dev/cpuset/background/cpus_exclusive
chmod 0666  /dev/cpuset/background/sched_load_balance

echo "0-3" > /dev/cpuset/background/cpus
echo "0-3" > /dev/cpuset/background/effective_cpus
echo 0 > /dev/cpuset/background/cpus_exclusive
echo 0 > /dev/cpuset/background/sched_load_balance

chmod 0666  /dev/cpuset/foreground/cpus
chmod 0666  /dev/cpuset/foreground/effective_cpus
chmod 0666  /dev/cpuset/foreground/cpus_exclusive
chmod 0666  /dev/cpuset/foreground/sched_load_balance

echo "0-3,8-9" > /dev/cpuset/foreground/cpus
echo "0-3,8" > /dev/cpuset/foreground/effective_cpus
echo 0 > /dev/cpuset/foreground/cpus_exclusive
echo 0 > /dev/cpuset/foreground/sched_load_balance

chmod 0666  /dev/cpuset/foreground/boost/cpus
chmod 0666  /dev/cpuset/foreground/boost/effective_cpus
chmod 0666  /dev/cpuset/foreground/boost/cpus_exclusive
chmod 0666  /dev/cpuset/foreground/boost/sched_load_balance

echo "8-9"> /dev/cpuset/foreground/boost/cpus
echo "8" > /dev/cpuset/foreground/boost/effective_cpus
echo 0 > /dev/cpuset/foreground/boost/cpus_exclusive
echo 0 > /dev/cpuset/foreground/boost/sched_load_balance

chmod 0666  /dev/cpuset/mzperf_cancel/cpus
chmod 0666  /dev/cpuset/mzperf_cancel/effective_cpus
chmod 0666  /dev/cpuset/mzperf_cancel/cpus_exclusive
chmod 0666  /dev/cpuset/mzperf_cancel/sched_load_balance

echo "0-3" > /dev/cpuset/mzperf_cancel/cpus
echo "1-3" > /dev/cpuset/mzperf_cancel/effective_cpus
echo 0 > /dev/cpuset/mzperf_cancel/cpus_exclusive
echo 0 > /dev/cpuset/mzperf_cancel/sched_load_balance

chmod 0666  /dev/cpuset/mzperf_ctrl/cpus
chmod 0666  /dev/cpuset/mzperf_ctrl/effective_cpus
chmod 0666  /dev/cpuset/mzperf_ctrl/cpus_exclusive
chmod 0666  /dev/cpuset/mzperf_ctrl/sched_load_balance

echo "0-3" > /dev/cpuset/mzperf_ctrl/cpus
echo "1-3" > /dev/cpuset/mzperf_ctrl/effective_cpus
echo 0 > /dev/cpuset/mzperf_ctrl/cpus_exclusive
echo 0 > /dev/cpuset/mzperf_ctrl/sched_load_balance

chmod 0666  /dev/cpuset/system-background/cpus
chmod 0666  /dev/cpuset/system-background/effective_cpus
chmod 0666  /dev/cpuset/system-background/cpus_exclusive
chmod 0666  /dev/cpuset/system-background/sched_load_balance

echo "0-3" > /dev/cpuset/system-background/cpus
echo "0-3" > /dev/cpuset/system-background/effective_cpus
echo 0 > /dev/cpuset/system-background/cpus_exclusive
echo 0 > /dev/cpuset/system-background/sched_load_balance

chmod 0666  /dev/cpuset/top-app/cpus
chmod 0666  /dev/cpuset/top-app/effective_cpus
chmod 0666  /dev/cpuset/top-app/cpus_exclusive
chmod 0666  /dev/cpuset/top-app/sched_load_balance

echo "0-3,8-9" > /dev/cpuset/top-app/cpus
echo "0-3,8-9" > /dev/cpuset/top-app/effective_cpus
echo 0 > /dev/cpuset/top-app/cpus_exclusive
echo 0 > /dev/cpuset/top-app/sched_load_balance

chmod 0666  /dev/cpuset/cpus
chmod 0666  /dev/cpuset/effective_cpus
chmod 0666  /dev/cpuset/cpus_exclusive
chmod 0666  /dev/cpuset/sched_load_balance

echo "0-9" > /dev/cpuset/cpus
echo "0-9" > /dev/cpuset/effective_cpus
echo 0 > /dev/cpuset/cpus_exclusive
echo 0 > /dev/cpuset/sched_load_balance

#调节默认核心idx
echo 7 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
echo 2 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
echo 2 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
echo 2 > /proc/cpufreq/cpufreq_oppidx

echo "0 1 2" >/proc/hps/pwrseq

echo 0 > /sys/module/ged/parameters/enabled_cpu_boost
echo 0 > /sys/module/ged/parameters/enabled_gpu_boost
echo 0 > /sys/module/ged/parameters/gx_3D_benchmark_on
echo 0 > /sys/module/ged/parameters/gx_game_mode
echo 60 > /sys/module/ged/parameters/gx_dfps
echo 0 > /sys/module/ged/parameters/gx_force_cpu_boost
echo 0 > /sys/module/ged/parameters/boost_amp
echo 0 > /sys/module/ged/parameters/boost_extra

 

#设置gpu自动调节，解锁315，按需分配
#echo 166000 > /proc/gpufreq/gpufreq_opp_freq
echo 1 > /proc/gpufreq/gpufreq_debug
echo "low_batt_volt_limited_id = 14, g_limited_low_batt_volt_ignore_state = 0" > /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
echo "low_batt_volume_limited_id = 14, g_limited_low_batt_volume_ignore_state = 0" > /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
echo "g_limited_max_id = 14, limit frequency = 237000" > /proc/gpufreq/gpufreq_limited_power
echo "thermal_limited_id = 14, g_limited_thermal_ignore_state = 0" > /proc/gpufreq/gpufreq_limited_thermal_ignore
echo 1 > /proc/gpufreq/gpufreq_volt_enable
echo 166000 > /proc/gpufreq/gpufreq_opp_max_freq
echo 0 > /proc/gpufreq/gpufreq_opp_freq
#echo 166000 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_input_boost
echo 60 > /d/ged/hal/fps_upper_bound

#开启ksm
#busybox mkdir /sys/kernel/mm/ksm
#busybox touch /sys/kernel/mm/ksm/run
#echo 1 > /sys/kernel/mm/ksm/run
#开启zram
#echo 256m > /sys/block/zram0/disksize
#busybox mkswap /dev/block/zram0
#busybox swapon /dev/block/zram0
#echo 8 > /proc/sys/vm/swappiness

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


#by 铁人司机
#2019年2月11日