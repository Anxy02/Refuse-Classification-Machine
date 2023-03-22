//ROS源文件
#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <std_msgs/Int8.h>
//Open-CV头文件
//#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/objdetect.hpp"
#include <opencv2/imgproc/imgproc_c.h>

//Centroid自定义消息
#include "wheeltec_tracker_pkg/centroid.h"

static const std::string OPENCV_WINDOW = "raw_image_window";
using namespace std;
using namespace cv;

int i = 0;
class Face_Detector  //创建一个类
{
  ros::NodeHandle nh_;  //定义句柄
  image_transport::ImageTransport it_; //image_transport：跨ROS计算图发送ROS图像信息
  image_transport::Subscriber image_sub_;
  image_transport::Publisher image_pub_;
 
  ros::Publisher face_centroid_pub;  //人脸质心发布器
  ros::Publisher face_follow_flag_pub;  //人脸质心发布器

  wheeltec_tracker_pkg::centroid face_centroid;

  string input_image_topic, output_image_topic, haar_file_face;
  int face_tracking, display_original_image, display_tracking_image, center_offset, screenmaxx;
  int width, height;
public:
  Face_Detector()
    : it_(nh_)
  {

  //加载参数默认值
  input_image_topic = "/usb_cam/image_raw";
  output_image_topic = "/face_detector/raw_image";
  haar_file_face = "/home/wheeltec_client/wheeltec_arm/src/wheeltec_tracker_pkg/data/face.xml";
  face_tracking = 1;
  display_original_image = 1;
  display_tracking_image = 1;
  screenmaxx = 640;
  center_offset = 100;

  //从track.yaml中索引参数
  try{
  nh_.getParam("image_input_topic", input_image_topic);
  nh_.getParam("face_detected_image_topic", output_image_topic);
  nh_.getParam("haar_file_face", haar_file_face);
  nh_.getParam("face_tracking", face_tracking);
  nh_.getParam("display_original_image", display_original_image);
  nh_.getParam("display_tracking_image", display_tracking_image);
  nh_.getParam("center_offset", center_offset);
  nh_.getParam("screenmaxx", screenmaxx);

  ROS_INFO("Successfully Loaded tracking parameters");
  }

  catch(int e)
  {
   
      ROS_WARN("Parameters are not properly loaded from file, loading defaults");
	
  }

    //订阅输入视频源并发布输出视频源
    image_sub_ = it_.subscribe(input_image_topic, 1, 
      &Face_Detector::imageCb, this);
    image_pub_ = it_.advertise(output_image_topic, 1);
   
    face_centroid_pub = nh_.advertise<wheeltec_tracker_pkg::centroid>("/face_centroid",10);
    face_follow_flag_pub = nh_.advertise<std_msgs::Int8>("/face_follow_flag",1);
  } 

