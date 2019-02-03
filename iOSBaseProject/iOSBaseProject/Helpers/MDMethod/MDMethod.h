//
//  MDMethod.h
//  Unicorn_Aged
//
//  Created by Leo on 2018/7/24.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
#import "MDevKit.h"
#import "QMainAlertView.h"
#import "QMainLoadView.h"

typedef void(^FieldChangeHandle)(NSString *fieldOutput);

typedef void(^TapGestureHandle)(NSInteger index);

typedef NS_ENUM(NSInteger, MDMethod_APP_NAME) {
    
    MDMethod_APP_NAME_Alipay = 1,               //支付宝
    MDMethod_APP_NAME_Wechat,                   //微信
    MDMethod_APP_NAME_QQ,                       //QQ
    MDMethod_APP_NAME_Sina,                     //新浪微博
};

@interface MDMethod : NSObject

#pragma mark 工具类
//校验字符串
#define MDMethodCheckString(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? @"" : str )

//字符串转nsinteger
#define MDMethodStrToInt(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? 0 : [str integerValue])

//字符串转cgfloat
#define MDMethodStrTofloat(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? 0. : [str floatValue])

//NSInteger转字符串
#define MDMethodIntToStr(figure) ([NSString stringWithFormat:@"%ld", figure])

//CGFloat转字符串
#define MDMethodFloatToStr(figure) ([NSString stringWithFormat:@"%lf", figure])

+ (NSString *)dealEncryptCallPhone:(NSString *)phone;

/// 获取启动图
+ (UIImage *)MD_getLaunchImage;

/// 获取APP Icon
+ (UIImage *)MD_getAppIcon;

/// 获取文本高度
+ (CGFloat)queryTextHeightByString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)fontSize;

/// 获取文本宽度
+ (CGFloat)queryTextWidthByString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)fontSize;

/// 判断是否安装程序
+ (BOOL)haveInstallApp:(MDMethod_APP_NAME)appName;

/// 根据classname获取控件
+ (UIView *)generateViewWithNib:(NSString *)className;

/// md5加密(传入number：16*number 为加密位数)
+ (NSString *)md5:(NSString *)input number:(NSInteger)number;

/// MD5加密 16位 大写
+ (NSString *)MD5ForUpper16Bate:(NSString *)str;

/// MD5加密 32位 大写
+ (NSString *)MD5ForUpper32Bate:(NSString *)str;

/// URLEncoded
+ (NSString *)URLEncodedStringWithUrl:(NSString *)url;

/// URLdecoded
+ (NSString *)URLdecodedStringWithUrl:(NSString *)url;

/// 保存倒计时
+ (void)saveVerifyCodeTime;

/// 获取倒计时时间
+ (NSInteger)getVerifyCodeTime;

/// 跳转登录
+ (void)presentLoginViewController:(UIViewController *)loginVc;

/// json转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/// object转json
+ (NSString *)jsonStringWithObject:(id)object;

/// float保留2位小数
+ (CGFloat)reserveDecimals:(CGFloat)floatNum;

/// 压缩图片到指定文件大小 - 返回data
+ (void)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)maxLength complete:(void(^)(NSData *imageData))complete;

/// 压缩图片到指定文件大小 - 返回image
+ (void)compressOriginalImageToImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)maxLength complete:(void (^)(UIImage *resultImage))complete;

/// 时间戳 - 时间
/// 获取当前时间戳
+ (NSString *)getCurrentStamp;

/// 时间戳转NSDateComponents
+ (NSDateComponents *)getDateStringWithTimeStamp:(NSInteger)stamp;

/// 计算两个时间戳相差的时间，转NSDateComponents
+ (NSDateComponents *)getTimeInterval:(NSInteger)startStamp endTime:(NSInteger)endStamp;

/// 计算传入的时间戳与当前时间差，转NSDateComponents
+ (NSDateComponents *)getTimeInterval:(NSInteger)stamp;

/// 时间转时间戳
+ (NSString *)getTimeStrWithString:(NSString *)str;

/// 时间转NSDateComponents
+ (NSDateComponents *)getDateComponentsWithString:(NSString *)str;

/// 比较传入的时间戳是否晚于当前时间
+ (BOOL)compareCurrentTime:(NSInteger)stamp;

/// 获取Caches目录路径
+ (NSString *)getCachesPath;

/// 获取path路径下文件夹的大小
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;

/// 清除path路径下文件夹的缓存
+ (BOOL)clearCacheWithFilePath:(NSString *)path;

/// 根据传入的字符串获取二维码图片
+ (UIImage *)generateQRCodeWithCode:(NSString *)code;

/// 根据传入的字符串获取条形码
+ (UIImage *)generateBarCodeWithCode:(NSString *)code size:(CGSize)size;

/// 根据传入的可变数组、关键字排序
+ (void)sortArray:(NSMutableArray *)array With:(NSString *)keyword;

