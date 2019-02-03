//
//  QMainTabBarViewController.m
//  Unicorn_Aged
//
//  Created by Leo on 2018/7/24.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainTabBarViewController.h"
//#import "QMainTabBarPresenter.h"
#import "AppDelegate.h"

@interface QMainTabBarViewController ()

@end

@implementation QMainTabBarViewController
//@synthesize presenter;

- (void)doInit {
//    self.presenter = [[QMainTabBarPresenter alloc] init];
    [self init_controllers];
    [self addObserver];
}

- (void)init_controllers {

    self.viewControllers = [self.presenter supplyVCs];
    
}

- (void)makeUI {
    
    self.tabBar.backgroundColor = BACKGROUND_COLOR;
    self.tabBar.tintColor = THEME_COLOR;
    self.tabBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self doInit];
    [self makeUI];
    [self addObserver];
}

#pragma mark ---------- 通知中心    ----------
- (void)addObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(depositePushWithNotification:) name:@"pushNotification" object:nil];
}

#pragma mark ---------- 代理&协议    ----------
#pragma mark - UITabBarDelegate -
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [self.presenter clickVCWithTab:self.tabBarController.selectedIndex];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    
}

#pragma mark ---------- method    ----------

//点击推送，弹框
- (void)depositePushWithNotification:(NSNotification *)notification {
    
    NSDictionary *pushInfo = [notification object];
    if (!MDKDictIsEmpty(pushInfo)) {
        
        [(AppDelegate *)[UIApplication sharedApplication].delegate disposePushWithPushInfo:pushInfo];
    }
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@synthesize presenter;

@end
