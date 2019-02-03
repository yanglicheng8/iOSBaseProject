//
//  MDMethod.m
//  Unicorn_Aged
//
//  Created by Leo on 2018/7/24.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "MDMethod.h"
#import <CommonCrypto/CommonDigest.h>
#import <objc/runtime.h>
#import "MDDetailImageView.h"
//数据库
//#import <JQFMDB/JQFMDB.h>
//#import "DriverAreaSelectViewModel.h"

@interface MDMethod()

@property (nonatomic, copy) FieldChangeHandle fieldChangeHandle;

@property (nonatomic, strong) MDDetailImageView *detailImageView;

@property (nonatomic, strong) QMainAlertView *alertView;

@property (nonatomic, strong) QMainLoadView *qMainLoadView;

@end

@implementation MDMethod

static MDMethod *_instance;


+ (id)allocWithZone:(struct _NSZone *)zone
{
    //调用dispatch_once保证在多线程中也只被实例化一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)shareMDMethodManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MDMethod alloc] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    
    return self;
}

//给电话号码加***
+ (NSString *)dealEncryptCallPhone:(NSString *)phone{
    if (phone.length > 6) {
        NSString *str1 = [phone substringToIndex:2];
        NSString *str2 = [phone substringFromIndex:phone.length - 4];
        return [NSString stringWithFormat:@"%@*****%@", str1, str2];
    }
    return phone;
}

/// 获取启动图
+ (UIImage *)MD_getLaunchImage {
    
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString* viewOrientation = @"Portrait";
    NSString* launchImage = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for(NSDictionary* dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if(CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImage = dict[@"UILaunchImageName"];
            return [UIImage imageNamed:launchImage];
        }
    }
    
    return nil;
}

/// 获取APP Icon
+ (UIImage *)MD_getAppIcon {
    
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    
    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    
    UIImage* image = [UIImage imageNamed:icon];

    return image;
}

/// 获取文本高度
+ (CGFloat)queryTextHeightByString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)fontSize {
    
    UIFont * tfont = [UIFont systemFontOfSize:fontSize];
    //高度估计文本大概要显示几行，宽度根据需求自己定义。 MAXFLOAT 可以算出具体要多高
    CGSize size =CGSizeMake(width,CGFLOAT_MAX);
    // 获取当前文本的属性
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize actualsize =[string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    return actualsize.height;
    
}

/// 获取文本宽度
+ (CGFloat)queryTextWidthByString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)fontSize {
    
    UIFont * tfont = [UIFont systemFontOfSize:fontSize];
    //高度估计文本大概要显示几行，宽度根据需求自己定义。 MAXFLOAT 可以算出具体要多高
    CGSize size =CGSizeMake(width,CGFLOAT_MAX);
    // 获取当前文本的属性
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize actualsize =[string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    return actualsize.width;
    
}

/// 判断是否安装程序
+ (BOOL)haveInstallApp:(MDMethod_APP_NAME)appName {
    switch (appName) {
        case MDMethod_APP_NAME_Alipay:
        {
            
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"alipays://"]] || [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"alipay://"]]) {
                
                return YES;
            }
            break;
        }
        case MDMethod_APP_NAME_Wechat:
        {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
                
                return YES;
            }
            break;
        }
        case MDMethod_APP_NAME_QQ:
        {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
                
                return YES;
            }
            break;
        }
        case MDMethod_APP_NAME_Sina:
        {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"Sinaweibo://"]]) {
                
                return YES;
            }
            break;
        }
        default:
            break;
    }
    
    return NO;
}

/// 根据ClassName获取控件
+ (UIView *)generateViewWithNib:(NSString *)className {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil];
    Class targetClass = NSClassFromString(className);
    for (UIView *view in views) {
        if ([view isMemberOfClass:targetClass]) {
            return view;
        }
    }
    return nil;
}

/// md5加密
+ (NSString *)md5:(NSString *)input number:(NSInteger)number {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest ); // This is the md5 call
    if (number < 0) {
        number = 1;
    }
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * number];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}

#pragma mark - MD5加密 16位 大写
+ (NSString *)MD5ForUpper16Bate:(NSString *)str{
    
    NSString *md5Str = [self MD5ForUpper32Bate:str];
    
    NSString *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}
#pragma mark - MD5加密 32位 小写
+ (NSString *)MD5ForUpper32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    NSString *digestResult = [digest lowercaseString];
    return digestResult;
}

/// URLEncoded
+ (NSString *)URLEncodedStringWithUrl:(NSString *)url {
    
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)url,NULL,(CFStringRef) @"!*'();:@&=+$,%#[]|",kCFStringEncodingUTF8));
    
    return encodedString;
}

/// URLdecoded
+ (NSString *)URLdecodedStringWithUrl:(NSString *)url  {
    
    NSString *decodeURL;
    if (@available(iOS 9.0, *)) {
        
        decodeURL = [url stringByRemovingPercentEncoding];
    } else {
        
        decodeURL = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    return decodeURL;
}

/// 保存倒计时
+ (void)saveVerifyCodeTime {
    NSInteger now = (NSInteger)[[NSDate date] timeIntervalSince1970];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:now forKey:@"md_verify_code_time"];
    
    [userDefaults synchronize];
}

/// 获取倒计时时间
+ (NSInteger)getVerifyCodeTime {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger timerTime = [userDefaults integerForKey:@"md_verify_code_time"];
    return timerTime;
}

/// 跳转登录
+ (void)presentLoginViewController:(UIViewController *)loginVc {
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    [result presentViewController:loginVc animated:YES completion:^{
        
    }];
}

/// json转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    if(err)
    {
        NSLog(@"%@", [NSString stringWithFormat:@"json解析失败：%@",err]);
        return nil;
    }
    return dic;
}

/// object转json
+ (NSString *)jsonStringWithObject:(id)object {
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

/// float保留2位小数
+ (CGFloat)reserveDecimals:(CGFloat)floatNum {
    
    return (floorf(floatNum*100 + 0.5))/100;
}

///图片转data
+ (void)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)maxLength complete:(void (^)(NSData *imageData))complete {
    
    maxLength = maxLength * 1024;
    
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength){
        
        NSLog(@"初始图片符合尺寸，图片已经压缩成 %fKB",data.length/1024.0);
        complete(data);
        return;
    }
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    UIImage *resultImage = [UIImage imageWithData:data];
    if (data.length < maxLength) {
        
        NSLog(@"基本压缩后，图片已经压缩成 %fKB",data.length/1024.0);
        complete(data);
        return;
    }
    
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    NSLog(@"尺寸压缩后，图片已经压缩成 %fKB",data.length/1024.0);
    
    resultImage = [UIImage imageWithData:data];
    
    complete(data);
    return;
}

