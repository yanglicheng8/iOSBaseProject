//
//  QMainSortSelectModel.h
//  QMainProject
//
//  Created by Leo on 2018/9/10.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainBaseModel.h"

typedef NS_ENUM(NSInteger, QMainSortSelectType) {
    
    QMainSortSelectType_Normal = 1,         // 状态 - 默认状态
    QMainSortSelectType_Asc,                // 状态 - 升序
    QMainSortSelectType_Desc,               // 状态 - 降序
};

@interface QMainSortSelectModel : QMainBaseModel

//id
@property (nonatomic, copy) NSString *sortId;
// 状态是否可变
@property (nonatomic, assign) BOOL sortVariable;
// 状态
@property (nonatomic, assign) QMainSortSelectType sortType;
// 文字
@property (nonatomic, copy) NSString *sortStr;

//是否显示未读数量
@property (nonatomic, assign) BOOL showTaskNumber;

//新增 - 未读数量
@property (nonatomic, copy) NSString *taskNumber;

@end
