# BBOBxPlatEMO
 
在PlatEMO v3.x上使用BBOB测试问题。

从头开始建立（2025.1.10验证可行）：

下载[coco v2.6.3](https://github.com/numbbo/coco/tree/v2.6.3)

根据首页的README配置。我使用了MinGW，注意其需要配置系统环境变量，否则matlab无法识别（可以通过mex -setup来检查matlab是否正确配置了C语言编译器），请自行搜索相关教程。不需要安装cocopp。

本人是通过conda创建虚拟环境（python v3.6）后，再运行该命令。事实上，应该可以使用任意符合版本的python解释器执行python do.py run-matlab。因为并未发现安装了多余的python包（do.py中也没找到相关命令）。运行该命令会自动启动matlab并自动关闭（两次）。

有55个测试问题，每个测试问题有15个实例，每个实例有6中变量维度设置[2,3,5,10,20,40]

完成配置后，只需要该文件夹 ..\coco-2.6.3\code-experiments\build\matlab，可以重新命名，只要把路径加入matlab即可

可参考[tpb](https://github.com/ryojitanabe/tpb)