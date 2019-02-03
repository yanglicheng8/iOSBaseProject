//
//  ChrysanthemumNet.h
//  Chrysanthemum
//
//  Created by zl1 on 2018/11/27.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#ifndef ChrysanthemumNet_h
#define ChrysanthemumNet_h

#pragma mark *baseurl
//baseurl
//#define API_BASEURL @"http://renmanman.qdunzi.com"
//#define API_BASEURL @"http://app.renmanman.net"
//#define API_BASEURL @"http://60.213.48.114:88"
#define API_BASEURL @"http://test.renmanman.net"
#define K_BASEURL @"http://192.168.16.77:81"
//#define API_BASEURL @"http://192.168.16.33:8888"
#define API_VERSION @"/api/v116"


#pragma mark *公共接口
#define POST_COMMON_UPLOAD @"/api/common/upload"            //上传图片
#define POST_COMMON_GET_AREA @"/api/common/getArea"         //获取地区列表
#define GET_COMMON_PARAM @"/api/common/param"               //其他参数
#define POST_COMMON_UPDATE @"/api/common/update"            //版本更新
#define POST_COMMON_STARTUP_PAGE @"/api/common/startupPage" //启动页
#define POST_COMMON_GET_AD_LIST @"/api/common/getAdList"    //广告


#pragma mark *手机短信接口
#define POST_SMS_SEND @"/api/sms/send"                      //发送验证码 *

#pragma mark *会员接口
#define POST_USER_MOBILE_LOGIN @"/api/user/mobilelogin"         //手机验证码登录注册
#define GET_USER_PROFILE @"/api/user/profile"                   //获取会员信息
#define POST_USER_PROVE @"/api/user/proveType"                      //车主或司机认证
#define GET_USER_PROVE_DETAIL @"/api/user/proveDetail"          //车主或司机认证详情
#define POST_USER_MARGINS @"/api/user/margins"                  //缴纳保证金
#define POST_USER_USERVIP @"/api/user/uservip"                  //会员缴纳
#define POST_USER_GET_MONEYLOG @"/api/user/getMoneylog"         //缴费记录列表
#define POST_USER_CHANGE_AVATAR @"/api/user/changavatar"        //更换头像
#define POST_USER_CHANGE_MOBILE @"/api/user/changmobile"        //更换手机号
#define GET_USER_USER_INFO @"/api/user/userInfo"                //获取他人信息
#define POST_USER_SET_LOCATION @"/api/user/setLocation"         //更新位置坐标
#define POST_USER_GET_LOCATION @"/api/user/getLocation"         //获取用户位置坐标
#define POST_USER_GET_DRIVING_TYPE @"/api/user/getDrivingType"       //司机获取驾驶证类型

#define POST_USER_ISCARD @"/api/user/isidcard"                      //判断实名认证身份证是否可以

#pragma mark *投诉管理
#define POST_ORDERCOMPLAINT_ADD @"/api/ordercomplaint/ordercomplaintAdd"   //投诉提交
#define POST_ORDERCOMPLAINT_COMPLAINT_LIST @"/api/ordercomplaint/complaintList"     //投诉列表


#pragma mark *出车任务接口
#define POST_TASK_ADD @"/api/task/add"                          //车主添加出车任务
#define POST_TASK_EDIT @"/api/task/edit"                        //车主修改出车任务
#define POST_TASK_TASK_LIST @"/api/task/taskList"               //未接单任务列表
#define POST_TASK_MY_LIST @"/api/task/myList"                   //我的任务列表
#define POST_TASK_MY_COMMON_LIST @"/api/task/myCommonList"      //车主常用任务列表
#define POST_TASK_DETAIL @"/api/task/detail"                    //任务详情
#define POST_TASK_AFFIRM @"/api/task/affirm"                    //司机领取出车任务
#define POST_TASK_CANCEL @"/api/task/cancel"                    //车主和司机取消待领取任务
#define POST_TASK_DEL_USE @"/api/task/delUse"              //车主删除常出任务
#define GET_TASK_CAR_USER @"/api/task/carUser"                  //验证用户车主是否可以发布任务
#define GET_TASK_DRIVE_USER @"/api/task/driveUser"              //验证用户司机是否可以领取任务
#define POST_TASK_CONFIRM @"/api/task/confirm"                  //车主确认同意领取
#define POST_TASK_GET_TASK @"/api/task/getTask"                 //车主获取任务所有数据
#define POST_TASK_GET_INFOS @"/api/task/getInfos"               //司机查询资料入口

