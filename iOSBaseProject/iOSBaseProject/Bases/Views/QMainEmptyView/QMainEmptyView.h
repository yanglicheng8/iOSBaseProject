//
//  QMainEmptyView.h
//  Chrysanthemum
//
//  Created by zl1 on 2018/11/21.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, Q_Main_Empty_Type) {
    
    Q_Main_Empty_Type_Car,                  //车辆管理
    Q_Main_Empty_Type_Order,                //订单管理
    Q_Main_Empty_Type_Comment,              //评价
    Q_Main_Empty_Type_Driver_Issue,         //任务大厅
};

typedef void(^OwnerEmptyHandle)(void);

@interface QMainEmptyView : UIView

@property (nonatomic, assign) Q_Main_Empty_Type type;

@property (nonatomic, copy) OwnerEmptyHandle emptyHandle;

@end

NS_ASSUME_NONNULL_END
