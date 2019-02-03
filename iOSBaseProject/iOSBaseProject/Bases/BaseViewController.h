//
//  BaseViewController.h
//  QA
//
//  Created by Yoga on 2017/4/19.
//  Copyright © 2017年 ZDQK. All rights reserved.
//

typedef void(^AlertActionClick)(NSString *actionTitle);

#import <UIKit/UIKit.h>
//#import "IDMPhotoBrowser.h"

@interface BaseViewController : UIViewController{
    CGRect _keyboardBenginFrame;
    CGRect _keyboardEndFrame;
    NSTimeInterval _keyboardAnimationDuration;
    
}

@property (nonatomic, strong) UIAlertController *alertC;
@property (nonatomic, copy) AlertActionClick alertBlock;

- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
- (void)keyboardDidShow:(NSNotification *)notification;

/**
 *  设置navBar全透明
 */
- (void)setNavigationBarAlpha:(CGFloat)alpha animation:(BOOL)animation;

/**
 设置statusBar样式

 @param style 样式
 @param animated 是否有动画
 */
- (void)setStatusBarStyle:(UIStatusBarStyle)style animated:(BOOL)animated;

/**
 *  返回上级页面
 */
- (void)disMissSelf;

/**
 返回到首页
 */
- (void)popToRootViewController;

/**
 登录后返回首页
 */
- (void)popToRoot;

/**
 *  显示alert 参数message
 */
- (void)showAlertMessage:(NSString *)message;

/**
 自定义type的alert

 @param buttonTitleArray 按钮标题数组
 @param title 提示title
 @param message 提示message
 @param alertStyle 样式(alert/sheet)
 */
- (void)showAlertWithTitleArray:(NSArray *)buttonTitleArray title:(NSString *)title message:(NSString *)message alertStyle:(UIAlertControllerStyle)alertStyle;

/**
 带textField的Alert

 @param buttonTitleArray 按钮标题数组
 @param title 提示框title
 */
- (void)showAlertTextFieldWithTitleArray:(NSArray *)buttonTitleArray title:(NSString *)title;

/**
 点击图片原位置放大
 
 @param imageView 点击的imageView
 @param index 点击的imageView的image在数组中的index
 @param urls 图片数组
 */
- (void)showPicture:(UIImageView *)imageView index:(NSInteger)index urls:(NSArray *)urls;

- (void)showLocalPicture:(UIImageView *)imageView index:(NSInteger)index ;
@end
