//
//  QMainTabBarProtocol.h
//  QMainProject
//
//  Created by Leo on 2018/8/29.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QMainTabBarPresenterProtocol.h"

@protocol QMainTabBarPresenterProtocol;
@protocol QMainTabBarProtocol <NSObject>

@property (nonatomic, strong) id<QMainTabBarPresenterProtocol> presenter;

@optional

@end
