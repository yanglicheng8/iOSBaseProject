//
//  ConstantHeader.h
//  Chrysanthemum
//
//  Created by Leo on 2018/11/2.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#ifndef ConstantHeader_h
#define ConstantHeader_h


//车主发布任务成功之后通知跳转等待领取页面
#define COMPLETERELEASETASK @"completeReleaseTask"


/*
 *
 缓存key
 *
 */
/// 登录状态
#define CUSTOMERSTATE @"CUSTOMERSTATE"
/// token
#define USERTOKEN @"USERTOKEN"
//人脸识别分数
#define USERCONTRASTVAL @"USERCONTRASTVAL"
//驾驶证提示信息
#define USERISDRIVERMSG @"USERISDRIVERMSG"
//司机是否认证驾驶证
#define USERISDRIVER @"USERISDRIVER"
//用户是否实名认证
#define USERISCHECK @"USERISCHECK"
//车主任务待评价数
#define USERNOWORDERCOUNT @"USERNOWORDERCOUNT"
//用户分享链接
#define USERASHAREURL @"USERASHAREURL"
/// 用户id
#define USERID @"USERID"
/// 用户昵称 Key
#define USERNICKNAME @"DWHUSERNICKNAME"
/// 用户真实姓名 Key
#define USEREALNAME @"USEREALNAME"
/// 用户认证审核状态 Key
#define USERCERSTATE @"USERCERSTATE"
/// 用户积分 Key
#define USERSCORE @"USERSCORE"
/// 用户余额 Key
#define USERBALANCE @"USERBALANCE"
/// 用户生日
#define USERBIRTHDAY @"USERBIRTHDAY"
/// 用户性别
#define USERSEX @"DWHUSERSEX"
/// 用户头像 Key
#define USERAVATAR @"DWHUSERAVATAR"
/// 用户头像-审核中 Key
#define USER_CER_AVATAR @"USER_CER_AVATAR"
/// 用户手机号码 Key
#define USERCELLPHONE @"DWHUSERCELLPHONE"
///经度
#define USERLONGITUDE @"USERLONGITUDE"
///纬度
#define USERLATITUDE @"USERLATITUDE"
///国家
#define USER_PLACEMARK_COUNTRY @"USER_PLACEMARK_COUNTRY"
///省
#define USER_PLACEMARK_PROVINCE @"USER_PLACEMARK_PROVINCE"
///城市
#define USER_PLACEMARK_LOCALITY @"USER_PLACEMARK_LOCALITY"
///地区
#define USER_PLACEMARK_SUBLOCALITY @"USER_PLACEMARK_SUBLOCALITY"
///街道
#define USER_PLACEMARK_THOROUGHFARE @"USER_PLACEMARK_THOROUGHFARE"
///详细地址
#define USER_PLACEMARK_NAME @"USER_PLACEMARK_NAME"

/// 定时器 Key
#define TIMERKEY @"TIMERKEY"

/*
 *
 通知NSNotificationName
 *
 */

#define APP_PAY_RESULT @"APP_PAY_RESULT"


//自定义错误类型，区别网络获取
#define CUSTOM_ERROR_CODE @"CUSTOM_ERROR_CODE"


#endif /* ConstantHeader_h */
