# 编译注意事项
* 需要把Build Active Architecture Only修改为NO，否则生成的静态库就只支持当前选择设备的架构。
* 修改生成的Mach-O格式，因为动态库也可以是以framework形式存在，所以需要设置，否则默认打出来的是动态库。将target->BuildSetting->Mach-o Type 设为Static Library（默认为Dynamic Library）；
*  分别选择Generic iOS Device和任意一个模拟器各编译一次。
*  查看静态库支持的框架：与上面不同，命令为lipo -info framework下的二进制文件名字。
* 想要让模拟器和真机通用一个静态库，我们可以使用终端命令来实现。合并的命令与上面不同的是：framework静态库合并的不是framework,而是framework下的二进制文件，命令为：lipo -create 第一个framework下二进制文件的绝对路径 第二个framework下二进制文件的绝对路径 -output 最终的二进制文件路径：

#### 如果静态库中有category类，则在使用静态库的项目配置中Other Linker Flags需要添加参数-ObjC或者-all_load。
#### 果创建的framework类中使用了.tbd，则需要在实际项目中导入.tbd动态库。

