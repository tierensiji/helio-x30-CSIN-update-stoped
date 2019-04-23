#!/system/bin/sh
/system/xbin/su
#清除开机一次性代码
mount -o rw,remount /system
cd /system/bin/
chmod 0777 /system/bin/install-recovery.sh
ls -al /system/bin/install-recovery.sh
sed -i 's#sh ./data/app/exit710.sh#sh ./data/app/28CS710.sh#g' /system/bin/install-recovery.sh
ls -al /system/bin/install-recovery.sh
#重挂载system
mount -o ro,remount /system
busybox sleep 5s
#执行调度
sh ./data/app/28CS710.sh
#清理多余脚本
rm -f /data/app/zzz.prop
rm -f /data/app/change710.sh
#弹出成功提示
am start -n com.android.htmlviewer/com.android.htmlviewer.HTMLViewerActivity -d file:///data/app/710.html
 &
busybox sleep 5s
am force-stop com.android.htmlviewer
#删除剩余文件
rm -f /data/app/710.html
rm $0