//
//  MDUserDefaults.m
//  Unicorn
//
//  Created by Marshall Yang on 2018/1/8.
//  Copyright © 2018年 Marshall Yang. All rights reserved.
//

#import "MDUserDefaults.h"

#import <JPush/JPUSHService.h>

@implementation MDUserDefaults

//保存用户信息（获取用户信息后调用）
+ (void)saveUserInfo:(NSDictionary *)userInfo {
    
    [MDUserDefaults saveUserId:[NSString stringWithFormat:@"%@", userInfo[@"id"]]];
    [MDUserDefaults saveUserRealName:[NSString stringWithFormat:@"%@", userInfo[@"real_name"]]];
    [MDUserDefaults saveUserCellphone:[NSString stringWithFormat:@"%@", userInfo[@"mobile"]]];
    [MDUserDefaults saveUserScore:[NSString stringWithFormat:@"%@", userInfo[@"score"]]];
    [MDUserDefaults saveUserDepositState:[NSString stringWithFormat:@"%@", userInfo[@"deposit"]]];
    [MDUserDefaults saveUserVipState:[NSString stringWithFormat:@"%@", userInfo[@"is_vip"]]];
    [MDUserDefaults saveUserAvatar:[NSString stringWithFormat:@"%@", userInfo[@"avatar"]]];
    if ([[userInfo allKeys] containsObject:@"avatar_copy_url"]) {
        [MDUserDefaults saveUserCerAvatar:[NSString stringWithFormat:@"%@", userInfo[@"avatar_copy_url"]]];
    } else {
        [MDUserDefaults saveUserCerAvatar:@""];
    }
    [MDUserDefaults saveUserSignInState:[NSString stringWithFormat:@"%@", userInfo[@"is_sign"]]];
    [MDUserDefaults saveUserOrderCount:[NSString stringWithFormat:@"%@", userInfo[@"ordercount"]]];
    [MDUserDefaults saveUserRate:[NSString stringWithFormat:@"%@", userInfo[@"rate"]]];
    [MDUserDefaults saveUserDepositMoney:[NSString stringWithFormat:@"%@", userInfo[@"deposit_money"]]];
    [MDUserDefaults saveUserCerCheckState:[NSString stringWithFormat:@"%@", userInfo[@"is_check"]]];
    [MDUserDefaults saveServiceMobile:[NSString stringWithFormat:@"%@", userInfo[@"service_mobile"]]];
    [MDUserDefaults saveDayMoney:[NSString stringWithFormat:@"%@", userInfo[@"daymoney"]]];
    [MDUserDefaults saveYearMoney:[NSString stringWithFormat:@"%@", userInfo[@"yearmoney"]]];
    [MDUserDefaults saveShare_url:[NSString stringWithFormat:@"%@", userInfo[@"share_url"]]];
    [MDUserDefaults saveNowOrderCount:[NSString stringWithFormat:@"%@", userInfo[@"nowOrderCount"]]];
    [MDUserDefaults saveIscheck:[NSString stringWithFormat:@"%@", userInfo[@"is_check"]]];
    [MDUserDefaults saveIsdriver:[NSString stringWithFormat:@"%@", userInfo[@"is_driver"]]];\
    [MDUserDefaults saveContrastVal:[NSString stringWithFormat:@"%@", userInfo[@"contrastVal"]]];
    [MDUserDefaults saveIsdrivermsg:[NSString stringWithFormat:@"%@", userInfo[@"is_driver_msg"]]];
    //极光推送 注册别名
    [JPUSHService setAlias:[MDMethod MD5ForUpper16Bate:[NSString stringWithFormat:@"renmanman%@", userInfo[@"id"]]] completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        
        MDKLog(@"jpush iAlias       %@", iAlias);
        
    } seq:1];
}

//人脸识别分数
+(NSString *)contrastVal{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *contrastVal = [userDefaults objectForKey:USERCONTRASTVAL];
    if (MDKStringIsEmpty(contrastVal)) {
        return @"";
    }
    return contrastVal;
}
+ (void)saveContrastVal:(NSString *)contrastVal{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(contrastVal) forKey:USERCONTRASTVAL];
    [userDefaults synchronize];
}

+(NSString *)is_driver_msg{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *is_driver_msg = [userDefaults objectForKey:USERISDRIVERMSG];
    if (MDKStringIsEmpty(is_driver_msg)) {
        return @"";
    }
    return is_driver_msg;
}
+ (void)saveIsdrivermsg:(NSString *)is_driver_msg{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(is_driver_msg) forKey:USERISDRIVERMSG];
    [userDefaults synchronize];
}

