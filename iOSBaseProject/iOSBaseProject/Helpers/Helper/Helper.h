//
//  Helper.h
//  ios_base
//
//  Created by wht on 2018/5/11.
//  Copyright © 2018年 wht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManager.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>

@interface Helper : NSObject

// 获取当前显示的viewcontroller
+ (UIViewController *)getCurrentVC;

/**
 获取label中的字符串的高度和宽度
 
 @param text 需要计算的字符串
 @param fontSize 字号
 @param maxSize 最大尺寸
 @return 文字的size
 */
+ (CGSize)labelAutoCalculateRectWith:(NSString *)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize;


/**
 根据宽度、字符串、字号获得label高度

 @param width 宽度
 @param title 字符串
 @param font 字号
 @return 高度
 */
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;


/**
 根据字符串和字号获得宽度

 @param title 字符串
 @param font 字号
 @return 宽度
 */
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;


//计算UILabel的高度(带有行间距的情况)
+(void)getSpaceLabelHeight:(NSString*)str withFont:(NSInteger )font label:(UILabel*)label;

//判断手机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile;

//判断邮箱账号格式是否正确
+(BOOL)validateEmail:(NSString*)email;

//验证密码是否符合规格(根据项目要求进行更改)
+(BOOL)validatePassword:(NSString *)password;
//为空判断
+ (BOOL)isNull:(id)object;
//时间戳转时间
+ (NSString *)changeTimeWithStampString:(NSString *)timeStampString format:(NSString *)format;

/**
 设置一个时间，给一个数，正数是以后n个月，负数是前n个月；
 
 
 @param date 基准时间
 @param month 需要移的月数，可为负数
 @return 获得的日期
 */
+(NSDate *)getEarlierOrLaterDateFromDate:(NSDate *)date withMonth:(NSInteger)month;

+(NSDate *)getLaterDateFromDate:(NSDate *)date withYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day ;

//字典转JSON字符串
+ (NSString *)dictionaryToJSONString:(NSDictionary *)dictionary;
//数组转JSON字符串
+ (NSString *)arrayToJSONString:(NSArray *)array;
//颜色转换
+ (UIColor *) colorWithHexString: (NSString *)color;
//修改状态栏颜色
+ (void)setStatusBarBackgroundColor:(UIColor *)color ;

//判断手机是否是iPhoneX系列的手机，头部：普通手机：20+44，iPhone X ：44+44
+(BOOL)isIPhoneXSeries;

/**
 判断是否可以访问用户相册
 
 @return TRUE可以，FALSE不可以
 */
+ (BOOL)isCanUsePhotos;


/**
 判断是否可以访问用户x摄像头

 @return true是可以，false是不可以
 */
+(BOOL)isCanUseCamera;

//验证身份证号码
+ (BOOL)validateIdCardNum:(NSString *)idCardNum;


@end

















