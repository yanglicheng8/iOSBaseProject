//
//  QMainBaseViewController.h
//  Unicorn_Aged
//
//  Created by Leo on 2018/7/24.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^QMainKeyboardShowHandle)(CGFloat keyboardHeight, CGFloat keyboardWidth);
typedef void(^QMainKeyboardDismissHandle)(CGFloat keyboardHeight, CGFloat keyboardWidth);

@interface QMainBaseViewController : UIViewController

/// 设置左上角按钮 - 默认返回图片
- (void)setNormalLeftIconButton;

/// 设置左上角按钮 - 定制按钮图片
- (void)setCustomLeftIconButton:(NSString *)icon action:(nullable SEL)action;

/// 设置左上角按钮 - 自定义文字
- (void)setCustomLeftTitleButton:(NSString *)title action:(nullable SEL)action;

/// 设置左上角按钮 - 自定义view
- (void)setCustomLeftBarView:(UIView *)barView size:(CGSize)barSize action:(nullable SEL)action;

/// 设置右上角按钮 - 定制按钮图片
- (void)setCustomRightIconButton:(NSString *)icon action:(nullable SEL)action;

/// 设置右上角按钮 - 自定义文字
- (void)setCustomRightTitleButton:(NSString *)title action:(nullable SEL)action;

// 设置右上角按钮 - 自定义view
- (void)setCustomRightBarView:(UIView *)barView size:(CGSize)barSize action:(nullable SEL)action;

/// 设置title - 自定义view
- (void)setCustomTitleView:(UIView *)titleView size:(CGSize)barSize action:(nullable SEL)action;

/// pop到指定页面
- (void)popToAssignViewController:(NSString *)assignViewController;

/// 增加键盘监听
- (void)addKeyBoardNotification:(QMainKeyboardShowHandle)show dismiss:(QMainKeyboardDismissHandle)dismiss;

/// 移除键盘监听
- (void)removeKeyBoardNotification;

/// 给view添加一个点击事件 - 点击收起键盘
- (void)addDismissKeyboardTapGesture:(UIView *)view;
//
////实名认证判断是否
//- (void)goCertification;
//
//- (void)alertIsGoCertification;


@end