//司机是否认证驾驶证
+(NSString *)is_driver{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *is_driver = [userDefaults objectForKey:USERISDRIVER];
    if (MDKStringIsEmpty(is_driver)) {
        return @"";
    }
    return is_driver;
}
+ (void)saveIsdriver:(NSString *)is_driver{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(is_driver) forKey:USERISDRIVER];
    [userDefaults synchronize];
}

//用户是否实名认证
+(NSString *)is_check{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *is_check = [userDefaults objectForKey:USERISCHECK];
    if (MDKStringIsEmpty(is_check)) {
        return @"";
    }
    return is_check;
}
+ (void)saveIscheck:(NSString *)is_check{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(is_check) forKey:USERISCHECK];
    [userDefaults synchronize];
}

//待评价任务数
+ (NSString *)nowOrderCount{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *nowOrderCount = [userDefaults objectForKey:USERNOWORDERCOUNT];
    if (MDKStringIsEmpty(nowOrderCount)) {
        return @"";
    }
    return nowOrderCount;
}
+ (void)saveNowOrderCount:(NSString *)nowOrderCount{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(nowOrderCount) forKey:USERNOWORDERCOUNT];
    [userDefaults synchronize];
}

//分享
+ (NSString *)share_url{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *share_url = [userDefaults objectForKey:USERASHAREURL];
    if (MDKStringIsEmpty(share_url)) {
        return @"";
    }
    return share_url;
}

+ (void)saveShare_url:(NSString *)share_url{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(share_url) forKey:USERASHAREURL];
    [userDefaults synchronize];
}

//uid
+ (NSString *)userId {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userId = [userDefaults objectForKey:USERID];
    if (MDKStringIsEmpty(userId)) {
        return @"";
    }
    return userId;
}

+ (void)saveUserId:(NSString *)userId {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(userId) forKey:USERID];
    
    [userDefaults synchronize];
}

// 昵称
+ (NSString *)userNickName {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *nickname = [userDefaults objectForKey:USERNICKNAME];
    if (MDKStringIsEmpty(nickname)) {
        return @"";
    }
    return nickname;
}

+ (void)saveUserNickname:(NSString *)nickname {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(nickname) forKey:USERNICKNAME];
    
    [userDefaults synchronize];
}

/// 真实姓名
+ (NSString *)userRealName {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *realName = [userDefaults objectForKey:USEREALNAME];
    if (MDKStringIsEmpty(realName)) {
        return @"";
    }
    return realName;
}

+ (void)saveUserRealName:(NSString *)realName {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(realName) forKey:USEREALNAME];
    
    [userDefaults synchronize];
}

/// 审核状态
+ (NSInteger)userCerCheckState {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger cerState = [userDefaults integerForKey:USERCERSTATE];
    
    return cerState;
}

+ (void)saveUserCerCheckState:(NSString *)cerCheckState {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:[cerCheckState integerValue] forKey:USERCERSTATE];
    
    [userDefaults synchronize];
}

/// 积分
+ (NSInteger)userScore {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger userScore = [userDefaults integerForKey:USERSCORE];
    
    return userScore;
}

+ (void)saveUserScore:(NSString *)score {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:[score integerValue] forKey:USERSCORE];
    
    [userDefaults synchronize];
}

///余额
+ (CGFloat)userBalance {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat userBalance = [userDefaults floatForKey:USERBALANCE];
    
    return userBalance;
}

+ (void)saveUserBalance:(NSString *)balance {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:[balance integerValue] forKey:USERBALANCE];
    
    [userDefaults synchronize];
}

/// 生日
+ (NSString *)userBirthday {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *birthday = [userDefaults objectForKey:USERBIRTHDAY];
    if (MDKStringIsEmpty(birthday)) {
        return @"";
    }
    return birthday;
}

+ (void)saveUserBirthday:(NSString *)birthday {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(birthday) forKey:USERBIRTHDAY];
    
    [userDefaults synchronize];
}

// 性别
+ (NSInteger)userSex {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger usersex = [userDefaults integerForKey:USERSEX];
    
    return usersex;
}

+ (void)saveUserSex:(NSString *)sex {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:[sex integerValue] forKey:USERSEX];
    
    [userDefaults synchronize];
}

//头像
+ (NSString *)userAvatar {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userAvatar = [userDefaults objectForKey:USERAVATAR];
    if (MDKStringIsEmpty(userAvatar)) {
        return @"";
    }
    return userAvatar;
}

