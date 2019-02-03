//
//  UIImageView+QMain.h
//  Chrysanthemum
//
//  Created by mengdong on 2018/12/13.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (QMain)

- (void)tapShowBigImageView;

- (void)tapShowPickerBrowser:(NSArray *)pickers currentItem:(NSInteger)currentItem;

@end

NS_ASSUME_NONNULL_END