#pragma mark *任务订单管理
#define POST_ORDER_LISTS @"/api/order/lists"                        //任务订单列表
#define POST_ORDER_DETAILS @"/api/order/details"                    //任务订单详情
#define POST_ORDER_SET_STATUS @"/api/order/setStatus"               //更改订单状态
#define POST_ORDER_GET_MY_ORDER_LOG @"/api/order/getMyOrderlog"     //订单通知列表
#define POST_ORDER_GET_MESSAGE_STATUS @"/api/order/getMessageStatus"   //是否有未读的通知

#pragma mark *资讯接口
#define POST_NEWS_NEWS_LIST @"/api/news/newsList"               //获取资讯
#define POST_NEWS_DETAIL @"/api/news/detail"                    //获取资讯详情

#pragma mark *司机论坛接口
#define POST_FORUM_ADD @"/api/forum/add"                        //发布帖子
#define POST_FORUM_DEL @"/api/forum/del"                        //删除帖子
#define POST_FORUM_FORUM_LIST @"/api/forum/forumList"           //帖子列表
#define POST_FORUM_DETAIL @"/api/forum/detail"                  //帖子详情
#define POST_FORUM_FORUM_COMMENT_LIST @"/api/forum/forumcommentList" //帖子评论列表
#define POST_FORUM_USER_FORUM_COMMENT_LIST @"/api/forum/userForumcommentList" //人物评论列表
#define POST_FORUM_PRAISE_LIST @"/api/forum/praiseList"         //帖子或评论点赞列表
#define POST_FORUM_USER_PRAISE_LIST @"/api/forum/userPraiseList" //人物点赞列表
#define POST_FORUM_EVALUEATE @"/api/forum/evaluate"             //评论或回复
#define POST_FORUM_FORUM_COMMENT_DETAIL @"/api/forum/forumcommentDetail" //评论详情
#define POST_FORUM_REPLY_LIST @"/api/forum/replyList"           //评论回复列表
#define POST_FORUM_PRAISE @"/api/forum/praise"                  //点赞或取消
#define POST_FORUM_DEL_FORUM_COMMENT @"/api/forum/delForumcomment" //评论或回复的删除

#pragma mark *车主车辆管理接口
#define GET_CAR_DRIVER_LICENCE_TYPE @"/api/car/driverlicencetype" //驾驶类型和驾照类型列表
#define GET_CAR_CAR_ATTR @"/api/car/carAttr"                    //车辆属性
#define POST_CAR_ADD @"/api/car/add"                            //添加车辆
#define POST_CAR_EDIT @"/api/car/edit"                          //修改车辆
#define POST_CAR_INFO @"/api/car/info"                          //车辆详情
#define POST_CAR_DEL @"/api/car/del"                            //删除车辆
#define POST_CAR_LISTS @"/api/car/lists"                        //车辆列表

#pragma mark *订单评价接口
#define POST_EVALUATE_TASK_ADD @"/api/evaluate_task/add"        //添加评价
#define POST_EVALUATE_TASK_LISTS @"/api/evaluate_task/lists"    //评价列表
#define POST_EVALUATE_TASK_EVALUATE_CONTENT_LIST @"/api/evaluate_task/evaluateContentList"  //评价内容列表
#define POST_EVALUATE_TASK_CAR_EVALUATE @"/api/evaluate_task/carevaluate" //车主自动评价

#pragma mark *路线管理接口
#define POST_ROUTE_ADD @"/api/route/add"                        //添加路线
#define POST_ROUTE_DEL @"/api/route/del"                        //删除路线
#define POST_ROUTE_ROUTE_LIST @"/api/route/routeList"           //查看路线列表

#pragma mark *找车记录
#define POST_CONTACTRECORD_ADD @"/api/contactrecord/add"        //添加找车记录
#define POST_CONTACTRECORD_LISTS @"/api/contactrecord/lists"    //找车记录列表

#pragma mark *通知消息管理
#define POST_MESSAGE_LISTS @"/api/message/lists"                 //通知消息列表
#define GET_MESSAGE_SET_STATUS @"/api/message/setStatus"        //设置通知消息已读

#pragma mark *协议接口
#define GET_PROTOCOL_DETAIL @"/api/protocol/detail"             //协议详情

#pragma mark *反馈管理
#define POST_FEEDBACK_ADD @"/api/feedback/add"                  //反馈提交

#pragma mark *积分管理
#define GET_INTEGRAL_TEL_CHARGE_LIST @"/api/integral/telChargeList" //话费列表
#define POST_INTEGRAL_EXCHANGE_TEL_CHARGE @"/api/integral/exchangeTelCharge" //积分兑换话费
#define POST_INTEGRAL_LISTS @"/api/integral/lists"              //积分订单列表

#pragma mark *积分签到接口
#define POST_SIGN_IN_SIGN @"/api/sign_in/sign"                  //签到
#define POST_SIGN_IN_INTEGRAL_WATER @"/api/sign_in/integralWater" //积分明细

