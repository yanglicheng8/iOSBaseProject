//
//  QMainLoadView.h
//  Unicorn_Aged
//
//  Created by Leo on 2018/7/31.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QMainLoadView : UIView

/// loading
- (void)loading:(NSString *)tipsString;

/// 加载失败
- (void)loadFail:(NSString *)tipsString;

/// 列表为空
- (void)loadEmptList:(NSString *)tipsString;

@end
