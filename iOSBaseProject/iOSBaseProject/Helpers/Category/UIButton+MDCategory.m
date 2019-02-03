//
//  UIButton+MDCategory.m
//  Chrysanthemum
//
//  Created by mengdong on 2018/12/27.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import "UIButton+MDCategory.h"

@interface UIButton()

@property (nonatomic, strong) UILabel *taskNumberLabel;

@property (nonatomic, strong) UIView *markView;

@end

@implementation UIButton (MDCategory)
static NSString *taskNumberLabelKey = @"taskNumberLabelKey"; //name的key
static NSString *markViewKey = @"markViewKey"; //name的key

//按钮右上角添加一个数字
- (void)showTaskNumber:(NSString *)taskNumber {

    if (self.taskNumberLabel == nil) {
        
        self.taskNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.mdk_maxX + 2., 5., 17.5, 17.5)];
        self.taskNumberLabel.backgroundColor = THEME_COLOR;
        self.taskNumberLabel.layer.masksToBounds = YES;
        self.taskNumberLabel.layer.cornerRadius = 17.5/2;
        self.taskNumberLabel.textColor = MDKWhiteColor;
        self.taskNumberLabel.font = [UIFont systemFontOfSize:8];
        self.taskNumberLabel.adjustsFontSizeToFitWidth = YES;
        self.taskNumberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.taskNumberLabel];
    }
    
    self.taskNumberLabel.text = taskNumber;
    self.taskNumberLabel.hidden = NO;
}

//隐藏右上角按钮
- (void)hideTaskNumber {
    
    if (self.taskNumberLabel == nil) {
        
        self.taskNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.mdk_maxX + 2., 5., 17.5, 17.5)];
        self.taskNumberLabel.backgroundColor = THEME_COLOR;
        self.taskNumberLabel.layer.masksToBounds = YES;
        self.taskNumberLabel.layer.cornerRadius = 17.5/2;
        self.taskNumberLabel.textColor = MDKWhiteColor;
        self.taskNumberLabel.font = [UIFont systemFontOfSize:8];
        self.taskNumberLabel.adjustsFontSizeToFitWidth = YES;
        self.taskNumberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.taskNumberLabel];
    }
    self.taskNumberLabel.hidden = YES;
}

//按钮右上角是否显示一个点（传入点的颜色）
- (void)showButtonMark:(BOOL)markShow color:(UIColor *)markColor {
    
    if (markShow) {
        
        if (self.markView == nil) {
            
            self.markView = [[UIView alloc] initWithFrame:CGRectMake(self.mdk_width - 1. - 7.5, 1., 7.5, 7.5)];
            self.markView.backgroundColor = markColor;
            self.markView.layer.masksToBounds = YES;
            self.markView.layer.cornerRadius = 7.5/2;
            [self addSubview:self.markView];
        }
        
        self.markView.hidden = NO;
    } else {
        
        if (self.markView == nil) {
            
            self.markView = [[UIView alloc] initWithFrame:CGRectMake(self.mdk_width - 1. - 7.5, 1., 7.5, 7.5)];
            self.markView.backgroundColor = markColor;
            self.markView.layer.masksToBounds = YES;
            self.markView.layer.cornerRadius = 7.5/2;
            [self addSubview:self.markView];
        }
        self.markView.hidden = YES;
    }
}

///taskNumberLabel setter+getter
- (void)setTaskNumberLabel:(UILabel *)taskNumberLabel {
    
    objc_setAssociatedObject(self, &taskNumberLabelKey, taskNumberLabel, OBJC_ASSOCIATION_RETAIN);
}

- (UILabel *)taskNumberLabel {
    return objc_getAssociatedObject(self, &taskNumberLabelKey);
}

///markView setter+getter
- (void)setMarkView:(UIView *)markView {
    
    objc_setAssociatedObject(self, &markViewKey, markView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)markView {
    return objc_getAssociatedObject(self, &markViewKey);
}


@end
