//
//  MDUserDefaults.h
//  Unicorn
//
//  Created by Marshall Yang on 2018/1/8.
//  Copyright © 2018年 Marshall Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^NothingHandle)(void);
@interface MDUserDefaults : NSObject

//保存用户信息（获取用户信息后调用）
+ (void)saveUserInfo:(NSDictionary *)userInfo ;

//is_driver_msg.驾驶证提示msg
+(NSString *)is_driver_msg;
+ (void)saveIsdrivermsg:(NSString *)is_driver_msg;


//人脸识别分数
+(NSString *)contrastVal;
+ (void)saveContrastVal:(NSString *)contrastVal;

//司机是否认证驾驶证
+(NSString *)is_driver;
+ (void)saveIsdriver:(NSString *)is_driver;

//用户是否实名认证
+(NSString *)is_check;
+ (void)saveIscheck:(NSString *)is_check;


//待评价任务数
+ (NSString *)nowOrderCount;
+ (void)saveNowOrderCount:(NSString *)nowOrderCount;


//share_url 分享链接
+ (NSString *)share_url;
+ (void)saveShare_url:(NSString *)share_url;
//uid
+ (NSString *)userId;
+ (void)saveUserId:(NSString *)userId;

/// 昵称
+ (NSString *)userNickName;
+ (void)saveUserNickname:(NSString *)nickname;

// 真实姓名
+ (NSString *)userRealName;
+ (void)saveUserRealName:(NSString *)realName;

/// 审核状态
+ (NSInteger)userCerCheckState;
+ (void)saveUserCerCheckState:(NSString *)cerCheckState;

/// 积分
+ (NSInteger)userScore;
+ (void)saveUserScore:(NSString *)score;

///余额
+ (CGFloat)userBalance;
+ (void)saveUserBalance:(NSString *)balance;

/// 生日
+ (NSString *)userBirthday;
+ (void)saveUserBirthday:(NSString *)birthday;

/// 性别
+ (NSInteger)userSex;
+ (void)saveUserSex:(NSString *)sex;

/// 头像
+ (NSString *)userAvatar;
+ (void)saveUserAvatar:(NSString *)avatarAddress;

//头像 - 审核中的头像
+ (NSString *)userCerAvatar;
+ (void)saveUserCerAvatar:(NSString *)cerAvatarAddress;

/// 保证金是否缴纳
+ (BOOL)userDepositState;
+ (void)saveUserDepositState:(NSString *)depositState;

/// vip状态
+ (BOOL)userVipState;
+ (void)saveUserVipState:(NSString *)vipState;

/// 签到状态
+ (BOOL)userSignInState;
+ (void)saveUserSignInState:(NSString *)signInState;

/// 交易量
+ (NSInteger)userOrderCount;
+ (void)saveUserOrderCount:(NSString *)orderCount;

/// 好评率
+ (CGFloat)userRate;
+ (void)saveUserRate:(NSString *)rate;

/// 保证金额
+ (NSString *)userDepositMoney;
+ (void)saveUserDepositMoney:(NSString *)depositMoney;

/// 手机号码
+ (NSString *)userCellphone;
+ (void)saveUserCellphone:(NSString *)cellphone;

/// 服务电话
+ (NSString *)serviceMobile;
+ (void)saveServiceMobile:(NSString *)serviceMobile;

/// 日费金额
+ (NSString *)dayMoney;
+ (void)saveDayMoney:(NSString *)dayMoney;

/// 年费金额
+ (NSString *)yearMoney;
+ (void)saveYearMoney:(NSString *)yearMoney;

/// 经度
+ (NSString *)userLongitude;
+ (void)saveUserLongitude:(CGFloat)longitude;

/// 纬度
+ (NSString *)userLatitude;
+ (void)saveUserLatitude:(CGFloat)latitude;

//国家
+ (NSString *)userPlaceMarkCountry;
+ (void)saveUserPlaceMarkCountry:(NSString *)placeMarkCountry;

//省
+ (NSString *)userPlaceMarkProvince;
+ (void)saveUserPlaceMarkProvince:(NSString *)placeMarkProvince;

//城市
+ (NSString *)userPlaceMarkLocality;
+ (void)saveUserPlaceMarkLocality:(NSString *)placeMarkLocality;

//地区
+ (NSString *)userPlaceMarkSubLocality;
+ (void)saveUserPlaceMarkSubLocality:(NSString *)placeMarkSubLocality;

//街道
+ (NSString *)userPlaceMarkThoroughfare;
+ (void)saveUserPlaceMarkThoroughfare:(NSString *)placeMarkThoroughfare;

//详细地址
+ (NSString *)userPlaceMarkName;
+ (void)saveUserPlaceMarkName:(NSString *)placeMarkname;

/// 倒计时
+ (NSInteger)getTimerTime;
+ (void)saveTimerTime:(NSInteger)time;

//登录状态：yes登录，no登出
+ (BOOL)customerState;
+ (void)saveCustomerState:(BOOL)customerState;

//保存token
+ (NSString *)getToken;
+ (void)saveToken:(NSString *)token;

//APP是否首次打开
+ (BOOL)isAppHaveOpen;
+ (void)saveAppHaveOpen;

//保存APP的启动图
+ (NSData *)webLaunchImage;
+ (NSString *)webLaunchUrl;
+ (CGFloat)webLaunchCountDown;
+ (void)saveWebLaunchInfo:(NSDictionary *)webLaunchInfo success:(NothingHandle)success;

@end
