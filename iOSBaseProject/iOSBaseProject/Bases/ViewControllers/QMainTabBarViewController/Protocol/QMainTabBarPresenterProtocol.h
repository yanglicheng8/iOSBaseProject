//
//  QMainTabBarPresenterProtocol.h
//  QMainProject
//
//  Created by Leo on 2018/8/29.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QMainTabBarProtocol.h"

@protocol QMainTabBarProtocol;
@protocol QMainTabBarPresenterProtocol <NSObject>

@property (nonatomic, weak) id<QMainTabBarProtocol> viewC;

@optional

/// 提供VCs
- (NSArray *)supplyVCs;

/// 点击VC
- (void)clickVCWithTab:(NSInteger)tab;

@end
