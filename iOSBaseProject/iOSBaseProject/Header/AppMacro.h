//
//  ConventionHeader.h
//  Unicorn_Aged
//
//  Created by 李孟东 on 2018/7/24.
//  Copyright © 2018年 dareway. All rights reserved.
//

#ifndef ConventionHeader_h
#define ConventionHeader_h

#pragma mark - 颜色
//背景颜色
#define BACKGROUND_COLOR [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1]
//背景轻颜色
#define BACKGROUND_WEAK_COLOR [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:0.6]
//主题颜色
//#ifdef Owner
//#define THEME_COLOR [UIColor colorWithRed:46/255.0 green:167/255.0 blue:224/255.0 alpha:1]
//#else
//#define THEME_COLOR [UIColor colorWithRed:251/255.0 green:134/255.0 blue:29/255.0 alpha:1]
//#endif

#define THEME_COLOR [UIColor colorWithRed:251/255.0 green:134/255.0 blue:29/255.0 alpha:1]

//特殊颜色 1
#define SPECTIAL_COLOR_1 [UIColor colorWithRed:251/255.0 green:134/255.0 blue:29/255.0 alpha:0.2]
//线条颜色
#define LINE_GRAY_COLOR [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1]
//字体常规颜色
#define TEXT_BLACK_COLOR [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1]
//字体轻色
#define SUBTITLE_GRAY_COLOR [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]
//字体弱色
#define SUBTITLE_WEAK_COLOR [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.6]
//placeholder颜色
#define PLACEHOLDER_COLOR [UIColor colorWithRed:194/255.0 green:194/255.0 blue:194/255.0 alpha:1]

#pragma mark - 文字尺寸
//大标题
#define TITLE_BIG_FONT_SIZE  23.
//小标题
#define TITLE_FONT_SIZE 17.
//内容文字
#define DETAIL_NORMAL_FONT_SIZE 15.
//详细内容
#define DETAIL_FONT_SIZE 13.
//小标注
#define MINI_FONT_SIZE 11.
//最小标注
#define MINI_MINI_FONT_SIZE 9.

#pragma mark - 时间间隔
///hud消失时间
#define MDHUDDuration (1.5)
///倒计时
#define MDCountDown (60)
///动画时间
#define MDAnimationDuration (0.4)

#pragma mark - 分页
///常用 - 20
#define MD_NORMAL_PAGESIZE @"20"


#pragma mark - NSString格式化
#define StringFMT(fmt,...) [NSString stringWithFormat:fmt,##__VA_ARGS__]

#pragma mark - 弱引用
#define WEAKSELF __weak typeof(self) weakSelf = self;
#define BLOCKSELF __block typeof(self) blockSelf=self;


//全屏宽高
#define K_SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
#define K_SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define Iphone6Scale(x) ((x) * K_SCREENWIDTH / 375.0f)//375X667
//顶部状态栏高度
#define  kStatusBarHeight      (IS_iPhoneX ? 44.f : 20.f)
//顶部标题栏高度
#define  kNavigationBarHeight  44.f
//底部tabbar高度
#define  kTabbarHeight        (IS_iPhoneX ? (49.f+34.f) : 49.f)
//底部安全距离
#define  kTabbarSafeBottomMargin        (IS_iPhoneX ? 34.f : 0.f)
//顶部状态栏+标题栏高度
#define  kStatusBarAndNavigationBarHeight  (IS_iPhoneX ? 88.f : 64.f)
//判断是否iPhone X
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


//方便使用(颜色字号尺寸大小)
/////调试
#if 1
#define DEBUG_VIEW_COLOR [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0]
#else
#define DEBUG_VIEW_COLOR [UIColor clearColor]
#endif

//如果不需要log,把1改成0
#if 1
#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif


#ifdef Owner
//车主端
//证件识别,人脸识别设置鉴权
// 人脸license文件名
#define FACE_LICENSE_NAME    @"idl-license"
// 人脸license后缀
#define FACE_LICENSE_SUFFIX  @"face-ios"
// （您申请的应用名称(appname)+「-face-ios」后缀，如申请的应用名称(appname)为test123，则此处填写test123-face-ios）
// 在后台 -> 产品服务 -> 人脸识别 -> 客户端SDK管理查看，如果没有的话就新建一个
#define FACE_LICENSE_ID        @"rmm-owner-face-ios"
// OCR license文件名
#define OCR_LICENSE_NAME @"aip"
// OCR license后缀
#define OCR_LICENSE_SUFFIX @"license"
// 以下两个在后台 -> 产品服务 -> 人脸识别 -> 应用列表下面查看，如果没有的话就新建一个
// 您的API Key
#define FACE_API_KEY @"G95E6xtcAYVYVhbUubGkZlDl"
// 您的Secret Key
#define FACE_SECRET_KEY @"0XseyWVC3VGOPz6ky0ok0akGvdKk7tMb"
#elif Driver
//司机端
//证件识别,人脸识别设置鉴权
// 人脸license文件名
#define FACE_LICENSE_NAME    @"idl-license_driver"
// 人脸license后缀
#define FACE_LICENSE_SUFFIX  @"face-ios"
// （您申请的应用名称(appname)+「-face-ios」后缀，如申请的应用名称(appname)为test123，则此处填写test123-face-ios）
// 在后台 -> 产品服务 -> 人脸识别 -> 客户端SDK管理查看，如果没有的话就新建一个
#define FACE_LICENSE_ID        @"rmm-driver-face-ios"
// OCR license文件名
#define OCR_LICENSE_NAME @"aip_driver"
// OCR license后缀
#define OCR_LICENSE_SUFFIX @"license"
// 以下两个在后台 -> 产品服务 -> 人脸识别 -> 应用列表下面查看，如果没有的话就新建一个
// 您的API Key
#define FACE_API_KEY @"G95E6xtcAYVYVhbUubGkZlDl"
// 您的Secret Key
#define FACE_SECRET_KEY @"0XseyWVC3VGOPz6ky0ok0akGvdKk7tMb"

#endif

//加密验签
#define K_PUBLICKEY @""
#define K_SIGN_KEY @"daaf356b1b06677783d078bdfb54ce7e"
//请求失败
#define ConnectError [SVProgressHUD showErrorWithStatus:@"网络请求失败"]
#pragma mark ---------------------------------第三方常量
//友盟APPKEY
#define UmengAppkey @""
//微信
#define WXAppId @""
#define WXappSecret @""
//腾讯
#define QQAppID @""
#define QQAppkey @""
//新浪
#define SinaAppkey @""


#endif /* ConventionHeader_h */
