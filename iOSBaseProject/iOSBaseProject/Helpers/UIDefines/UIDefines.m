//
//  UIDefines.m
//  ios_base
//
//  Created by wht on 2018/5/11.
//  Copyright © 2018年 wht. All rights reserved.
//

#import "UIDefines.h"

@implementation UIDefines

@end

@implementation UILabel (CustomLabel)

+ (UILabel *)labelWithFrame:(CGRect)aFrame
                   fontSize:(CGFloat)fontSize
              textAlignment:(NSTextAlignment)aTextAlignment
                  textColor:(UIColor *)aTextColor
                       text:(NSString *)aText
{
    UILabel * label = [[UILabel alloc] initWithFrame:aFrame];
    label.text = aText;
    label.textColor = aTextColor;
    label.textAlignment = aTextAlignment;
    label.font = [UIFont systemFontOfSize:fontSize];
    //    CGPoint point = label.center;
    //    int center_x = floor(point.x);
    //    int center_y = floor(point.y);
    //    label.center = CGPointMake(center_x + 0.3, center_y + 0.3);
    return label;
}

@end

@implementation UIButton (CustomButton)

+(UIButton *)buttonWithFrame:(CGRect)frame
             normalImageName:(NSString *)normalImageName
             selectImageName:(NSString *)selectImageName
                      target:(id)target
                      action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


+(UIButton *)buttonWithFrame:(CGRect)frame
             backGroundColor:(UIColor *)backGroundColor
                  titleColor:(UIColor *)titleColor
                        font:(CGFloat)font
                      target:(id)target
                      action:(SEL)action
                       title:(NSString *)title{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.backgroundColor = backGroundColor;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
//    btn.layer.cornerRadius = 5;
    return btn;
}

+ (UIButton *)buttonWithFrame:(CGRect)aFrame
                  normalImage:(UIImage *)aNormalImage
                       target:(id)aTarget
                       action:(SEL)aAction
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = aFrame;
    [btn setImage:aNormalImage forState:UIControlStateNormal];
    [btn addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

//页面返回按钮
+ (UIButton *)backButtonWithTarget:(id)target
                            action:(SEL)action
                       imageString:(NSString *)imageString{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[[UIImage imageNamed:imageString] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    return btn;
}

@end

@implementation UITextField (CustomTextField)


+ (UITextField *)textFieldWithFrame:(CGRect)aFrame
                    backGroundColor:(UIColor *)aColor
                       keyBoardType:(UIKeyboardType)aKeyBoardType
                        placeHolder:(NSString *)aPlaceHolder{
    UITextField *tf = [[UITextField alloc] initWithFrame:aFrame];
    tf.placeholder = aPlaceHolder;
    tf.keyboardType = aKeyBoardType;
    tf.backgroundColor = aColor;
    tf.layer.cornerRadius = 5;
    tf.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, tf.frame.size.height)];
    tf.leftViewMode = UITextFieldViewModeAlways;
    tf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    if (aPlaceHolder != nil) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        NSAttributedString *attri = [[NSAttributedString alloc] initWithString:aPlaceHolder attributes:@{NSParagraphStyleAttributeName:style}];
        tf.attributedPlaceholder = attri;
    }
    return tf;
}

@end


@implementation UIImageView (CustomImageView)

+ (UIImageView *)imageViewWithFrame:(CGRect)aFrame
                          imageName:(NSString *)aImageName
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:aFrame];
    if (![Helper isNull:aImageName]) {
        imageView.image = [UIImage imageNamed:aImageName];
    }
    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.contentMode = UIViewContentModeCenter;
    
    imageView.clipsToBounds = YES;
    imageView.userInteractionEnabled = YES;
    return imageView;
}

@end