/// 压缩图片到指定文件大小 - 返回image
+ (void)compressOriginalImageToImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)maxLength complete:(void (^)(UIImage *resultImage))complete {
    
    maxLength = maxLength * 1024;
    
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength){
        
        NSLog(@"初始图片符合尺寸，图片已经压缩成 %fKB",data.length/1024.0);
        complete(image);
        return;
    }
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    UIImage *resultImage = [UIImage imageWithData:data];
    
    if (data.length < maxLength) {
        
        NSLog(@"基本压缩后，图片已经压缩成 %fKB",data.length/1024.0);
        complete(resultImage);
        return;
    }
    
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    NSLog(@"尺寸压缩后，图片已经压缩成 %fKB",data.length/1024.0);
    
    resultImage = [UIImage imageWithData:data];
    
    complete(resultImage);
    return;
}

/// 时间戳转时间
/// 获取当前时间戳
+ (NSString *)getCurrentStamp {
    
    NSDate *currentDate = [NSDate date];
    NSInteger currentStamp = (long)[currentDate timeIntervalSince1970];
    
    return [NSString stringWithFormat:@"%ld", currentStamp];
}

/// 时间戳转NSDateComponents,时间戳为13位是精确到毫秒的，10位精确到秒
+ (NSDateComponents *)getDateStringWithTimeStamp:(NSInteger)stamp {
    
    NSString *stamp_str = [NSString stringWithFormat:@"%ld", stamp];
    if (stamp_str.length == 13) {
        stamp = stamp/1000; //传入的时间戳str如果是精确到毫秒的记得要/1000
    }
    
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:stamp];
    
    //日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:detailDate];
    
    return cmps;
    
}

/// 计算两个时间戳相差的时间,转NSDateComponents
+ (NSDateComponents *)getTimeInterval:(NSInteger)startStamp endTime:(NSInteger)endStamp {
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger delta = [timeZone secondsFromGMT];
    
    NSString *startTime_str = [NSString stringWithFormat:@"%ld", startStamp];
    NSString *endTime_str = [NSString stringWithFormat:@"%ld", endStamp];
    
    //时间戳转时间
    if (startTime_str.length == 13) {
        startStamp = startStamp/1000;
    }
    if (endTime_str.length == 13) {
        endStamp = endStamp/1000;
    }
    
    //日期
    NSDate *startDate = [[NSDate alloc] initWithTimeIntervalSince1970:startStamp + delta];
    NSDate *endDate = [[NSDate alloc] initWithTimeIntervalSince1970:endStamp + delta];
    
    //日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    
    return cmps;
}

/// 计算传入的时间戳与当前时间差，转NSDateComponents
+ (NSDateComponents *)getTimeInterval:(NSInteger)stamp {
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger delta = [timeZone secondsFromGMT];
    
    NSDate *currentDate = [NSDate date];
    NSInteger currentStamp = (long)[currentDate timeIntervalSince1970];
    
    NSString *startTime_str = [NSString stringWithFormat:@"%ld", currentStamp];
    NSString *endTime_str = [NSString stringWithFormat:@"%ld", stamp];
    
    //时间戳转时间
    if (startTime_str.length == 13) {
        currentStamp = currentStamp/1000;
    }
    if (endTime_str.length == 13) {
        stamp = stamp/1000;
    }
    
    //日期
    NSDate *startDate = [[NSDate alloc] initWithTimeIntervalSince1970:currentStamp + delta];
    NSDate *endDate = [[NSDate alloc] initWithTimeIntervalSince1970:stamp + delta];
    
    //日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    
    return cmps;
}

/// 时间转时间戳
+ (NSString *)getTimeStrWithString:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:str];//将字符串转换为时间对象
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]*1000];//字符串转成时间戳,精确到毫秒*1000
    return timeStr;
    
}

/// 时间转NSDateComponents
+ (NSDateComponents *)getDateComponentsWithString:(NSString *)str {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:str];//将字符串转换为时间对象
    
    //日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:tempDate];
    
    return cmps;
}

/// 比较传入的时间戳是否晚于当前时间
+ (BOOL)compareCurrentTime:(NSInteger)stamp {
    
    NSDate *currentDate = [NSDate date];
    NSInteger currentStamp = (long)[currentDate timeIntervalSince1970];
    
    NSString *startTime_str = [NSString stringWithFormat:@"%ld", currentStamp];
    NSString *endTime_str = [NSString stringWithFormat:@"%ld", stamp];
    
    //时间戳转时间
    if (startTime_str.length == 13) {
        currentStamp = currentStamp/1000;
    }
    if (endTime_str.length == 13) {
        stamp = stamp/1000;
    }
    
    if (stamp > currentStamp) {
        
        return YES;
    }
    
    return NO;
}

/// 获取Caches目录路径
+ (NSString *)getCachesPath{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,YES);
    NSString *cachesDir = [paths lastObject];
    
    return cachesDir;
}

/// 获取path路径下文件夹大小
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path {
    
    // 获取“path”文件夹下的所有文件
    NSArray *subPathArr = [[NSFileManager defaultManager] subpathsAtPath:path];
    
    NSString *filePath  = nil;
    NSInteger totleSize = 0;
    
    for (NSString *subPath in subPathArr){
        
        // 1. 拼接每一个文件的全路径
        filePath =[path stringByAppendingPathComponent:subPath];
        // 2. 是否是文件夹，默认不是
        BOOL isDirectory = NO;
        // 3. 判断文件是否存在
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
        
        // 4. 以上判断目的是忽略不需要计算的文件
        if (!isExist || isDirectory || [filePath containsString:@".DS"]){
            // 过滤: 1. 文件夹不存在  2. 过滤文件夹  3. 隐藏文件
            continue;
        }
        
        // 5. 指定路径，获取这个路径的属性
        NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        /**
         attributesOfItemAtPath: 文件夹路径
         该方法只能获取文件的属性, 无法获取文件夹属性, 所以也是需要遍历文件夹的每一个文件的原因
         */
        
        // 6. 获取每一个文件的大小
        NSInteger size = [dict[@"NSFileSize"] integerValue];
        
        // 7. 计算总大小
        totleSize += size;
    }
    
    //8. 将文件夹大小转换为 M/KB/B
    NSString *totleStr = nil;
    
    if (totleSize > 1000 * 1000){
        totleStr = [NSString stringWithFormat:@"%.2fM",totleSize / 1000.00f /1000.00f];
        
    }else if (totleSize > 1000){
        totleStr = [NSString stringWithFormat:@"%.2fKB",totleSize / 1000.00f ];
        
    }else{
        totleStr = [NSString stringWithFormat:@"%.2fB",totleSize / 1.00f];
    }
    
    return totleStr;
}