+ (void)saveUserAvatar:(NSString *)avatarAddress {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(avatarAddress) forKey:USERAVATAR];
    
    [userDefaults synchronize];
}

//头像 - 审核中的头像
+ (NSString *)userCerAvatar {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userCerAvatar = [userDefaults objectForKey:USER_CER_AVATAR];
    if (MDKStringIsEmpty(userCerAvatar)) {
        return @"";
    }
    return userCerAvatar;
}

+ (void)saveUserCerAvatar:(NSString *)cerAvatarAddress {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(cerAvatarAddress) forKey:USER_CER_AVATAR];
    
    [userDefaults synchronize];
}


/// 保证金是否缴纳
+ (BOOL)userDepositState {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger depositState = [userDefaults integerForKey:@"USERDEPOSITSTATE"];
    
    if (depositState == 1) {
        
        return YES;
    }
    
    return NO;
}

+ (void)saveUserDepositState:(NSString *)depositState {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:[depositState integerValue] forKey:@"USERDEPOSITSTATE"];
    
    [userDefaults synchronize];
}

/// vip状态
+ (BOOL)userVipState {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger vipState = [userDefaults integerForKey:@"USERVIPSTATE"];
    
    if (vipState == 1) {
        
        return YES;
    }
    
    return NO;
}

+ (void)saveUserVipState:(NSString *)vipState {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:[vipState integerValue] forKey:@"USERVIPSTATE"];
    
    [userDefaults synchronize];
}

/// 签到状态
+ (BOOL)userSignInState {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger signInState = [userDefaults integerForKey:@"USERSIGNINSTATE"];
    
    if (signInState == 1) {
        
        return YES;
    }
    
    return NO;
}

+ (void)saveUserSignInState:(NSString *)signInState {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:[signInState integerValue] forKey:@"USERSIGNINSTATE"];
    
    [userDefaults synchronize];
}

/// 交易量
+ (NSInteger)userOrderCount {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger orderCount = [userDefaults integerForKey:@"USERORDERCOUNT"];
    
    return orderCount;
}

+ (void)saveUserOrderCount:(NSString *)orderCount {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:[orderCount integerValue] forKey:@"USERORDERCOUNT"];
    
    [userDefaults synchronize];
}

/// 好评率
+ (CGFloat)userRate {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat rate = [userDefaults floatForKey:@"USERRATE"];
    
    return rate;
}

+ (void)saveUserRate:(NSString *)rate {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:[rate integerValue] forKey:@"USERRATE"];
    
    [userDefaults synchronize];
}

/// 保证金额
+ (NSString *)userDepositMoney{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *depositMoney = [userDefaults objectForKey:@"USERDEPOSITMONEY"];
    
    return depositMoney;
}

+ (void)saveUserDepositMoney:(NSString *)depositMoney {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:depositMoney forKey:@"USERDEPOSITMONEY"];
    
    [userDefaults synchronize];
}

// 手机号
+ (NSString *)userCellphone {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *cellphone = [userDefaults objectForKey:USERCELLPHONE];
    if (MDKStringIsEmpty(cellphone)) {
        return @"";
    }
    return cellphone;
}

+ (void)saveUserCellphone:(NSString *)cellphone {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(cellphone) forKey:USERCELLPHONE];
    
    [userDefaults synchronize];
}

/// 服务电话
+ (NSString *)serviceMobile {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *serviceMobile = [userDefaults objectForKey:@"SERVICEMOBILE"];
    
    return serviceMobile;
}

+ (void)saveServiceMobile:(NSString *)serviceMobile {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:serviceMobile forKey:@"SERVICEMOBILE"];
    
    [userDefaults synchronize];
}

/// 日费金额
+ (NSString *)dayMoney {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *dayMoney = [userDefaults objectForKey:@"DAYMONEY"];
    
    return dayMoney;
}

+ (void)saveDayMoney:(NSString *)dayMoney {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:dayMoney forKey:@"DAYMONEY"];
    
    [userDefaults synchronize];
}

/// 年费金额
+ (NSString *)yearMoney {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *yearMoney = [userDefaults objectForKey:@"YEARMONEY"];
    
    return yearMoney;
}

+ (void)saveYearMoney:(NSString *)yearMoney {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:yearMoney forKey:@"YEARMONEY"];
    
    [userDefaults synchronize];
}

/// 经度
+ (NSString *)userLongitude {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat longitude = [userDefaults floatForKey:USERLONGITUDE];
    
    return [NSString stringWithFormat:@"%lf", longitude];
}

