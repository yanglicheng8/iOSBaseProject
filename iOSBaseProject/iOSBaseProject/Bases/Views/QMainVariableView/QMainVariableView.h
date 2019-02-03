//
//  QMainVariableView.h
//  Chrysanthemum
//
//  Created by zl1 on 2018/11/26.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^WidgetHandle)(CGFloat widgetHeight);

typedef void(^WidgetSelectHandle)(NSString *selectStr);

@interface QMainVariableView : UIView


/**
 *  获取自定义控件 - 根据传入的数组，动态赋予位置信息
 *
 *  @param widgetHeight         单个控件的高度
 *  @param widgetInsert         每两行控件的间隔
 *  @param widgetRowInsert      同一行的两个控件直接的间隔
 *  @param widgetMaxWidth       最大宽度
 *  @param widgetFont           控件文字大小
 *  @param widgets              输入的数组
 *  @param widgetHandle         返回控件height+frame数组
 *  @param widgetSelectHandle   点击返回
 */
- (void)getWidgetSizeWithWidgetHeight:(CGFloat)widgetHeight widgetInsert:(CGFloat)widgetInsert widgetRowInsert:(CGFloat)widgetRowInsert widgetMaxWidth:(CGFloat)widgetMaxWidth widgetFont:(CGFloat)widgetFont widgets:(NSArray *)widgets widgetHandle:(WidgetHandle)widgetHandle widgetSelectHandle:(WidgetSelectHandle)widgetSelectHandle;

@end

NS_ASSUME_NONNULL_END
