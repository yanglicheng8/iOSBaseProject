//
//  MDHUDUtil.h
//  Unicorn_Aged
//
//  Created by Leo on 2018/7/26.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDHUDUtil : NSObject

/**
 *  param: offset 指的是是否需要将hud向下偏移NavigationBar高度，通过重写HUD源码实现
 */

///在视图上显示菊花
+ (void)showCircleOnView:(UIView *)view offset:(BOOL)offset;
///在window上显示菊花
+ (void)showCircleOnWindow;
///显示文字
+ (void)showText:(NSString *)text offset:(BOOL)offset;
///显示不会隐藏的文字
+ (void)showTextNoHidden:(NSString *)text offset:(BOOL)offset;
///显示文字和描述文字
+ (void)showText:(NSString *)text detailText:(NSString *)detailText offset:(BOOL)offset;
///隐藏
+ (void)hidden:(BOOL)animation;

@end
