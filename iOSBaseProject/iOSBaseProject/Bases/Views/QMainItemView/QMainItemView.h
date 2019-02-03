//
//  QMainItemView.h
//  Chrysanthemum
//
//  Created by mengdong on 2018/12/8.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^QMainItemHandle)(void);

@interface QMainItemView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

@property (nonatomic, copy) QMainItemHandle itemHandle;

@end

NS_ASSUME_NONNULL_END