+ (void)saveUserLongitude:(CGFloat)longitude {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:longitude forKey:USERLONGITUDE];
    
    [userDefaults synchronize];
}

/// 纬度
+ (NSString *)userLatitude {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat latitude = [userDefaults floatForKey:USERLATITUDE];
    
    return [NSString stringWithFormat:@"%lf", latitude];
}

+ (void)saveUserLatitude:(CGFloat)latitude {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:latitude forKey:USERLATITUDE];
    
    [userDefaults synchronize];
}

//国家
+ (NSString *)userPlaceMarkCountry {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placeMarkCountry = [userDefaults objectForKey:USER_PLACEMARK_COUNTRY];
    if (MDKStringIsEmpty(placeMarkCountry)) {
        return @"";
    }
    return placeMarkCountry;
}

+ (void)saveUserPlaceMarkCountry:(NSString *)placeMarkCountry {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(placeMarkCountry) forKey:USER_PLACEMARK_COUNTRY];
    
    [userDefaults synchronize];
}

//省
+ (NSString *)userPlaceMarkProvince {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placeMarkProvince = [userDefaults objectForKey:USER_PLACEMARK_PROVINCE];
    if (MDKStringIsEmpty(placeMarkProvince)) {
        return @"";
    }
    return placeMarkProvince;
}

+ (void)saveUserPlaceMarkProvince:(NSString *)placeMarkProvince {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(placeMarkProvince) forKey:USER_PLACEMARK_PROVINCE];
    
    [userDefaults synchronize];
}

//城市
+ (NSString *)userPlaceMarkLocality {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placeMarkLocality = [userDefaults objectForKey:USER_PLACEMARK_LOCALITY];
    if (MDKStringIsEmpty(placeMarkLocality)) {
        return @"";
    }
    return placeMarkLocality;
}

+ (void)saveUserPlaceMarkLocality:(NSString *)placeMarkLocality {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(placeMarkLocality) forKey:USER_PLACEMARK_LOCALITY];
    
    [userDefaults synchronize];
}

//地区
+ (NSString *)userPlaceMarkSubLocality {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placeMarkSubLocality = [userDefaults objectForKey:USER_PLACEMARK_SUBLOCALITY];
    if (MDKStringIsEmpty(placeMarkSubLocality)) {
        return @"";
    }
    return placeMarkSubLocality;
}

+ (void)saveUserPlaceMarkSubLocality:(NSString *)placeMarkSubLocality {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(placeMarkSubLocality) forKey:USER_PLACEMARK_SUBLOCALITY];
    
    [userDefaults synchronize];
}


//街道
+ (NSString *)userPlaceMarkThoroughfare {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placeMarkThoroughfare = [userDefaults objectForKey:USER_PLACEMARK_THOROUGHFARE];
    if (MDKStringIsEmpty(placeMarkThoroughfare)) {
        return @"";
    }
    return placeMarkThoroughfare;
}

+ (void)saveUserPlaceMarkThoroughfare:(NSString *)placeMarkThoroughfare {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(placeMarkThoroughfare) forKey:USER_PLACEMARK_THOROUGHFARE];
    
    [userDefaults synchronize];
}

//详细地址
+ (NSString *)userPlaceMarkName {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *placeMarkname = [userDefaults objectForKey:USER_PLACEMARK_NAME];
    if (MDKStringIsEmpty(placeMarkname)) {
        return @"";
    }
    return placeMarkname;
}

+ (void)saveUserPlaceMarkName:(NSString *)placeMarkname {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:MDMethodCheckString(placeMarkname) forKey:USER_PLACEMARK_NAME];
    
    [userDefaults synchronize];
}

// 倒计时
+ (NSInteger)getTimerTime {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger timerTime = [userDefaults integerForKey:TIMERKEY];
    return timerTime;
}

+ (void)saveTimerTime:(NSInteger)time {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:time forKey:TIMERKEY];
    
    [userDefaults synchronize];
}

// 登录状态
+ (BOOL)customerState {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults objectForKey:CUSTOMERSTATE] == nil) {
        
        [userDefaults setObject:@"0" forKey:CUSTOMERSTATE];
        [userDefaults synchronize];
        
        return NO;
    }
    
    NSString *customerState = [userDefaults objectForKey:CUSTOMERSTATE];
    
    if ([customerState isEqualToString: @"1"]) {
        
        return YES;
    }
    
    return NO;
}