#pragma mark *论坛服务页面
#define POST_SERVICE_FORUM_SERVICE @"/api/service/forumService"  //论坛服务页面


#define GET_USER_REFEREEDETAIL @"/api/user/refereeDetail"  //邀请明细


#endif /* ChrysanthemumNet_h */

//#pragma mark *公共接口
//#define POST_COMMON_UPLOAD @"/api/common/upload"            //上传图片
//#define POST_COMMON_GET_AREA @"/api/common/getArea"         //获取地区列表
//#define GET_COMMON_PARAM @"/api/common/param"               //其他参数
//#define POST_COMMON_UPDATE @"/api/common/update"            //版本更新
//#define POST_COMMON_STARTUP_PAGE @"/api/common/startupPage" //启动页
//#define POST_COMMON_GET_AD_LIST @"/api/common/getAdList"    //广告
//
//
//#pragma mark *手机短信接口
//#define POST_SMS_SEND @"/api/sms/send"                      //发送验证码 *
//
//#pragma mark *会员接口
//#define POST_USER_MOBILE_LOGIN @"/api/user/mobilelogin"         //手机验证码登录注册
//#define GET_USER_PROFILE @"/api/user/profile"                   //获取会员信息
//#define POST_USER_PROVE @"/api/user/prove"                      //车主或司机认证
//#define GET_USER_PROVE_DETAIL @"/api/user/proveDetail"          //车主或司机认证详情
//#define POST_USER_MARGINS @"/api/user/margins"                  //缴纳保证金
//#define POST_USER_USERVIP @"/api/user/uservip"                  //会员缴纳
//#define POST_USER_GET_MONEYLOG @"/api/user/getMoneylog"         //缴费记录列表
//#define POST_USER_CHANGE_AVATAR @"/api/user/changavatar"        //更换头像
//#define POST_USER_CHANGE_MOBILE @"/api/user/changmobile"        //更换手机号
//#define GET_USER_USER_INFO @"/api/user/userInfo"                //获取他人信息
//#define POST_USER_SET_LOCATION @"/api/user/setLocation"         //更新位置坐标
//#define POST_USER_GET_LOCATION @"/api/user/getLocation"         //获取用户位置坐标
//#define POST_USER_GET_DRIVING_TYPE @"/api/user/getDrivingType"       //司机获取驾驶证类型
//
//
//#pragma mark *投诉管理
//#define POST_ORDERCOMPLAINT_ADD @"/api/ordercomplaint/ordercomplaintAdd"   //投诉提交
//#define POST_ORDERCOMPLAINT_COMPLAINT_LIST @"/api/ordercomplaint/complaintList"     //投诉列表
//
//
//#pragma mark *出车任务接口
//#define POST_TASK_ADD @"/api/task/add"                          //车主添加出车任务
//#define POST_TASK_EDIT @"/api/task/edit"                        //车主修改出车任务
//#define POST_TASK_TASK_LIST @"/api/task/taskList"               //未接单任务列表
//#define POST_TASK_MY_LIST @"/api/task/myList"                   //我的任务列表
//#define POST_TASK_MY_COMMON_LIST @"/api/task/myCommonList"      //车主常用任务列表
//#define POST_TASK_DETAIL @"/api/task/detail"                    //任务详情
//#define POST_TASK_AFFIRM @"/api/task/affirm"                    //司机领取出车任务
//#define POST_TASK_CANCEL @"/api/task/cancel"                    //车主和司机取消待领取任务
//#define POST_TASK_DEL_USE @"/api/task/delUse"              //车主删除常出任务
//#define GET_TASK_CAR_USER @"/api/task/carUser"                  //验证用户车主是否可以发布任务
//#define GET_TASK_DRIVE_USER @"/api/task/driveUser"              //验证用户司机是否可以领取任务
//#define POST_TASK_CONFIRM @"/api/task/confirm"                  //车主确认同意领取
//#define POST_TASK_GET_TASK @"/api/task/getTask"                 //车主获取任务所有数据
//#define POST_TASK_GET_INFOS @"/api/task/getInfos"               //司机查询资料入口
//
//#pragma mark *任务订单管理
//#define POST_ORDER_LISTS @"/api/order/lists"                        //任务订单列表
//#define POST_ORDER_DETAILS @"/api/order/details"                    //任务订单详情
//#define POST_ORDER_SET_STATUS @"/api/order/setStatus"               //更改订单状态
//#define POST_ORDER_GET_MY_ORDER_LOG @"/api/order/getMyOrderlog"     //订单通知列表
//#define POST_ORDER_GET_MESSAGE_STATUS @"/api/order/getMessageStatus"   //是否有未读的通知
//
//#pragma mark *资讯接口
//#define POST_NEWS_NEWS_LIST @"/api/news/newsList"               //获取资讯
//#define POST_NEWS_DETAIL @"/api/news/detail"                    //获取资讯详情
//
//#pragma mark *司机论坛接口
//#define POST_FORUM_ADD @"/api/forum/add"                        //发布帖子
//#define POST_FORUM_DEL @"/api/forum/del"                        //删除帖子
//#define POST_FORUM_FORUM_LIST @"/api/forum/forumList"           //帖子列表
//#define POST_FORUM_DETAIL @"/api/forum/detail"                  //帖子详情
//#define POST_FORUM_FORUM_COMMENT_LIST @"/api/forum/forumcommentList" //帖子评论列表
//#define POST_FORUM_USER_FORUM_COMMENT_LIST @"/api/forum/userForumcommentList" //人物评论列表
//#define POST_FORUM_PRAISE_LIST @"/api/forum/praiseList"         //帖子或评论点赞列表
//#define POST_FORUM_USER_PRAISE_LIST @"/api/forum/userPraiseList" //人物点赞列表
//#define POST_FORUM_EVALUEATE @"/api/forum/evaluate"             //评论或回复
//#define POST_FORUM_FORUM_COMMENT_DETAIL @"/api/forum/forumcommentDetail" //评论详情
//#define POST_FORUM_REPLY_LIST @"/api/forum/replyList"           //评论回复列表
//#define POST_FORUM_PRAISE @"/api/forum/praise"                  //点赞或取消
//#define POST_FORUM_DEL_FORUM_COMMENT @"/api/forum/delForumcomment" //评论或回复的删除
//
//#pragma mark *车主车辆管理接口
//#define GET_CAR_DRIVER_LICENCE_TYPE @"/api/car/driverlicencetype" //驾驶类型和驾照类型列表
//#define GET_CAR_CAR_ATTR @"/api/car/carAttr"                    //车辆属性
//#define POST_CAR_ADD @"/api/car/add"                            //添加车辆
//#define POST_CAR_EDIT @"/api/car/edit"                          //修改车辆
//#define POST_CAR_INFO @"/api/car/info"                          //车辆详情
//#define POST_CAR_DEL @"/api/car/del"                            //删除车辆
//#define POST_CAR_LISTS @"/api/car/lists"                        //车辆列表
//
//#pragma mark *订单评价接口
//#define POST_EVALUATE_TASK_ADD @"/api/evaluate_task/add"        //添加评价
//#define POST_EVALUATE_TASK_LISTS @"/api/evaluate_task/lists"    //评价列表
//#define POST_EVALUATE_TASK_EVALUATE_CONTENT_LIST @"/api/evaluate_task/evaluateContentList"  //评价内容列表
//#define POST_EVALUATE_TASK_CAR_EVALUATE @"/api/evaluate_task/carevaluate" //车主自动评价
//
//#pragma mark *路线管理接口
//#define POST_ROUTE_ADD @"/api/route/add"                        //添加路线
//#define POST_ROUTE_DEL @"/api/route/del"                        //删除路线
//#define POST_ROUTE_ROUTE_LIST @"/api/route/routeList"           //查看路线列表
//
//#pragma mark *找车记录
//#define POST_CONTACTRECORD_ADD @"/api/contactrecord/add"        //添加找车记录
//#define POST_CONTACTRECORD_LISTS @"/api/contactrecord/lists"    //找车记录列表
//
//#pragma mark *通知消息管理
//#define POST_MESSAGE_LISTS @"/api/message/lists"                 //通知消息列表
//#define GET_MESSAGE_SET_STATUS @"/api/message/setStatus"        //设置通知消息已读
//
//#pragma mark *协议接口
//#define GET_PROTOCOL_DETAIL @"/api/protocol/detail"             //协议详情
//
//#pragma mark *反馈管理
//#define POST_FEEDBACK_ADD @"/api/feedback/add"                  //反馈提交
//
//#pragma mark *积分管理
//#define GET_INTEGRAL_TEL_CHARGE_LIST @"/api/integral/telChargeList" //话费列表
//#define POST_INTEGRAL_EXCHANGE_TEL_CHARGE @"/api/integral/exchangeTelCharge" //积分兑换话费
//#define POST_INTEGRAL_LISTS @"/api/integral/lists"              //积分订单列表
//
//#pragma mark *积分签到接口
//#define POST_SIGN_IN_SIGN @"/api/sign_in/sign"                  //签到
//#define POST_SIGN_IN_INTEGRAL_WATER @"/api/sign_in/integralWater" //积分明细
//
//#pragma mark *论坛服务页面
//#define POST_SERVICE_FORUM_SERVICE @"/api/service/forumService"  //论坛服务页面
//
//
//#define GET_USER_REFEREEDETAIL @"/api/user/refereeDetail"  //邀请明细
//
//
//#endif /* ChrysanthemumNet_h */
