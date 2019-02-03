//
//  CommonTypeSelectModel.h
//  Chrysanthemum
//
//  Created by mengdong on 2018/11/28.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import "QMainBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommonTypeSelectModel : QMainBaseModel

@property (nonatomic, assign) NSInteger typeId;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) BOOL select;

@end

NS_ASSUME_NONNULL_END