+ (void)saveCustomerState:(BOOL)customerState {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if (customerState) {
        //登录
        [userDefaults setObject:@"1" forKey:CUSTOMERSTATE];
    } else {
        //退出登录
        [userDefaults setObject:@"0" forKey:CUSTOMERSTATE];
        
        //清空token
        [userDefaults setObject:@"" forKey:USERTOKEN];
        
        //清空用户信息
        [MDUserDefaults saveUserId:@""];
        [MDUserDefaults saveUserRealName:@""];
        [MDUserDefaults saveUserScore:@""];
        [MDUserDefaults saveUserDepositState:@""];
        [MDUserDefaults saveUserVipState:@""];
        [MDUserDefaults saveUserAvatar:@""];
        [MDUserDefaults saveUserSignInState:@""];
        [MDUserDefaults saveUserOrderCount:@""];
        [MDUserDefaults saveUserRate:@""];
        [MDUserDefaults saveUserDepositMoney:@""];
        [MDUserDefaults saveUserCerCheckState:@""];
        
        //极光推送清除别名
        [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
            if (iResCode == 0) {
                MDKLog(@"别名删除成功");
            }
        } seq:1];
    }
    
    [userDefaults synchronize];
}

//保存token
+ (NSString *)getToken {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [userDefaults objectForKey:USERTOKEN];
    if (MDKStringIsEmpty(token)) {
        return @"";
    }
    return token;
}

+ (void)saveToken:(NSString *)token {
    
    NSLog(@"TOKEN TOKEN TOKEN ********* %@", token);
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:token forKey:USERTOKEN];
    
    [userDefaults synchronize];
}

//APP是否首次打开
+ (BOOL)isAppHaveOpen {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isAppHaveOpen = [userDefaults boolForKey:@"APPHAVEOPEN"];
    
    return isAppHaveOpen;
}

+ (void)saveAppHaveOpen {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:@"APPHAVEOPEN"];
    
    [userDefaults synchronize];
}

//保存APP的启动图
+ (NSData *)webLaunchImage {
    
    NSUserDefaults *webLaunchImageDefaults = [NSUserDefaults standardUserDefaults];
    NSData *webLaunchImageData = [webLaunchImageDefaults dataForKey:@"WEBLAUNCHIMAGEDATA"];
    
    return webLaunchImageData;
}

+ (NSString *)webLaunchUrl {
    
    NSUserDefaults *webLaunchImageDefaults = [NSUserDefaults standardUserDefaults];
    NSString *webLaunchUrl = [webLaunchImageDefaults stringForKey:@"WEBLAUNCHURL"];
    
    return webLaunchUrl;
}

+ (CGFloat)webLaunchCountDown {
    
    NSUserDefaults *webLaunchImageDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger webLaunchCountDown = [webLaunchImageDefaults floatForKey:@"WEBLAUNCHCOUNTDOWN"];
    
    return webLaunchCountDown;
}

+ (void)saveWebLaunchInfo:(NSDictionary *)webLaunchInfo success:(NothingHandle)success {
    
    NSString *b_image = webLaunchInfo[@"b_image"];
    NSString *b_url = webLaunchInfo[@"b_url"];
    CGFloat showtime = [webLaunchInfo[@"showtime"] floatValue];
    
    NSUserDefaults *webLaunchImageDefaults = [NSUserDefaults standardUserDefaults];
    
    //保存地址、时间
    [webLaunchImageDefaults setObject:b_url forKey:@"WEBLAUNCHURL"];
    [webLaunchImageDefaults setFloat:showtime forKey:@"WEBLAUNCHCOUNTDOWN"];
    
    if ([[webLaunchImageDefaults stringForKey:@"WEBLAUNCHIMAGE"] isEqualToString:b_image] && [webLaunchImageDefaults stringForKey:@"WEBLAUNCHIMAGEDATA"]) {
        //已经保存过图片
        NSLog(@"已经保存过图片");
//        [webLaunchImageDefaults setObject:b_image forKey:@"WEBLAUNCHIMAGE"];
//        [webLaunchImageDefaults setObject:[NSData dataWithContentsOfURL:[NSURL URLWithString:b_image]] forKey:@"WEBLAUNCHIMAGEDATA"];
        success();
    } else {
        NSLog(@"未保存");
        //未保存
        [webLaunchImageDefaults setObject:b_image forKey:@"WEBLAUNCHIMAGE"];
        [webLaunchImageDefaults setObject:[NSData dataWithContentsOfURL:[NSURL URLWithString:b_image]] forKey:@"WEBLAUNCHIMAGEDATA"];
        success();
    }
    
}

@end
