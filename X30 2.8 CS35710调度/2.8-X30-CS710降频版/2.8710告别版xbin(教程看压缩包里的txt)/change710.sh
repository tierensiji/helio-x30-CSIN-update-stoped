#!/system/bin/sh
/system/xbin/su
#重挂载system
mount -o rw,remount /system 
#替换温控
cp -f -p /data/app/thermal.conf /etc/.tp/thermal.conf
rm -f /data/app/thermal.conf
#备份build.prop到sd卡
cp -p -f /system/build.prop /storage/emulated/0/backup/build.prop
#复制build.prop以便修改
cp -p -f /system/build.prop /data/app/zzz.prop
#具体修改步骤
sed -i "s#ro.mtk_perf_simple_start_win=0#ro.mtk_perf_simple_start_win=1#g" /data/app/zzz.prop
sed -i "s#ro.mtk_perf_fast_start_win=0#ro.mtk_perf_fast_start_win=1#g" /data/app/zzz.prop
sed -i "s#ro.mtk_perf_response_time=0#ro.mtk_perf_response_time=1#g" /data/app/zzz.prop
sed -i "s#ro.mtk_perfservice_support=1#ro.mtk_perfservice_support=0#g" /data/app/zzz.prop
#覆盖原build.prop
cp -p -f /data/app/zzz.prop /system/build.prop
rm -f /data/app/zzz.prpp
ls -al /system/build.prop
id
#写入重启后执行代码
sed -i '8,$d' /system/bin/install-recovery.sh
echo "
busybox sleep 90

sh ./data/app/exit710.sh

am start -n com.meizu.perfui/com.meizu.perfui.wukong.WukongMonitorActivity

am start -n com.waterdaaan.cpufloat/com.waterdaaan.cpufloat.MainActivity
" >> /system/bin/install-recovery.sh
#重挂载system
mount -o ro,remount /system
#重启
reboot