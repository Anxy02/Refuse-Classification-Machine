# Refuse-Classification-Machine
垃圾分类机器人——垃圾识别（YOLOv5）与机械臂分类（moveit!）程序

sudo安装moveit,ros-noetic-usb-cam

cd /etc/udev/rules.d
修改串口绑定https://blog.csdn.net/qq_43326927/article/details/128680244
KERNEL=="ttyUSB*", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60",ATTRS{serial}=="0002", MODE:="0777", GROUP:="dialout", SYMLINK+="wheeltec_controller"

串口开权限
ls /dev/tty*
sudo chmod 777 /dev/ttyACM0

关闭相机显示
/opt/ros/noetic/share/usb_cam/launch
将image_view注释掉