/// 传入数组、关键字(非必传，如果不传，则认为数组元素为字符串)，根据拼音排序，并返回一个排序数组（只是单纯排序)，如果传入的deep为yes则为深排序(排序，并按首字母分类）
+ (NSArray *)getSortArrayByArray:(NSArray *)inpuArray keyword:(NSString *)keyword deepSort:(BOOL)deep;

/// 获取字符串首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)getFirstLetterFromString:(NSString *)aString;

/// model转化为字典
+ (NSDictionary *)dicFromObject:(NSObject *)object;

/// 将可能存在model数组转化为普通数组
+ (id)getArrayOrDicWithObject:(id)origin;

/**
 *  获取自定义控件总高度 - 根据传入的数组，动态赋予位置信息
 *
 *  @param widgetInsert         每两行控件的间隔
 *  @param widgetRowInsert      同一行的两个控件直接的间隔
 *  @param widgetMaxWidth       最大宽度
 *  @param widgetFont           控件文字大小
 *  @param widgets              输入的数组
 */
+ (void)getWidgetHeightWithWidgetInsert:(CGFloat)widgetInsert widgetRowInsert:(CGFloat)widgetRowInsert widgetMaxWidth:(CGFloat)widgetMaxWidth widgetFont:(CGFloat)widgetFont widgets:(NSArray *)widgets complete:(void(^)(CGFloat widgetTotalHeight))complete;

/**
 *  获取自定义控件每个控件的frame - 根据传入的数组，动态赋予位置信息
 *
 *  @param widgetLeftMargin     左侧距离
 *  @param widgetTopMargin      顶部距离
 *  @param widgetInsert         每两行控件的间隔
 *  @param widgetRowInsert      同一行的两个控件直接的间隔
 *  @param widgetMaxWidth       最大宽度
 *  @param widgetFont           控件文字大小
 *  @param widgets              输入的数组
 */
+ (void)getWidgetFrameWithWidgetLeftMargin:(CGFloat)widgetLeftMargin widgetTopMargin:(CGFloat)widgetTopMargin widgetInsert:(CGFloat)widgetInsert widgetRowInsert:(CGFloat)widgetRowInsert widgetMaxWidth:(CGFloat)widgetMaxWidth widgetFont:(CGFloat)widgetFont widgets:(NSArray *)widgets complete:(void(^)(NSArray *widgetFrameArray))complete;

/// 读取本地JSON文件
+ (NSArray *)readLocalFileWithName:(NSString *)name;

/// 传入数字，转为字符串，如果数字大于传入的数字（如果传入的数字为0则默认为99），返回（*+）样式
+ (NSString *)getRelativelyNumber:(NSInteger)originalNumber max:(NSInteger)maxNumber;

#pragma mark UI类
/// 颜色渐变器
+ (CAGradientLayer *)generateGradientLayerWithBounds:(CGRect)bounds
                                          startPoint:(CGPoint)startPoint
                                            endPoint:(CGPoint)endPoint
                                              colors:(NSArray *)colors
                                       seperatePoint:(NSArray *)points;




/// 按钮设置 图片在上，文字在下
+ (void)setCustomButton:(UIButton *)button image:(NSString *)imageStr title:(NSString *)title titleColor:(UIColor *)color titleFont:(CGFloat)font interval:(CGFloat)interval controlState:(UIControlState)state;

/// 按钮设置 图片在右，文字在左
+ (void)setCustomAroundButton:(UIButton *)button image:(NSString *)imageStr title:(NSString *)title titleColor:(UIColor *)color titleFont:(CGFloat)font controlState:(UIControlState)state;

/// 按钮设置 带边框，非圆角
+ (void)setCustomBorderButton:(UIButton *)button backgroundColor:(UIColor *)backgroundColor title:(NSString *)title borderColor:(UIColor *)borderColor titleColor:(UIColor *)color titleFont:(CGFloat)font controlState:(UIControlState)state;

/// 按钮设置 带边框，圆角
+ (void)setCustomBorderCornerButton:(UIButton *)button backgroundColor:(UIColor *)backgroundColor title:(NSString *)title borderColor:(UIColor *)borderColor titleColor:(UIColor *)color titleFont:(CGFloat)font controlState:(UIControlState)state;

/// 获得自定义按钮
+ (UIButton *)getCustomButton:(CGRect)customFram customTitle:(NSString *)customTitle customBgColor:(UIColor *)bgColor titleColor:(UIColor *)titleColor titleFont:(CGFloat)titleFont cornerRadius:(CGFloat)cornerRadius target:(id)target sel:(SEL)selecter;

/// 根据传入的文字、颜色、size、等获得富文本(只改变文字颜色)
+ (NSMutableAttributedString *)getAttributedString:(NSString *)str attriColor:(UIColor *)attriColor normalColr:(UIColor *)normalColor font:(CGFloat)attriFont attriSize:(NSInteger)attriSize;

/// 根据传入的文字、颜色、size、等获得富文本(只改变文字颜色) - 加强版（可传入数组）
+ (NSMutableAttributedString *)getAttributedString:(NSString *)str colors:(NSArray *)colors attris:(NSArray *)attris fonts:(NSArray *)fonts;