/// 清除path文件夹下缓存大小
+ (BOOL)clearCacheWithFilePath:(NSString *)path {
    
    //拿到path路径的下一级目录的子文件夹
    NSArray *subPathArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    NSString *filePath = nil;
    
    NSError *error = nil;
    
    for (NSString *subPath in subPathArr)
    {
        filePath = [path stringByAppendingPathComponent:subPath];
        
        //删除子文件夹
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if (error) {
            //            return NO;
        }
    }
    return YES;
}

/// 根据传入的字符串获取二维码图片
+ (UIImage *)generateQRCodeWithCode:(NSString *)code {
    // 1.将字符串转换成NSData
    NSData *data = [code dataUsingEncoding:NSUTF8StringEncoding];
    
    // 2.创建二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 3.恢复默认
    [filter setDefaults];
    
    // 4.给滤镜设置数据
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    // 5.获取滤镜输出的二维码
    CIImage *outputImage = [filter outputImage];
    
    // 6.此时生成的还是CIImage，可以通过下面方式生成一个固定大小的UIImage
    CGFloat size = 200;
    CGRect extent = CGRectIntegral(outputImage.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 7.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:outputImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 8.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

/// 生成条形码
+ (UIImage *)generateBarCodeWithCode:(NSString *)code size:(CGSize)size {
    // 1.将字符串转换成NSData
    NSData *data = [code dataUsingEncoding:NSUTF8StringEncoding];
    
    // 2.创建条形码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    
    // 3.恢复滤镜的默认属性
    [filter setDefaults];
    
    // 4.设置滤镜inputMessage数据
    [filter setValue:data forKey:@"inputMessage"];
    
    [filter setValue:[NSNumber numberWithInteger:4] forKey:@"inputQuietSpace"];
    
    // 5.获得滤镜输出的图像
    CIImage *urlImage = [filter outputImage];
    
    // 6.将CIImage 转换为UIImage
    
    UIImage *result = [self resizeCodeImage:urlImage withSize:size];
    
    return result;
}

+ (UIImage *)resizeCodeImage:(CIImage *)image withSize:(CGSize)size {
    if (image) {
        CGRect extent = CGRectIntegral(image.extent);
        CGFloat scaleWidth = size.width/CGRectGetWidth(extent);
        CGFloat scaleHeight = size.height/CGRectGetHeight(extent);
        size_t width = CGRectGetWidth(extent) * scaleWidth;
        size_t height = CGRectGetHeight(extent) * scaleHeight;
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
        CGContextRef contentRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpaceRef, (CGBitmapInfo)kCGImageAlphaNone);
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef imageRef = [context createCGImage:image fromRect:extent];
        CGContextSetInterpolationQuality(contentRef, kCGInterpolationNone);
        CGContextScaleCTM(contentRef, scaleWidth, scaleHeight);
        CGContextDrawImage(contentRef, extent, imageRef);
        CGImageRef imageRefResized = CGBitmapContextCreateImage(contentRef);
        CGContextRelease(contentRef);
        CGImageRelease(imageRef);
        return [UIImage imageWithCGImage:imageRefResized];
    }else{
        return nil;
    }
}

/// 根据传入的可变数组、关键字排序
+ (void)sortArray:(NSMutableArray *)array With:(NSString *)keyword {
    [array sortUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2) {
        
        NSString *index1 = [obj1 objectForKey:keyword];
        NSString *index2 = [obj2 objectForKey:keyword];
        
        return index1 < index2;
    }];
}

/// 传入数组、关键字(非必传，如果不传，则认为数组元素为字符串)，根据拼音排序，并返回一个排序数组（只是单纯排序)，如果传入的deep为yes则为深排序(排序，并按首字母分类）
+ (NSArray *)getSortArrayByArray:(NSArray *)inpuArray keyword:(NSString *)keyword deepSort:(BOOL)deep {
    
    NSArray *sortArray = inpuArray;
    
    if (deep) {
        
        if (MDKStringIsEmpty(keyword)) {
            
            sortArray = [sortArray sortedArrayUsingComparator:^(NSString *str1,NSString *str2) {
                
                if ([str1 localizedCompare:str2] == 1) {
                    
                    return NSOrderedDescending;
                } else {
                    
                    return NSOrderedAscending;
                }
                
            }];
            
            NSMutableArray *deepSortArray = [NSMutableArray arrayWithCapacity:0];
            
            if (sortArray.count > 0) {
                
                NSString *currentFirstLetterStr = [self getFirstLetterFromString:[sortArray firstObject]];
                NSMutableDictionary *currentDic = [NSMutableDictionary dictionaryWithCapacity:0];
                NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:0];
                
                for (int i=0; i<sortArray.count; i++) {
                    
                    NSString *tempFirstLetterStr = [self getFirstLetterFromString:sortArray[i]];
                    if ([currentFirstLetterStr isEqualToString:tempFirstLetterStr]) {
                        
                        [tempArray addObject:sortArray[i]];
                    } else {
                        
                        [currentDic setObject:tempArray forKey:currentFirstLetterStr];
                        [deepSortArray addObject:currentDic];
                        
                        currentFirstLetterStr = tempFirstLetterStr;
                        currentDic = [NSMutableDictionary dictionaryWithCapacity:0];
                        [tempArray removeAllObjects];
                        i--;
                    }
                    
                }
                
            }
            
            return deepSortArray;
            
        } else {
            
            sortArray = [sortArray sortedArrayUsingComparator:^(NSObject *dic1,NSObject *dic2) {
                
                NSDictionary *tempDic1;
                NSDictionary *tempDic2;
                if (![[dic1 class] isKindOfClass:[NSDictionary class]]) {
                    
                    tempDic1 = [self dicFromObject:dic1];
                    tempDic2 = [self dicFromObject:dic2];
                } else {
                    
                    tempDic1 = (NSDictionary *)dic1;
                    tempDic2 = (NSDictionary *)dic2;
                }
                
                if ([tempDic1[keyword] localizedCompare:tempDic2[keyword]] == 1) {
                    
                    return NSOrderedDescending;
                } else {
                    
                    return NSOrderedAscending;
                }
                
            }];
            
            NSMutableArray *deepSortArray = [NSMutableArray arrayWithCapacity:0];
            
            if (sortArray.count > 0) {
                
                NSString *currentFirstLetterStr = [self getFirstLetterFromString:[self dicFromObject:[sortArray firstObject]][keyword]];
                NSMutableDictionary *currentDic = [NSMutableDictionary dictionaryWithCapacity:0];
                NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:0];
                
                for (int i=0; i<sortArray.count; i++) {
                    
                    NSString *tempFirstLetterStr = [self getFirstLetterFromString:[self dicFromObject:sortArray[i]][keyword]];
                    if ([currentFirstLetterStr isEqualToString:tempFirstLetterStr]) {
                        
                        [tempArray addObject:sortArray[i]];
                        if (i == sortArray.count - 1) {
                            [currentDic setObject:tempArray forKey:currentFirstLetterStr];
                            [deepSortArray addObject:currentDic];
                        }
                        
                    } else {
                        
                        [currentDic setObject:tempArray forKey:currentFirstLetterStr];
                        [deepSortArray addObject:currentDic];
                        
                        currentFirstLetterStr = tempFirstLetterStr;
                        currentDic = [NSMutableDictionary dictionaryWithCapacity:0];
                        tempArray = [NSMutableArray arrayWithCapacity:0];
                        i--;
                    }
                    
                }
                
            }
            
            return deepSortArray;
        }
    } else {
        
        if (MDKStringIsEmpty(keyword)) {
            
            sortArray = [sortArray sortedArrayUsingComparator:^(NSString *str1,NSString *str2) {
                
                if ([str1 localizedCompare:str2] == 1) {
                    
                    return NSOrderedDescending;
                } else {
                    
                    return NSOrderedAscending;
                }
                
            }];
            
            return sortArray;
            
        } else {
            
            sortArray = [sortArray sortedArrayUsingComparator:^(NSObject *dic1,NSObject *dic2) {
                
                NSDictionary *tempDic1;
                NSDictionary *tempDic2;
                if (![[dic1 class] isKindOfClass:[NSDictionary class]]) {
                    
                    tempDic1 = [self dicFromObject:dic1];
                    tempDic2 = [self dicFromObject:dic2];
                } else {
                    
                    tempDic1 = (NSDictionary *)dic1;
                    tempDic2 = (NSDictionary *)dic2;
                }
                
                if ([tempDic1[keyword] localizedCompare:tempDic2[keyword]] == 1) {
                    
                    return NSOrderedDescending;
                } else {
                    
                    return NSOrderedAscending;
                }
                
            }];
            
            return sortArray;
        }
    }
  
}

