//
//  AppDelegate.h
//  iOSBaseProject
//
//  Created by 贺方轩 on 2019/1/31.
//  Copyright © 2019 LeoThink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QMainBaseViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//当前VC
@property (nonatomic, strong) QMainBaseViewController *currentVc;

- (void)disposePushWithPushInfo:(NSDictionary *)pushInfo;

@end

