#!/system/bin/sh
su
#2.7加入新的温控，修改阈值。
#作者：铁人司机————一个热爱安卓代码的北中医学生。
#一款优秀的调度首先体现在核心控制上，滑稽
#内测版暂时不做代码解释，节约时间，以最快速度，全力投入开发
echo "9 1" > /proc/ppm/policy_status
echo 1 > /proc/ppm/root_cluster
echo 0 > /proc/ppm/policy/hica_is_limit_big_freq
echo "0 0" > /proc/ppm/policy/userlimit_min_cpu_core
echo "1 2" > /proc/ppm/policy/userlimit_min_cpu_core
echo "2 0" > /proc/ppm/policy/userlimit_min_cpu_core
echo "0 0" > /proc/ppm/policy/userlimit_max_cpu_core
echo "1 4" > /proc/ppm/policy/userlimit_max_cpu_core
echo "2 2" > /proc/ppm/policy/userlimit_max_cpu_core
echo "0 2" > /proc/ppm/policy/ut_fix_core_num
echo "0 249000" > /proc/ppm/policy/userlimit_min_cpu_freq
echo "1 279000" > /proc/ppm/policy/userlimit_min_cpu_freq
echo "2 328000" > /proc/ppm/policy/userlimit_min_cpu_freq
echo "0 1421000" > /proc/ppm/policy/userlimit_max_cpu_freq
echo "1 2117000" > /proc/ppm/policy/userlimit_max_cpu_freq
echo "2 2318000" > /proc/ppm/policy/userlimit_max_cpu_freq
#修改ctl
echo 10000 > /dev/cpuctl/bg_non_interactive/cpu.rt_runtime_us
echo 950000 > /dev/cpuctl/cpu.rt_runtime_us
echo 1000000 > /dev/cpuctl/cpu.rt_period_us
echo 1 > /proc/sys/kernel/sched_tunable_scaling
#使用thermal
thermal_manager /vendor/etc/.tp/thermal.conf
#改进电源响应
echo "0 2500 5 10 0 560 0 300 500" > /proc/driver/thermal/clatm_setting
echo "1 2000 5 10 0 360 0 150 500" > /proc/driver/thermal/clatm_setting
#开启热插拔
echo 1 > /proc/hps/enabled
#设定sched为当前调度器
echo sched > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo sched > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo sched > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo sched > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo sched > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo sched > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo sched > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
echo sched > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
echo sched > /sys/devices/system/cpu/cpu8/cpufreq/scaling_governor
echo sched > /sys/devices/system/cpu/cpu9/cpufreq/scaling_governor
chmod 0755 /sys/devices/system/cpu/power/autosuspend_delay_ms
echo 1000 > /sys/devices/system/cpu/power/autosuspend_delay_ms
#开启hps_eas动态调节
echo 1 > /proc/hps/eas_enabled
#限制boost核心数量
chmod 0755 /proc/hps/input_boost_cpu_num
chmod 0755 /proc/hps/big_task_enabled
chmod 0755 /proc/hps/heavy_task_enabled
echo 6 > /proc/hps/input_boost_cpu_num
echo 0 > /proc/hps/big_task_enabled
echo 0 > /proc/hps/heavy_task_enabled
#设置降频阈值
chmod 0755 /proc/hps/down_threshold
echo 70 > /proc/hps/down_threshold
#设置降频延迟（千万不能为零，不然重启……）
chmod 0755 /proc/hps/down_times
echo 2 > /proc/hps/down_times
#设置升频阈值
chmod 0755 /proc/hps/up_threshold
echo 15 > /proc/hps/up_threshold
#设置升频延迟（千万不能为零，不然重启……）
chmod 0755 /proc/hps/up_times
echo 1 > /proc/hps/up_times
#禁用加速
chmod 0755 /proc/hps/idle_threshold
chmod 0755 /proc/hps/rush_boost_enabled
chmod 0755 /proc/hps/input_boost_enabled
chmod 0755 /proc/hps/power_mode
echo 0 > /proc/hps/idle_threshold
echo 1 > /proc/hps/idle_det_enabled
echo 1 > /proc/hps/rush_boost_enabled
echo 1 > /proc/hps/input_boost_enabled
echo 3 > /proc/hps/power_mode
#启用休眠
chmod 0755 /proc/hps/smart_det_enabled
chmod 0755 /sys/power/autosleep
chomd 0755 /sys/power/pm_freeze_timeout
echo 1 > /proc/hps/suspend_enabled
echo 0 > /proc/hps/smart_det_enabled
echo 1 > /sys/power/autosleep
echo 1000 > /sys/power/pm_freeze_timeout
#修改动态机制
echo 0 > /proc/cpufreq/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCI/cpufreq_sched_disable
#设置升频阈值
chmod 0755 /proc/cpufreq/cpufreq_up_threshold_b
chmod 0755 /proc/cpufreq/cpufreq_up_threshold_l
chmod 0755 /proc/cpufreq/cpufreq_up_threshold_ll
chmod 0755 /proc/cpufreq/cpufreq_turbo_mode
chmod 0755 /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_turbo_mode
chmod 0755 /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_turbo_mode
chmod 0755 /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_turbo_mode
chmod 0755 /proc/cpufreq/MT_CPU_DVFS_CCI/cpufreq_turbo_mode
echo "-99" > /proc/cpufreq/cpufreq_up_threshold_b
echo "-299" > /proc/cpufreq/cpufreq_up_threshold_l
echo 299 > /proc/cpufreq/cpufreq_up_threshold_ll
echo 1 > /proc/cpufreq/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_CCI/cpufreq_turbo_mode
#调节默认核心idx
chmod 0755 /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
chmod 0755 /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
chmod 0755 /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
chomd 0755 /proc/cpufreq/cpufreq_oppidx
echo 7 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
echo 5 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
echo 5 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
echo 5 > /proc/cpufreq/cpufreq_oppidx
#修改作用顺序
chmod 0755 >/proc/hps/pwrseq
echo "2 0 1" >/proc/hps/pwrseq
#修改帧率档位
echo "4 60 45 40 30" > /proc/driver/thermal/clfps_level
#moudle/ged
chmod 0755 /sys/module/ged/parameters/ged_boost_enable
chmod 0755 /sys/module/ged/parameters/gx_3D_benchmark_on
chmod 0755 /sys/module/ged/parameters/gx_game_mode
chmod 0755 /sys/module/ged/parameters/gx_dfps
chmod 0755 /sys/module/ged/parameters/gx_force_cpu_boost
chmod 0755 /sys/module/ged/parameters/boost_amp
chmod 0755 /sys/module/ged/parameters/boost_extra
chmod 0755 /sys/module/ged/parameters/cpu_boost_policy
echo 1 > /sys/module/ged/parameters/ged_boost_enable
echo 0 > /sys/module/ged/parameters/gx_3D_benchmark_on
echo 0 > /sys/module/ged/parameters/gx_game_mode
echo 45 > /sys/module/ged/parameters/gx_dfps
echo 0 > /sys/module/ged/parameters/gx_force_cpu_boost
echo 1 > /sys/module/ged/parameters/boost_amp
echo 1 > /sys/module/ged/parameters/boost_extra
echo 8 > /sys/module/ged/parameters/cpu_boost_policy
#设置gpu压制
chmod 0755 /proc/gpufreq/gpufreq_debug
chmod 0755 /proc/gpufreq/gpufreq_debug
chmod 0755 /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
chmod 0755 /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
chmod 0755 /proc/gpufreq/gpufreq_limited_power
chmod 0755 /proc/gpufreq/gpufreq_limited_thermal_ignore
chmod 0755 /proc/gpufreq/gpufreq_volt_enable
chmod 0755 /proc/gpufreq/gpufreq_opp_max_freq
chmod 0755 /proc/gpufreq/gpufreq_opp_freq
chmod 0755 /proc/gpufreq/gpufreq_input_boost
chmod 0755 /d/ged/hal/fps_upper_bound
echo 1 > /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
echo 1 > /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
echo "-1 850000" > /proc/gpufreq/gpufreq_limited_power
echo 1 > /proc/gpufreq/gpufreq_limited_thermal_ignore
echo 1 > /proc/gpufreq/gpufreq_volt_enable
echo 850000 > /proc/gpufreq/gpufreq_opp_max_freq
echo 166000 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_opp_freq
echo 1 > /proc/gpufreq/gpufreq_input_boost
echo 45 > /d/ged/hal/fps_upper_bound
#开启zram
echo 1610612736 > /sys/block/zram0/disksize
busybox mkswap /dev/block/zram0
busybox swapon /dev/block/zram0
echo 100 > /proc/sys/vm/swappiness
#优化SD调度
chmod 0755 /sys/block/sda/queue/scheduler
chmod 0755 /sys/block/sdb/queue/scheduler
chmod 0755 /sys/block/sdc/queue/scheduler
chmod 0755 /sys/block/zram0/queue/scheduler
chmod 0755 /sys/block/ram0/queue/scheduler
echo "deadline" > /sys/block/sda/queue/scheduler
echo "deadline" > /sys/block/sdb/queue/scheduler
echo "deadline" > /sys/block/sdc/queue/scheduler
echo "deadline" > /sys/block/zram0/queue/scheduler
echo "deadline" > /sys/block/ram0/queue/scheduler
chmod 0755 /sys/block/sda/queue/nr_requests
chmod 0755 /sys/block/sdb/queue/nr_requests
chmod 0755 /sys/block/sdc/queue/nr_requests
chmod 0755 /sys/block/sda/queue/read_ahead_kb
chmod 0755 /sys/block/sdb/queue/read_ahead_kb
chmod 0755 /sys/block/sdc/queue/read_ahead_kb
echo 1024 > /sys/block/sda/queue/nr_requests
echo 1024 > /sys/block/sdb/queue/nr_requests
echo 1024 > /sys/block/sdc/queue/nr_requests
echo 1024 > /sys/block/sda/queue/read_ahead_kb
echo 1024 > /sys/block/sdb/queue/read_ahead_kb
echo 1024 > /sys/block/sdc/queue/read_ahead_kb
#优化ZRAM和SWAP
echo 70 > /proc/sys/vm/dirty_ratio
echo 50 > /proc/sys/vm/dirty_background_ratio
echo 4000 > /proc/sys/vm/dirty_writeback_centisecs
echo 1000 > /proc/sys/vm/dirtytime_expire_seconds
echo 100 > /proc/sys/vm/swappiness
echo 200 > /proc/sys/vm/vfs_cache_pressure
echo 10000 > /proc/sys/vm/min_free_kbytes
echo 60 > /proc/sys/vm/overcommit_ratio
echo 30000 > /proc/sys/vm/extra_free_kbytes
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
#完成日期：2019年4月18日 21:31
#写在最后：首先感谢大家在一路的陪伴，尤其感谢各位在2.3-2.8这几个高产版本之间的关照和支持。
#在这个时间就是生命的时代，没有多少人会愿意浪费时间会帮别人测试东西，我很感谢你们愿意牺牲你们的时间和精力帮助我完善我的调度。
#因此，我也以最真诚的态度、最快的速度、最高的效率来不断更新我的调度，希望更好的帮助到大家。
#还是很感谢大家的支持，但是很抱歉在这里我要说一声再见了。
#从1.0刚开始接触调度以来已经不知不觉过去了五个月左右，在这里已经投入了我认为不愧对于大家的心血。
#现在我的灵感已经基本发挥完毕了，我认为我已经没有能力继续支撑x30调度了。
#因此我觉得我应该离开而不是拿出一些粗制滥造的东西来敷衍大家，为了弥补大家，这里补上我连续赶工两天加急制作的2.8最后脚本版本。
#尽管2.8版本已经倾尽了我的心血，但是2.8还是有点小问题，没能实现我说的一键部署。非常对不住大家。
#在这里给大家道歉，然后再次感谢大家的陪伴，2系列X30调度，再见了。
#我已经无法胜任新方案的开发了，我们有缘软件版再见。