//获取字符串首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)getFirstLetterFromString:(NSString *)aString {
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *strPinYin = [str capitalizedString];
    //获取并返回首字母
    return [strPinYin substringToIndex:1];
}

//model转化为字典
+ (NSDictionary *)dicFromObject:(NSObject *)object {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([object class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithUTF8String:cName];
        NSObject *value = [object valueForKey:name];//valueForKey返回的数字和字符串都是对象
        
        if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
            //string , bool, int ,NSinteger
            [dic setObject:value forKey:name];
            
        } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
            //字典或字典
            [dic setObject:[self getArrayOrDicWithObject:(NSArray*)value] forKey:name];
            
        } else if (value == nil) {
            //null
            //[dic setObject:[NSNull null] forKey:name];//这行可以注释掉?????
            
        } else {
            //model
            [dic setObject:[self dicFromObject:value] forKey:name];
        }
    }
    
    return [dic copy];
}

//将可能存在model数组转化为普通数组
+ (id)getArrayOrDicWithObject:(id)origin {
    if ([origin isKindOfClass:[NSArray class]]) {
        //数组
        NSMutableArray *array = [NSMutableArray array];
        for (NSObject *object in origin) {
            if ([object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNumber class]]) {
                //string , bool, int ,NSinteger
                [array addObject:object];
                
            } else if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]]) {
                //数组或字典
                [array addObject:[self getArrayOrDicWithObject:(NSArray *)object]];
                
            } else {
                //model
                [array addObject:[self dicFromObject:object]];
            }
        }
        
        return [array copy];
        
    } else if ([origin isKindOfClass:[NSDictionary class]]) {
        //字典
        NSDictionary *originDic = (NSDictionary *)origin;
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        for (NSString *key in originDic.allKeys) {
            id object = [originDic objectForKey:key];
            
            if ([object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNumber class]]) {
                //string , bool, int ,NSinteger
                [dic setObject:object forKey:key];
                
            } else if ([object isKindOfClass:[NSArray class]] || [object isKindOfClass:[NSDictionary class]]) {
                //数组或字典
                [dic setObject:[self getArrayOrDicWithObject:object] forKey:key];
                
            } else {
                //model
                [dic setObject:[self dicFromObject:object] forKey:key];
            }
        }
        
        return [dic copy];
    }
    
    return [NSNull null];
}

/**
 *  获取自定义控件总高度 - 根据传入的数组，动态赋予位置信息
 *
 *  @param widgetInsert         每两行控件的间隔
 *  @param widgetRowInsert      同一行的两个控件之间的间隔
 *  @param widgetMaxWidth       最大宽度
 *  @param widgetFont           控件文字大小
 *  @param widgets              输入的数组
 */
+ (void)getWidgetHeightWithWidgetInsert:(CGFloat)widgetInsert widgetRowInsert:(CGFloat)widgetRowInsert widgetMaxWidth:(CGFloat)widgetMaxWidth widgetFont:(CGFloat)widgetFont widgets:(NSArray *)widgets complete:(void (^)(CGFloat))complete {
    
    //总高度
    CGFloat widgetTotalHeight = 0;
    //当前宽度
    CGFloat tempTotalWidth = 0;
    //每个控件多余的高度
    CGFloat tempWidgetInsertHeight = 10;
    //每个控件多余的宽度
    CGFloat tempWidgetInsertWidth = 15.;
    
    //一个标志，是否重新计算高度
    BOOL resetHeightState = YES;
    
    for (int i=0; i<widgets.count; i++) {
        
        NSString *widgetStr = widgets[i];
        
        CGFloat widgetSingleWidth = [MDMethod queryTextWidthByString:widgetStr width:MAXFLOAT fontSize:widgetFont] + tempWidgetInsertWidth;
        CGFloat widgetSingleHight = [MDMethod queryTextHeightByString:widgetStr width:widgetMaxWidth fontSize:widgetFont]+ tempWidgetInsertHeight;
        
        if (tempTotalWidth + widgetSingleWidth > widgetMaxWidth) {
            
            widgetTotalHeight += widgetSingleHight + widgetRowInsert;
            
            resetHeightState = NO;
            if (widgetSingleWidth > widgetMaxWidth) {
                
                tempTotalWidth = 0;
                resetHeightState = YES;
            } else {
                
                tempTotalWidth = widgetSingleWidth + widgetRowInsert;
            }
        } else {
            
            if (resetHeightState) {
            
                widgetTotalHeight += widgetSingleHight + widgetRowInsert;
                resetHeightState = NO;
            }
            
            tempTotalWidth += widgetSingleWidth + widgetInsert;
        }

    }
    
    complete(widgetTotalHeight);
}

