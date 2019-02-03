//
//  UIDefines.h
//  ios_base
//
//  Created by wht on 2018/5/11.
//  Copyright © 2018年 wht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIDefines : NSObject

@end

@interface UILabel (CustomLabel)

+ (UILabel *)labelWithFrame:(CGRect)aFrame
                   fontSize:(CGFloat)fontSize
              textAlignment:(NSTextAlignment)aTextAlignment
                  textColor:(UIColor *)aTextColor
                       text:(NSString *)aText;

@end

@interface UIButton (CustomButton)

+(UIButton *)buttonWithFrame:(CGRect)frame
             normalImageName:(NSString *)normalImageName
             selectImageName:(NSString *)selectImageName
                      target:(id)target
                      action:(SEL)action;

+(UIButton *)buttonWithFrame:(CGRect)frame
             backGroundColor:(UIColor *)backGroundColor
                  titleColor:(UIColor *)titleColor
                        font:(CGFloat)font
                      target:(id)target
                      action:(SEL)action
                       title:(NSString *)title;

+ (UIButton *)buttonWithFrame:(CGRect)aFrame
                  normalImage:(UIImage *)aNormalImage
                       target:(id)aTarget
                       action:(SEL)aAction;

+ (UIButton *)backButtonWithTarget:(id)target
                            action:(SEL)action
                       imageString:(NSString *)imageString;
@end

@interface UITextField (CustomTextField)

+ (UITextField *)textFieldWithFrame:(CGRect)aFrame
                    backGroundColor:(UIColor *)aColor
                       keyBoardType:(UIKeyboardType)aKeyBoardType
                        placeHolder:(NSString *)aPlaceHolder;
@end

@interface UIImageView (CustomImageView)

+ (UIImageView *)imageViewWithFrame:(CGRect)aFrame
                          imageName:(NSString *)aImageName;

@end