  ~Face_Detector() 
  {
    if( display_original_image == 1 or display_tracking_image == 1)
    	cv::destroyWindow(OPENCV_WINDOW);
  }
 //image_sub_的回调函数：将sensor_msgs/Image数据转换成cv::Mat Oprncv数据类型
  void imageCb(const sensor_msgs::ImageConstPtr& msg)
  {
    if(i<5)
    {
        i++;
        if(i=5)
        {
          std_msgs::Int8 face_flag_pub_msg;
          face_flag_pub_msg.data = 1;
          face_follow_flag_pub.publish(face_flag_pub_msg);
        } 
    }
    cv_bridge::CvImagePtr cv_ptr;
    namespace enc = sensor_msgs::image_encodings;

    try
    {
      cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e)
    {
      ROS_ERROR("cv_bridge exception: %s", e.what());

      return;
    }
	    //Harr分类器文件代码
	    string cascadeName = "/home/wheeltec_client/wheeltec_arm/src/wheeltec_tracker_pkg/data/face.xml";
            CascadeClassifier cascade;

	    if(!cascade.load( cascadeName))
	    {
               //int a=2;
		std::cerr << "ERROR: Could not load classifier cascade" << std::endl;
	    }

	   // if (display_original_image == 1){
	//	imshow("Original Image", cv_ptr->image);
	  // }

            detectAndDraw( cv_ptr->image, cascade );

            image_pub_.publish(cv_ptr->toImageMsg());

            waitKey(30);
}
  //执行人脸检测
void detectAndDraw( Mat& img, CascadeClassifier& cascade)
{
    double t = 0;
    double scale = 1;
    int max_area=0;
    int max_face=0;
    vector<Rect> faces, faces2;
    const static Scalar colors[] =
    {
        Scalar(255,0,0),
        Scalar(255,128,0),
        Scalar(255,255,0),
        Scalar(0,255,0),
        Scalar(0,128,255),
        Scalar(0,255,255),
        Scalar(0,0,255),
        Scalar(255,0,255)
    };
    Mat gray, smallImg;

    cvtColor( img, gray, COLOR_BGR2GRAY );  //转灰度图
    //face_centroid.w = img.rows;
    //face_centroid.h = img.cols;
    double fx = 1 / scale ;
    resize( gray, smallImg, Size(), fx, fx, INTER_LINEAR );
    equalizeHist( smallImg, smallImg );

    t = (double)cvGetTickCount();
    cascade.detectMultiScale( smallImg, faces,
        1.1, 15, 0
        |CASCADE_SCALE_IMAGE,
        Size(30, 30) );
   
    t = (double)cvGetTickCount() - t;

    for ( size_t i = 0; i < faces.size(); i++ )//在检测到的每个人脸上进行迭代处理，
    {

        if(faces[i].height*faces[i].width>max_area)//找出画面中最大的人脸
        {
        max_area = faces[i].height*faces[i].width;
        max_face = i;
        }
        Rect r = faces[max_face];
        Mat smallImgROI;
        vector<Rect> nestedObjects;
        Point center;
        Scalar color = colors[i%8];
        int radius;
        float error;
        double aspect_ratio = (double)r.width/r.height;
        if( 0.75 < aspect_ratio && aspect_ratio < 1.3 )
        {
            center.x = cvRound((r.x + r.width*0.5)*scale);
            center.y = cvRound((r.y + r.height*0.5)*scale);
            radius = cvRound((r.width + r.height)*0.25*scale);
            //circle( img, center, radius, color, 3, 8, 0 );
            rectangle( img, cvPoint(cvRound(r.x*scale), cvRound(r.y*scale)),
                       cvPoint(cvRound((r.x + r.width-1)*scale), cvRound((r.y + r.height-1)*scale)),
                       color, 3, 8, 0);
   	    face_centroid.x = center.x;
   	    face_centroid.y = center.y;
   	    face_centroid.leftupper_x = cvRound(r.x*scale);
   	    face_centroid.leftupper_y = cvRound(r.y*scale);
   	    face_centroid.rightlower_w = cvRound((r.x + r.width-1)*scale);
   	    face_centroid.rightlower_h = cvRound((r.y + r.height-1)*scale);
   	    //ROS_INFO("cv_bridge exception: %f", error);
            //Publishing centroid of detected face
  	    face_centroid_pub.publish(face_centroid);//发布质心位置

        }
        else
            rectangle( img, cvPoint(cvRound(r.x*scale), cvRound(r.y*scale)),
                       cvPoint(cvRound((r.x + r.width-1)*scale), cvRound((r.y + r.height-1)*scale)),
                       color, 3, 8, 0);

    }

    //在图像窗口左侧、右侧和中心放置文本线条

    Point pt1, pt2,pt3,pt4,pt5,pt6;

    //中间线
    pt1.x = screenmaxx / 2;
    pt1.y = 0;
 
    pt2.x = screenmaxx / 2;
    pt2.y = 480;


    //左边
    pt3.x = (screenmaxx / 2) - center_offset;
    pt3.y = 0;

    pt4.x = (screenmaxx / 2) - center_offset;
    pt4.y = 480;

    //右边
    pt5.x = (screenmaxx / 2) + center_offset;
    pt5.y = 0;

    pt6.x = (screenmaxx / 2) + center_offset;
    pt6.y = 480;


    line(img,  pt1,  pt2, Scalar(0, 0, 255),0.2);
    line(img,  pt3,  pt4, Scalar(0, 255, 0),0.2);
    line(img,  pt5,  pt6, Scalar(0, 255, 0),0.2);


    putText(img, "Left", cvPoint(50,240), FONT_HERSHEY_SIMPLEX, 1, cvScalar(255,0,0), 2, CV_AA);
    putText(img, "Center", cvPoint(280,240), FONT_HERSHEY_SIMPLEX, 1, cvScalar(0,0,255), 2, CV_AA);
    putText(img, "Right", cvPoint(480,240), FONT_HERSHEY_SIMPLEX, 1, cvScalar(255,0,0), 2, CV_AA);
    if (display_tracking_image == 1){

    	imshow( "Face tracker", img );
     }
}


 
};

int main(int argc, char** argv)
{
  ros::init(argc, argv, "Face tracker");
  Face_Detector ic;
  ros::spin();
  return 0;
}