/**
 *  获取自定义控件每个控件的frame - 根据传入的数组，动态赋予位置信息
 *
 *  @param widgetInsert         每两行控件的间隔
 *  @param widgetRowInsert      同一行的两个控件直接的间隔
 *  @param widgetMaxWidth       最大宽度
 *  @param widgetFont           控件文字大小
 *  @param widgets              输入的数组
 */
+ (void)getWidgetFrameWithWidgetLeftMargin:(CGFloat)widgetLeftMargin widgetTopMargin:(CGFloat)widgetTopMargin widgetInsert:(CGFloat)widgetInsert widgetRowInsert:(CGFloat)widgetRowInsert widgetMaxWidth:(CGFloat)widgetMaxWidth widgetFont:(CGFloat)widgetFont widgets:(NSArray *)widgets complete:(void (^)(NSArray *))complete {
    
    NSMutableArray *widgetFrameArray = [NSMutableArray arrayWithCapacity:0];
    
    //x
    CGFloat widgetTempX = widgetLeftMargin;
    //y
    CGFloat widgetTempY = widgetTopMargin;
    //当前宽度
//    CGFloat tempTotalWidth = 0;
    //每个控件多余的高度
    CGFloat tempWidgetInsertHeight = 10;
    //每个控件多余的宽度
    CGFloat tempWidgetInsertWidth = 15.;
    
    //一个标志，是否重新计算高度
    BOOL resetHeightState = NO;
    
    for (int i=0; i<widgets.count; i++) {
        
        NSString *widgetStr = widgets[i];
        
        CGFloat widgetSingleWidth = [MDMethod queryTextWidthByString:widgetStr width:MAXFLOAT fontSize:widgetFont] + tempWidgetInsertWidth;
        CGFloat widgetSingleHight = [MDMethod queryTextHeightByString:widgetStr width:widgetMaxWidth fontSize:widgetFont]+ tempWidgetInsertHeight;
        
        if (widgetTempX + widgetSingleWidth > widgetMaxWidth) {
        
            if (i > 0) {
                
                CGRect lastWidgetRect = [[widgetFrameArray objectAtIndex:i-1] CGRectValue];
                widgetTempY += lastWidgetRect.size.height + widgetRowInsert;
            }
            
            if (widgetSingleWidth > widgetMaxWidth) {
                
                widgetTempX = widgetLeftMargin;
                [widgetFrameArray addObject:[NSValue valueWithCGRect:CGRectMake(widgetTempX, widgetTempY, widgetMaxWidth, widgetSingleHight)]];
                resetHeightState = YES;
            } else {
                
                widgetTempX = widgetLeftMargin;
                [widgetFrameArray addObject:[NSValue valueWithCGRect:CGRectMake(widgetTempX, widgetTempY, widgetSingleWidth, widgetSingleHight)]];
                widgetTempX += widgetSingleWidth + widgetRowInsert;
            }
            
        } else {
            
            if (resetHeightState) {
                
                CGRect lastWidgetRect = [[widgetFrameArray objectAtIndex:i-1] CGRectValue];
                widgetTempY += lastWidgetRect.size.height + widgetRowInsert;
                
                resetHeightState = NO;
            }
            
            [widgetFrameArray addObject:[NSValue valueWithCGRect:CGRectMake(widgetTempX, widgetTempY, widgetSingleWidth, widgetSingleHight)]];
            
            widgetTempX += widgetSingleWidth + widgetRowInsert;
        }
        
    }
    
    complete(widgetFrameArray);
}

// 读取本地JSON文件
+ (NSArray *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

/// 传入数字，转为字符串，如果数字大于传入的数字（如果传入的数字为0则默认为99），返回（*+）样式
+ (NSString *)getRelativelyNumber:(NSInteger)originalNumber max:(NSInteger)maxNumber {
    
    maxNumber = maxNumber <= 0 ? 99 : maxNumber;
    
    if (originalNumber >= maxNumber) {
        
        return [NSString stringWithFormat:@"%ld+", maxNumber];
    }
    
    return [NSString stringWithFormat:@"%ld", originalNumber];
}

#pragma mark UI类
/// 颜色渐变器
+ (CAGradientLayer *)generateGradientLayerWithBounds:(CGRect)bounds
                                          startPoint:(CGPoint)startPoint
                                            endPoint:(CGPoint)endPoint
                                              colors:(NSArray *)colors
                                       seperatePoint:(NSArray *)points {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = bounds;
    
    layer.startPoint = startPoint;
    layer.endPoint = endPoint;
    
    //设置颜色数组
    layer.colors = colors;
    //设置颜色分割点（范围：0-1）
    layer.locations = points;
    
    return layer;
}

/// 按钮设置 图片在上，文字在下
+ (void)setCustomButton:(UIButton *)button image:(NSString *)imageStr title:(NSString *)title titleColor:(UIColor *)color titleFont:(CGFloat)font interval:(CGFloat)interval controlState:(UIControlState)state {
    //
    [button setTitle:title forState:state];
    [button setTitleColor:color forState:state];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    
    [button setImage:[UIImage imageNamed:imageStr] forState:state];
    
    button.titleLabel.backgroundColor = button.backgroundColor;
    button.imageView.backgroundColor = button.backgroundColor;
    
    CGSize titleSize = button.titleLabel.bounds.size;
    CGSize imageSize = button.imageView.bounds.size;
    
    [button setImageEdgeInsets:UIEdgeInsetsMake(0,(titleSize.width)/2, titleSize.height + interval, -(titleSize.width)/2)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height + interval, -(imageSize.width)/2, 0, (imageSize.width)/2)];
    
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
}

/// 按钮设置 图片在右，文字在左
+ (void)setCustomAroundButton:(UIButton *)button image:(NSString *)imageStr title:(NSString *)title titleColor:(UIColor *)color titleFont:(CGFloat)font controlState:(UIControlState)state {
    
    [button setTitle:title forState:state];
    [button setTitleColor:color forState:state];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setImage:[UIImage imageNamed:imageStr] forState:state];
    
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(button.mdk_width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil].size;
    
    CGFloat titleWidth = titleSize.width;
    //    CGFloat titleHeight = titleSize.height;
    CGFloat imageWidth = button.imageView.mdk_width;
    //    CGFloat imageHeight = button.imageView.mdk_height;
    
    button.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + 3, 0, -titleWidth - 3);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
    
}
/// 按钮设置 带边框，非圆角
+ (void)setCustomBorderButton:(UIButton *)button backgroundColor:(UIColor *)backgroundColor title:(NSString *)title borderColor:(UIColor *)borderColor titleColor:(UIColor *)color titleFont:(CGFloat)font controlState:(UIControlState)state {
    
    button.backgroundColor = backgroundColor;
    [button setTitle:title forState:state];
    [button setTitleColor:color forState:state];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = 1.;
}

