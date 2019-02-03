//
//  QMainLocationModel.h
//  QMainProject
//
//  Created by Leo on 2018/9/26.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainBaseModel.h"

@interface QMainLocationModel : QMainBaseModel

//是否是当前定位位置
@property (nonatomic, assign) BOOL isLocation;
//经度
@property (nonatomic, assign) CGFloat longitude;
//纬度
@property (nonatomic, assign) CGFloat latitude;
///格式化地址
@property (nonatomic, copy) NSString *formattedAddress;
///省/直辖市
@property (nonatomic, copy) NSString *province;
///市
@property (nonatomic, copy) NSString *city;
///区
@property (nonatomic, copy) NSString *district;
///区域编码
@property (nonatomic, copy) NSString *adcode;

@end
