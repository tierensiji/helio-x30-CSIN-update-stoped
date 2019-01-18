chmod 0666  /dev/cpuset/background/cpus
chmod 0666  /dev/cpuset/background/effective_cpus
chmod 0666  /dev/cpuset/background/cpus_exclusive
chmod 0666  /dev/cpuset/background/sched_load_balance

echo "1,3,5" > /dev/cpuset/background/cpus
echo "3,5" > /dev/cpuset/background/effective_cpus
echo 0 > /dev/cpuset/background/cpus_exclusive
echo 0 > /dev/cpuset/background/sched_load_balance

chmod 0666  /dev/cpuset/foreground/cpus
chmod 0666  /dev/cpuset/foreground/effective_cpus
chmod 0666  /dev/cpuset/foreground/cpus_exclusive
chmod 0666  /dev/cpuset/foreground/sched_load_balance

echo "1-3,5-6" > /dev/cpuset/foreground/cpus
echo "3,6" > /dev/cpuset/foreground/effective_cpus
echo 0 > /dev/cpuset/foreground/cpus_exclusive
echo 0 > /dev/cpuset/foreground/sched_load_balance

chmod 0666  /dev/cpuset/foreground/boost/cpus
chmod 0666  /dev/cpuset/foreground/boost/effective_cpus
chmod 0666  /dev/cpuset/foreground/boost/cpus_exclusive
chmod 0666  /dev/cpuset/foreground/boost/sched_load_balance

echo "5-7"> /dev/cpuset/foreground/boost/cpus
echo "5-6" > /dev/cpuset/foreground/boost/effective_cpus
echo 0 > /dev/cpuset/foreground/boost/cpus_exclusive
echo 0 > /dev/cpuset/foreground/boost/sched_load_balance

chmod 0666  /dev/cpuset/mzperf_cancel/cpus
chmod 0666  /dev/cpuset/mzperf_cancel/effective_cpus
chmod 0666  /dev/cpuset/mzperf_cancel/cpus_exclusive
chmod 0666  /dev/cpuset/mzperf_cancel/sched_load_balance

echo "2-4,6" > /dev/cpuset/mzperf_cancel/cpus
echo "3,6" > /dev/cpuset/mzperf_cancel/effective_cpus
echo 0 > /dev/cpuset/mzperf_cancel/cpus_exclusive
echo 0 > /dev/cpuset/mzperf_cancel/sched_load_balance

chmod 0666  /dev/cpuset/mzperf_ctrl/cpus
chmod 0666  /dev/cpuset/mzperf_ctrl/effective_cpus
chmod 0666  /dev/cpuset/mzperf_ctrl/cpus_exclusive
chmod 0666  /dev/cpuset/mzperf_ctrl/sched_load_balance

echo "5-7" > /dev/cpuset/mzperf_ctrl/cpus
echo "5,6" > /dev/cpuset/mzperf_ctrl/effective_cpus
echo 0 > /dev/cpuset/mzperf_ctrl/cpus_exclusive
echo 0 > /dev/cpuset/mzperf_ctrl/sched_load_balance

chmod 0666  /dev/cpuset/system-background/cpus
chmod 0666  /dev/cpuset/system-background/effective_cpus
chmod 0666  /dev/cpuset/system-background/cpus_exclusive
chmod 0666  /dev/cpuset/system-background/sched_load_balance

echo "1-5" > /dev/cpuset/system-background/cpus
echo "1-3,5" > /dev/cpuset/system-background/effective_cpus
echo 0 > /dev/cpuset/system-background/cpus_exclusive
echo 0 > /dev/cpuset/system-background/sched_load_balance

chmod 0666  /dev/cpuset/top-app/cpus
chmod 0666  /dev/cpuset/top-app/effective_cpus
chmod 0666  /dev/cpuset/top-app/cpus_exclusive
chmod 0666  /dev/cpuset/top-app/sched_load_balance

echo "2-7" > /dev/cpuset/top-app/cpus
echo "2-3,6" > /dev/cpuset/top-app/effective_cpus
echo 0 > /dev/cpuset/top-app/cpus_exclusive
echo 0 > /dev/cpuset/top-app/sched_load_balance

chmod 0666  /dev/cpuset/cpus
chmod 0666  /dev/cpuset/effective_cpus
chmod 0666  /dev/cpuset/cpus_exclusive
chmod 0666  /dev/cpuset/sched_load_balance

echo "1-7" > /dev/cpuset/cpus
echo "1-3,6" > /dev/cpuset/effective_cpus
echo 0 > /dev/cpuset/cpus_exclusive
echo 0 > /dev/cpuset/sched_load_balance