/// 按钮设置 带边框，圆角
+ (void)setCustomBorderCornerButton:(UIButton *)button backgroundColor:(UIColor *)backgroundColor title:(NSString *)title borderColor:(UIColor *)borderColor titleColor:(UIColor *)color titleFont:(CGFloat)font controlState:(UIControlState)state {
    
    button.backgroundColor = backgroundColor;
    [button setTitle:title forState:state];
    [button setTitleColor:color forState:state];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.layer.cornerRadius = button.mdk_height / 2;
    button.layer.borderColor = borderColor.CGColor;
    button.layer.borderWidth = 1.;
}

/// 获得自定义按钮
+ (UIButton *)getCustomButton:(CGRect)customFram customTitle:(NSString *)customTitle customBgColor:(UIColor *)bgColor titleColor:(UIColor *)titleColor titleFont:(CGFloat)titleFont cornerRadius:(CGFloat)cornerRadius target:(id)target sel:(SEL)selecter {
    
    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = customFram;
    customButton.backgroundColor = bgColor;
    
    [customButton setTitle:customTitle forState:UIControlStateNormal];
    [customButton setTitleColor:titleColor forState:UIControlStateNormal];
    customButton.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    
    customButton.layer.cornerRadius = cornerRadius;
    [customButton addTarget:target action:selecter forControlEvents:UIControlEventTouchUpInside];
    
    return customButton;
}

/// 根据传入的文字、颜色、size、等获得富文本
+ (NSMutableAttributedString *)getAttributedString:(NSString *)str attriColor:(UIColor *)attriColor normalColr:(UIColor *)normalColor font:(CGFloat)attriFont attriSize:(NSInteger)attriSize {
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    [attrString addAttribute:NSForegroundColorAttributeName value:attriColor range:NSMakeRange(0, attriSize)];
    [attrString addAttribute:NSForegroundColorAttributeName value:normalColor range:NSMakeRange(attriSize, str.length - attriSize)];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:attriFont] range:NSMakeRange(0, str.length)];
    
    
    return attrString;
}

/// 根据传入的文字、颜色、size、等获得富文本(只改变文字颜色) - 加强版（可传入数组）
+ (NSMutableAttributedString *)getAttributedString:(NSString *)str colors:(NSArray *)colors attris:(NSArray *)attris fonts:(NSArray *)fonts {
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    
    NSInteger tempX = 0;
    
    for (int i=0; i<colors.count; i++) {
        
        [attrString addAttribute:NSForegroundColorAttributeName value:colors[i] range:NSMakeRange(tempX, [attris[i] integerValue])];
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:[fonts[i] floatValue]] range:NSMakeRange(tempX, [attris[i] integerValue])];
        tempX = tempX + [attris[i] integerValue];
    }
    
    return attrString;
}

/// 根据传入的文字、颜色、size、等获得富文本(改变文字颜色、字体)
+ (NSMutableAttributedString *)getAttributedString:(NSString *)str attriColor:(UIColor *)attriColor normalColr:(UIColor *)normalColor attriFont:(CGFloat)attriFont normalFont:(CGFloat)normalFont attriSize:(NSInteger)attriSize {
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    [attrString addAttribute:NSForegroundColorAttributeName value:attriColor range:NSMakeRange(0, attriSize)];
    [attrString addAttribute:NSForegroundColorAttributeName value:normalColor range:NSMakeRange(attriSize, str.length - attriSize)];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:attriFont] range:NSMakeRange(0, attriSize)];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:normalFont] range:NSMakeRange(attriSize, str.length - attriSize)];
    
    return attrString;
    
}

/// 给view添加通用的手势
+ (void)addNormalTapGesture:(UIView *)view target:(id)target action:(SEL)selection {
    
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:selection];
    [view addGestureRecognizer:tapGesture];
}

/// 给imageView添加手势
+ (void)addImageViewTapGesture:(UIImageView *)imageView index:(NSInteger)index handle:(TapGestureHandle)handle {
    
    [[self shareMDMethodManager] addImageViewTapGesture:imageView index:index handle:handle];
}

- (void)addImageViewTapGesture:(UIImageView *)imageView index:(NSInteger)index handle:(TapGestureHandle)handle {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapGesture:)];
    [imageView setTag: 1100+index]; //set tag value
    [imageView addGestureRecognizer:tapGesture];
    [imageView setUserInteractionEnabled:YES];
    
    self.tapGestureHandle = handle;
}

- (void)imageTapGesture:(UIGestureRecognizer *)sender {
    
    self.tapGestureHandle(sender.view.tag - 1100);
}

/// 根据传入的NibName和frame获取view
+ (UIView *)getNibViewByNibName:(NSString *)nibName frame:(CGRect)frame {
    
    UIView *nibView;
    
    UINib *nib = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
    NSArray *objs = [nib instantiateWithOwner:nil options:nil];
    nibView = objs[0];
    
    nibView.frame = frame;
    
    return nibView;
}

/// 给textfield添加监听
+ (void)addMonitorForTextField:(UITextField *)textField fieldChangeHandle:(FieldChangeHandle)fieldChangeHandle {
    
    [[self shareMDMethodManager] addMonitorForTextField:textField fieldChangeHandle:fieldChangeHandle];
}

