//
//  CommonTypeSelectView.h
//  Chrysanthemum
//
//  Created by mengdong on 2018/11/28.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonTypeSelectModel.h"

static CGFloat common_type_select_base_hight = 55.;

static CGFloat common_type_select_x_insert = 10.;
static CGFloat common_type_select_y_insert = 15.;
static CGFloat common_type_select_w_h_scale = 34./80.;

typedef void(^CommonTypeSelectHandle)(CommonTypeSelectModel *selectType);

NS_ASSUME_NONNULL_BEGIN

@interface CommonTypeSelectView : UIView

@property (nonatomic, assign) BOOL couldMultiSelect;

@property (nonatomic, copy) NSString *typeTitle;

@property (nonatomic, strong) NSArray<CommonTypeSelectModel *> *typeArray;

@property (nonatomic, copy) CommonTypeSelectHandle selectHandle;

@end

NS_ASSUME_NONNULL_END
