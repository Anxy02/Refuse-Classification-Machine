# Refuse-Classification-Machine
垃圾分类机器人——垃圾识别（YOLOv5）与机械臂分类（moveit!）程序

sudo安装moveit,ros-noetic-usb-cam

cd /etc/udev/rules.d
修改串口绑定https://blog.csdn.net/qq_43326927/article/details/128680244
KERNEL=="ttyUSB*", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60",ATTRS{serial}=="0002", MODE:="0777", GROUP:="dialout", SYMLINK+="wheeltec_controller"

串口包安装
pip3 install pyserial
串口开权限
ls /dev/tty*
sudo chmod 777 /dev/ttyACM0
永久开权限
ls -l /dev/ttyACM0
whoami
sudo usermod -aG dialout USERNAME

关闭相机显示
/opt/ros/noetic/share/usb_cam/launch
将image_view注释掉

报错
warnings.warn('User provided device_type of \'cuda\', but CUDA is not available. Disabling')
解决：注释掉

## 执行方式
1. 拉取最新版本代码
进入主文件夹-进入Refuse-Classification-Machine文件夹-右键打开终端-输入
git pull
2. 编译代码
在Refuse-Classification-Machine文件夹-右键打开终端-输入
catkin_make
3. 执行代码
在Refuse-Classification-Machine文件夹-右键打开终端-输入
roslaunch yolo_new yolo.launch 
4. 其他操作
关闭程序：在终端中，Ctrl+C键同时按下
自动补全按键：Tab键