- (void)addMonitorForTextField:(UITextField *)textField fieldChangeHandle:(FieldChangeHandle)fieldChangeHandle {
    
    [textField addTarget:self action:@selector(textFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
    self.fieldChangeHandle = fieldChangeHandle;
}

- (void)textFieldTextChange:(UITextField *)textField {
    
    self.fieldChangeHandle(textField.text);
}

/// 彩色图片转换为黑白图片
+ (UIImage*)grayImage:(UIImage*)sourceImage {
    
    CGFloat image_width = sourceImage.size.width;
    CGFloat image_height = sourceImage.size.height;
    
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef context = CGBitmapContextCreate(nil, image_width, image_height, 8., 0, colorSpace, kCGImageAlphaNone);
    
    if (context == NULL) {
        return nil;
    }
    
    CGContextDrawImage(context, CGRectMake(0, 0, image_width, image_height), sourceImage.CGImage);
    
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    
    return grayImage;
}

/// 修改图片颜色
+ (void)resetImageViewTintColorWithImageView:(UIImageView *)imageView image:(UIImage *)image tintcolor:(UIColor *)tintcoclor {
    
    if (image.renderingMode != UIImageRenderingModeAlwaysTemplate) {
        imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    
    imageView.tintColor = tintcoclor;
    
}

/// 修改按钮图片颜色
+ (void)resetButtonImageViewTintColorWithImageView:(UIButton *)button image:(UIImage *)image tintcolor:(UIColor *)tintcoclor {
    
    if (image.renderingMode != UIImageRenderingModeAlwaysTemplate) {
        [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    }
    
    button.tintColor = tintcoclor;
    
}

/// 查看大图(根据传入的图片展示)
+ (void)showDetailImageWithImage:(UIImage *)detailImage; {
    
    if (detailImage == nil) {
        
        return;
    }
    
    [[self shareMDMethodManager] showDetailImageWithImage:detailImage];
}

/// 查看大图(根据传入的url展示)
+ (void)showDetailImageWithUrl:(NSString *)imgUrl {
    
    if (MDKStringIsEmpty(imgUrl)) {
        
        return;
    }
    
    UIImage *detailImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl]]];
    
    if (detailImage == nil) {
        
        return;
    }
    
    [[self shareMDMethodManager] showDetailImageWithImage:detailImage];
}

- (void)showDetailImageWithImage:(UIImage *)detailImage {
    
    self.detailImageView = [[MDDetailImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.detailImageView.detailImage = detailImage;
    
    [self.detailImageView show];
}

/// 弹出提示框
+ (void)alertWithTitle:(NSString *)titleText
               content:(NSString *)content
          cancelButton:(NSString *)cancelButtonText
          otherButtons:(NSArray*)otherButtonArray
                 style:(QMainAlertViewStyle)style
            parameters:(NSDictionary *)params
           alertHandle:(QMainAlertHandle)alertHandle {
    
    [[self shareMDMethodManager] alertWithTitle:titleText content:content cancelButton:cancelButtonText otherButtons:otherButtonArray style:style parameters:params alertHandle:alertHandle];
}

/// 弹出提示框
- (void)alertWithTitle:(NSString *)titleText
               content:(NSString *)content
          cancelButton:(NSString *)cancelButtonText
          otherButtons:(NSArray*)otherButtonArray
                 style:(QMainAlertViewStyle)style
            parameters:(NSDictionary *)params
           alertHandle:(QMainAlertHandle)alertHandle {
    
    self.alertView = [[QMainAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.alertView setAlertWithTitle:titleText andContent:content andCancelButton:cancelButtonText andOtherButtons:otherButtonArray style:style parameters:nil alertHandle:^(NSInteger selectIndex) {
        
        alertHandle(selectIndex);
    }];
    
    [self.alertView show];
}

/// 加载中
+ (void)showLoadingWithSuperView:(UIView *)superView tipsString:(NSString *)tipsString {
    
    [[self shareMDMethodManager] showLoadingWithSuperView:superView tipsString:tipsString];
}

- (void)showLoadingWithSuperView:(UIView *)superView tipsString:(NSString *)tipsString {
    
    [self hideLoadView];
    
    [self addLoadViewToSuperView:superView];
    [self.qMainLoadView loading:tipsString];
}

/// 加载失败
+ (void)showLoadFailureWithSuperView:(UIView *)superView tipsString:(NSString *)tipsString {
    
    [[self shareMDMethodManager] showLoadFailureWithSuperView:superView tipsString:tipsString];
}

- (void)showLoadFailureWithSuperView:(UIView *)superView tipsString:(NSString *)tipsString {
    
    [self hideLoadView];
    
    [self addLoadViewToSuperView:superView];
    [self.qMainLoadView loadFail:tipsString];
}

/// 列表为空
+ (void)showEmptyListWithSuperView:(UIView *)superView tipsString:(NSString *)tipsString {
    
    [[self shareMDMethodManager] showEmptyListWithSuperView:superView tipsString:tipsString];
}

- (void)showEmptyListWithSuperView:(UIView *)superView tipsString:(NSString *)tipsString {
    
    [self hideLoadView];
    
    [self addLoadViewToSuperView:superView];
    [self.qMainLoadView loadEmptList:tipsString];
}

/// 列表隐藏
+ (void)hideLoadView {
    
    [[self shareMDMethodManager] hideLoadView];
}

- (void)hideLoadView {
    
    [self.qMainLoadView removeFromSuperview];
}

- (void)addLoadViewToSuperView:(UIView *)superView {
    
    self.qMainLoadView = [[QMainLoadView alloc] initWithFrame:CGRectMake(0, 0, superView.mdk_width, superView.mdk_height)];
    self.qMainLoadView.userInteractionEnabled = NO;
    [superView addSubview:self.qMainLoadView];
}

/// 获取通用的MJRefreshNormalHeader
static NSString * CUSTOM_MJ_HEADER_IDLE_DES = @"继续下拉刷新";
static NSString * CUSTOM_MJ_HEADER_PULLING_DES = @"释放更新";
static NSString * CUSTOM_MJ_HEADER_REFRESHING_DES = @"更新中...";
+ (MJRefreshNormalHeader *)getMJRefreshNormalHeaderWithTarget:(id)target action:(SEL)action {
    
    MJRefreshNormalHeader *mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    
    mj_header.lastUpdatedTimeLabel.hidden = YES;
    
    [mj_header setTitle:CUSTOM_MJ_HEADER_IDLE_DES forState:MJRefreshStateIdle];
    [mj_header setTitle:CUSTOM_MJ_HEADER_PULLING_DES forState:MJRefreshStatePulling];
    [mj_header setTitle:CUSTOM_MJ_HEADER_REFRESHING_DES forState:MJRefreshStateRefreshing];
    
    mj_header.stateLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    mj_header.stateLabel.textColor = TEXT_BLACK_COLOR;
    
    return mj_header;
}

/// 获取通用的MJRefreshAutoNormalFooter
static NSString * CUSTOM_MJ_FOOTER_IDLE_DES = @"继续上拉加载更多";
static NSString * CUSTOM_MJ_FOOTER_REFRESHING_DES = @"加载中...";
static NSString * CUSTOM_MJ_FOOTER_NOMOREDATA_DES = @"没有更多数据啦";
+ (MJRefreshAutoNormalFooter *)getMJRefreshAutoNormalFooterWithTarget:(id)target action:(SEL)action {
    
    MJRefreshAutoNormalFooter *mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    
    mj_footer.triggerAutomaticallyRefreshPercent = 10.f;
    
    [mj_footer setTitle:CUSTOM_MJ_FOOTER_IDLE_DES forState:MJRefreshStateIdle];
    [mj_footer setTitle:CUSTOM_MJ_FOOTER_REFRESHING_DES forState:MJRefreshStateRefreshing];
    [mj_footer setTitle:CUSTOM_MJ_FOOTER_NOMOREDATA_DES forState:MJRefreshStateNoMoreData];
    
    mj_footer.stateLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    mj_footer.stateLabel.textColor = TEXT_BLACK_COLOR;
    
    return mj_footer;
}

/// 几个常用的文字展示

/// TEXT_BLACK_COLOR & DETAIL_NORMAL_FONT_SIZE
+ (void)setNormalDetailTextColorLalbel:(UILabel *)label {
    
    label.textColor = TEXT_BLACK_COLOR;
    label.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
}

/// TEXT_BLACK_COLOR & DETAIL_FONT_SIZE
+ (void)setDetailTextColorLabel:(UILabel *)label {
    
    label.textColor = TEXT_BLACK_COLOR;
    label.font = [UIFont systemFontOfSize:DETAIL_FONT_SIZE];
}

/// TEXT_BLACK_COLOR & MINI_FONT_SIZE
+ (void)setMiniTextColorLabel:(UILabel *)label {
    
    label.textColor = TEXT_BLACK_COLOR;
    label.font = [UIFont systemFontOfSize:MINI_FONT_SIZE];
}

/// TEXT_BLACK_COLOR & TITLE_FONT_SIZE
+ (void)setTitleTextColorLabel:(UILabel *)label {
    
    label.textColor = TEXT_BLACK_COLOR;
    label.font = [UIFont systemFontOfSize:TITLE_FONT_SIZE];
}

/// TEXT_BLACK_COLOR & TITLE_BIG_FONT_SIZE
+ (void)setBigTitleTextColorLabel:(UILabel *)label {
    
    label.textColor = TEXT_BLACK_COLOR;
    label.font = [UIFont systemFontOfSize:TITLE_BIG_FONT_SIZE];
}

/// SUBTITLE_GRAY_COLOR & DETAIL_NORMAL_FONT_SIZE
+ (void)setNormalDetailSubtextColorLabel:(UILabel *)label {
    
    label.textColor = SUBTITLE_GRAY_COLOR;
    label.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
}

/// SUBTITLE_GRAY_COLOR & DETAIL_FONT_SIZE
+ (void)setDetailSubtextColorLabel:(UILabel *)label {
    
    label.textColor = SUBTITLE_GRAY_COLOR;
    label.font = [UIFont systemFontOfSize:DETAIL_FONT_SIZE];
}

/// SUBTITLE_GRAY_COLOR & MINI_FONT_SIZE
+ (void)setMiniSubtextColorLabel:(UILabel *)label {
    
    label.textColor = SUBTITLE_GRAY_COLOR;
    label.font = [UIFont systemFontOfSize:MINI_FONT_SIZE];
}

/// SUBTITLE_GRAY_COLOR & TITLE_FONT_SIZE
+ (void)setTitleSubtextColorLabel:(UILabel *)label{
    
    label.textColor = SUBTITLE_GRAY_COLOR;
    label.font = [UIFont systemFontOfSize:TITLE_FONT_SIZE];
}

/// SUBTITLE_GRAY_COLOR & TITLE_BIG_FONT_SIZE
+ (void)setBigTitleSubtextColorLabel:(UILabel *)label{
    
    label.textColor = SUBTITLE_GRAY_COLOR;
    label.font = [UIFont systemFontOfSize:TITLE_BIG_FONT_SIZE];
}

+ (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


+ (void)readCityList {
#ifdef Driver
    //获取是否读取完整，如果不完整，重新读取
//    BOOL readComplete = [[NSUserDefaults standardUserDefaults] boolForKey:@"driverRouteAreaReadCmplete"];
//
//    if (!readComplete) {
//
//        MDK_asyncWithGlobaQueue(^{
//
//            //初始化数据量
//            JQFMDB *jqFmdb = [[JQFMDB shareDatabase:[NSString stringWithFormat:@"%@.sqlite", CHRYSANTHEMUN_DB_NAME]] init];
//
//            [jqFmdb jq_inDatabase:^{
//
//                //删除表先
//                [jqFmdb jq_deleteTable:DRIVER_ROUTE_AREA_TABLE];
//                //读取json数据
//                NSArray *cityArray = [MDMethod readLocalFileWithName:@"city_2"];
//
//                NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:0];
//
//                for (NSDictionary *cityInfo in cityArray) {
//                    //将数据模型化，并添加到数组
//                    DriverAreaSelectViewModel *cityModel = [[DriverAreaSelectViewModel alloc] initWithData:cityInfo];
//                    [tempArray addObject:cityModel];
//                }
//
//                //建表
//                [jqFmdb jq_createTable:DRIVER_ROUTE_AREA_TABLE dicOrModel:[DriverAreaSelectViewModel class]];
//                //添加数据
//                [jqFmdb jq_insertTable:DRIVER_ROUTE_AREA_TABLE dicOrModelArray:tempArray];
//
//                //判断是否添加完整
//                if ([jqFmdb jq_tableItemCount:DRIVER_ROUTE_AREA_TABLE] == cityArray.count) {
//
//                    NSUserDefaults *areaDefaluts = [NSUserDefaults standardUserDefaults];
//                    [areaDefaluts setBool:YES forKey:@"driverRouteAreaReadCmplete"];
//                    [areaDefaluts synchronize];
//                } else {
//
//                    NSUserDefaults *areaDefaluts = [NSUserDefaults standardUserDefaults];
//                    [areaDefaluts setBool:NO forKey:@"driverRouteAreaReadCmplete"];
//                    [areaDefaluts synchronize];
//                }
//
//                //关闭表
//                [jqFmdb close];
//
//            }];
//        });
//    }
#endif
}

+ (UIImage *)createBarWithUrlString:(NSString *)url{
    //创建过滤器
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //过滤器恢复默认
   [filter setDefaults];
    //给过滤器添加数据
//    NSString *string = @"http://www.cnblogs.com/PSSSCode/";
    //将NSString格式转化成NSData格式
    NSData *data = [url dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    [filter setValue:data forKeyPath:@"inputMessage"];
    //设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
    /*
     * L: 7%
     * M: 15%
     * Q: 25%
     * H: 30%
     */
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    //获取二维码过滤器生成的二维码
    CIImage *image = [filter outputImage];
    
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat size = 320;
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
    
    
//    [se]
    //将获取到的二维码添加到imageview上
//    return [UIImage imageWithCIImage:image];
    
}

- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
 {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
     CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
      CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
     CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
      CGContextScaleCTM(bitmapRef, scale, scale);
       CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
     CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
     CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
   return [UIImage imageWithCGImage:scaledImage];
}

@end
