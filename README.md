# helio-x30-interactive-sched

***根目录的文件均以过时，可能无法适应最新版本的flyme系统，推荐使用2.2版本调度，并且未来会不定期更新，欢迎有空常来看看，使用最新版本的就好了***

helio x30的调度优化和省电脚本
魅族pro7H节能优化手册

一、	使用前的准备

1、	软件：①tasker（或者镧工具箱2.0）②绿色守护③freezeyou!④禁用服务⑤block⑥autostarts⑦root explorer（主要是用来找文件路径，不是必须的）⑧supersu#⑨哔哩哔哩或者百度百家号（视频教程我发在上面了）⑩酷安（你能找到上述所有软件）

2、	文件：①链接:https://pan.baidu.com/s/1OcfChPBCpVndXSeMyR4oHA 密码:nk4y
②https://github.com/tierensiji/helio-x30-interactive-sched
③ https://download.csdn.net/download/weixin_44305925/10925444

3、	知识：一部分Linux命令和shell命令，主要是cd,cat,chmod,echo

4、	操作：①root②看教程或者视频（快速跳转链接：https://www.bilibili.com/video/av41035602/ ） ③写命令

二、	先从后台杀起
1、	绿色守护：给予允许后台权限，选择root模式或者adb模式，右上角加号添加所有你想要后台自动休眠的应用程序，设置里开启全自动休眠。不建议休眠实时通讯软件。
2、	freezyou!：对于想冻结精简的、很不常用的、又会经常自启的系统组件使用冻结功能。本功能比较强力，故推荐。

快速跳转链接：https://www.bilibili.com/video/av41035602/?p=2

三、	再说说实时运行的流氓

1、	block：据说是非常强大的一款软件，将软件的各个组件都暴露在用户的双手下，可以根据你的需求进行组件开关，以达到去广告、节省内存、降低占用、省电、屏蔽之类的目的。常用软件禁用项请前去参考桓清山大佬的方案，我也是抄袭来的。膜拜一下大佬！顺带表示感谢！

链接：https://www.coolapk.com/album/5415977
2、	禁用服务：测试发现好像有的应用block不能完全禁用其部分组件，就用它做备用了，虽然只有服务，但是效果不错，建议用来辅助block。

快速跳转链接：https://www.bilibili.com/video/av41035602/?p=2

四、	怎么防止自启

1、	autostarts：顾名思义，自动启动。本软件可以管理所有软件的自启动方式，通过禁用自启动触发条件达到禁止自启动的目的，用来对付那些你不想冻结，需要经常使用，但又经常在你不需要的时候跳出来自启的软件。

五、	压轴戏要留给手写的CPU调度和GPU管理

1、	背景：手机的主要用途并不是用来待机的，经过以上操作，我们的手机待机能耗已经比较低了，但是一旦跑起来，X30这颗调度异常积极的CPU和它配的GPU绝对能给你超乎想象的电能消耗，甚至会想摔手机。

2、	目的：①控制flyme自己的CPU调度，降低开核升频积极度，提高关核降频积极度。②接管CPU负载和频率对应关系，进行智能适应。③限制GPU最大频率，使用自动适应。

3、	普通玩家操作：①下载sh脚本文件，使用tasker（或者镧工具箱）执行命令，并设置各种自动优化计划和任务。②打开性能监视器检查是否生效。③畅享节能十小时。

快速跳转链接：https://www.bilibili.com/video/av41035602/?p=3

4、	###高级玩家操作：①下载sh脚本文件，使用tasker（或者镧工具箱）执行命令，并设置各种自动优化计划和任务。②分析sh文件内容，根据视频讲解或者自己的shell和linux知识进行改造和创造，写出更加适合自己的优化脚本文件。③自信地不看性能监视器继续玩手机。④十小时后发现手机还有电。

快速跳转链接：https://www.bilibili.com/video/av41035602/?p=1

六、	统一回复一下大家（刚刚看了一下社区，有人提问，正好回答一下）

1、	问：开关核心能不能不要root？

答：目前看来不能。我也不想root，但是开关核心这种系统级的操作，普通用户没有权限啊。至少目前X30还不支持免ROOT开核。

2、	问：游戏会卡吗？

答：不敢打包票。虽然我这个网瘾少年已经测试过王者荣耀、刺激战场、PUBG MOBILE、崩坏3、真实赛车3、极限着陆这些大游戏，使用自动调度无一例外都很流畅，甚至可以全特效流畅（当然耗电是真的大，因为自动调度本来就是按需分配的原则，游戏资源需求多，耗电自然大）。甚至说他们基本都是性能过剩的，我为了省电还不得不写手动关核的脚本文件。但是即便如此我也无法保证，因为还有别的游戏没测试过，我也不知道别的游戏代码是怎么写的，只能说，如果你用了我的自动调度后觉得卡，可以反馈给我一下，我下游戏单独按需给你写调度。如果你是用了我的手动关核脚本文件变卡的话，请你不要用他，用自动调度应该就不卡了。我的手动关核纯粹是为了省电，不是为了流畅性的。

正好上传了一个我玩真实赛车的视频，流畅度可以参考一下。

链接: https://www.bilibili.com/video/av41013891 

3、	问：p7p能用吗？

答：理论上只要是X30就能用，因为p7p和p7h在CPU和GPU上的配置貌似是一样的我记得。

4、	问：supersu卡气球怎么破？

答：supersu只是用来给tasker伪装用的，不需要激活，只用安装，是不会卡气球的。

5、问：能不能用re管理器执行脚本文件？
	
答：不能保证，我只能说我手机上试了无效，还是推荐tasker，一方面功能更全，可以实现自动化，一方面兼容性更好。至于re管理器你可以试试。

6、问：这么搞手机会不会坏？

答：一般来说芯片的设计寿命是20年左右，如果你能用那么久的话emmmm...另外，我为了测试最佳调度，做了非常多的操作，你按照我的规范操作的话肯定比我的操作要少得多，我的pro7h都还挺好呢。我的上一部魅蓝note3一直全开超频长达半年没什么问题...仅供参考，不做保证。总之，害怕的话就不要尝试吧。

特别鸣谢：

①酷安——醉卧听风②酷安——南南啊③魅族社区——欧罗巴

欢迎关注：

①酷安：铁人司机mzpro7大法好
②魅族社区：老司机_666_野司机
③哔哩哔哩：老司机666野司机
④GitHub：https://github.com/tierensiji/helio-x30-interactive-sched
⑤CSDN：铁人司机https://blog.csdn.net/weixin_44305925/article/details/86537823
⑥微信公众号：红瑾天科技工作室

By 铁人司机

北京中医药大学

2019年1月18日15:47
