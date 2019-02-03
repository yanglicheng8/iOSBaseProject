//
//  UIButton+MDCategory.h
//  Chrysanthemum
//
//  Created by mengdong on 2018/12/27.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (MDCategory)

//按钮右上角添加一个数字
- (void)showTaskNumber:(NSString *)taskNumber;

//隐藏右上角按钮
- (void)hideTaskNumber;

//按钮右上角是否显示一个点（传入点的颜色）
- (void)showButtonMark:(BOOL)markShow color:(UIColor *)markColor;

@end

NS_ASSUME_NONNULL_END
