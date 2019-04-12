echo 7 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
echo 2 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
echo 2 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
echo 2 > /proc/cpufreq/cpufreq_oppidx

echo "2 1 0" >/proc/hps/pwrseq

echo 1 > /sys/module/ged/parameters/enabled_cpu_boost
echo 1 > /sys/module/ged/parameters/gx_3D_benchmark_on
echo 1 > /sys/module/ged/parameters/gx_game_mode
echo 1 > /sys/power/autosleep
echo 5000 > /sys/power/pm_freeze_timeout