/// 根据传入的文字、颜色、size、等获得富文本(改变文字颜色、字体)
+ (NSMutableAttributedString *)getAttributedString:(NSString *)str attriColor:(UIColor *)attriColor normalColr:(UIColor *)normalColor attriFont:(CGFloat)attriFont normalFont:(CGFloat)normalFont attriSize:(NSInteger)attriSize;

/// 给imageView添加手势
@property (nonatomic, copy) TapGestureHandle tapGestureHandle;
+ (void)addImageViewTapGesture:(UIImageView *)imageView index:(NSInteger)index handle:(TapGestureHandle)handle;

/// 给view添加通用的手势
+ (void)addNormalTapGesture:(UIView *)view target:(id)target action:(SEL)selection;

/// 根据传入的NibName和frame获取view
+ (UIView *)getNibViewByNibName:(NSString *)nibName frame:(CGRect)frame;

/// 给textfield添加监听
+ (void)addMonitorForTextField:(UITextField *)textField fieldChangeHandle:(FieldChangeHandle)fieldChangeHandle;

/// 彩色图片转换为黑白图片
+ (UIImage*)grayImage:(UIImage*)sourceImage;

/// 修改图片颜色
+ (void)resetImageViewTintColorWithImageView:(UIImageView *)imageView image:(UIImage *)image tintcolor:(UIColor *)tintcoclor;

/// 修改按钮图片颜色
+ (void)resetButtonImageViewTintColorWithImageView:(UIButton *)button image:(UIImage *)image tintcolor:(UIColor *)tintcoclor;

/// 查看大图(根据传入的图片展示)
+ (void)showDetailImageWithImage:(UIImage *)detailImage;

/// 查看大图(根据传入的url展示)
+ (void)showDetailImageWithUrl:(NSString *)imgUrl;

/// 弹出提示框
+ (void)alertWithTitle:(NSString *)titleText
               content:(NSString *)content
          cancelButton:(NSString *)cancelButtonText
          otherButtons:(NSArray*)otherButtonArray
                 style:(QMainAlertViewStyle)style
            parameters:(NSDictionary *)params
           alertHandle:(QMainAlertHandle)alertHandle;

/// 加载中
+ (void)showLoadingWithSuperView:(UIView *)superView tipsString:(NSString *)tipsString;

/// 加载失败
+ (void)showLoadFailureWithSuperView:(UIView *)superView tipsString:(NSString *)tipsString;

/// 列表为空
+ (void)showEmptyListWithSuperView:(UIView *)superView tipsString:(NSString *)tipsString;

/// 列表隐藏
+ (void)hideLoadView;

/// 获取通用的MJRefreshNormalHeader
+ (MJRefreshNormalHeader *)getMJRefreshNormalHeaderWithTarget:(id)target action:(SEL)action;

/// 获取通用的MJRefreshAutoNormalFooter
+ (MJRefreshAutoNormalFooter *)getMJRefreshAutoNormalFooterWithTarget:(id)target action:(SEL)action;

#pragma mark 几个常用的文字展示
/// TEXT_BLACK_COLOR & DETAIL_NORMAL_FONT_SIZE
+ (void)setNormalDetailTextColorLalbel:(UILabel *)label;
/// TEXT_BLACK_COLOR & DETAIL_FONT_SIZE
+ (void)setDetailTextColorLabel:(UILabel *)label;
/// TEXT_BLACK_COLOR & MINI_FONT_SIZE
+ (void)setMiniTextColorLabel:(UILabel *)label;
/// TEXT_BLACK_COLOR & TITLE_FONT_SIZE
+ (void)setTitleTextColorLabel:(UILabel *)label;
/// TEXT_BLACK_COLOR & TITLE_BIG_FONT_SIZE
+ (void)setBigTitleTextColorLabel:(UILabel *)label;

/// SUBTITLE_GRAY_COLOR & DETAIL_NORMAL_FONT_SIZE
+ (void)setNormalDetailSubtextColorLabel:(UILabel *)label;
/// SUBTITLE_GRAY_COLOR & DETAIL_FONT_SIZE
+ (void)setDetailSubtextColorLabel:(UILabel *)label;
/// SUBTITLE_GRAY_COLOR & MINI_FONT_SIZE
+ (void)setMiniSubtextColorLabel:(UILabel *)label;
/// SUBTITLE_GRAY_COLOR & TITLE_FONT_SIZE
+ (void)setTitleSubtextColorLabel:(UILabel *)label;
/// SUBTITLE_GRAY_COLOR & TITLE_BIG_FONT_SIZE
+ (void)setBigTitleSubtextColorLabel:(UILabel *)label;

//修复拍照90度旋转的问题
+ (UIImage *)fixOrientation:(UIImage *)aImage;

#pragma mark 向数据库存储数据
+ (void)readCityList;


+ (UIImage *)createBarWithUrlString:(NSString *)url;


@end
