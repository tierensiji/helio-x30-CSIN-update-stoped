su
#2.启用Doze模式
dumpsys deviceidle enable 
dumpsys deviceidle force-idle
#3.关闭Doze模式
#dumpsys deviceidle disable 
#4.查看Doze模式白名单
dumpsys deviceidle whitelist +com.tencent.mm 
dumpsys deviceidle whitelist +com.tencent.mobileqq 
dumpsys deviceidle whitelist +com.android.alarmclock 
dumpsys deviceidle whitelist +com.meizu.cloud 
dumpsys deviceidle whitelist +com.meizu.flyme.service.find 
#dumpsys battery unplug 
#am set-inactive 