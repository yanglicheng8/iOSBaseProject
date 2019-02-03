//
//  MainTabbarController.m
//  lygcwz
//
//  Created by lyscds2017 on 2017/11/16.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

#import "MainTabbarController.h"
#import "CustomNavController.h"
//#import "HomeController.h"
//#import "MessageViewController.h"
//#import "MineController.h"
//#import "VideoListViewController.h"
//#import "WHTSelectCategoryVC.h"
#import "BaseViewController.h"

@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setValue:[CustomTabBar new] forKey:@"tabBar"];
    
    BaseViewController *hvc = [[BaseViewController alloc] init];
    [self addChildController:hvc title:@"首页" imageName:@"home_unselect@2x.png" selectedImageName:@"home_select@2x.png" navVc:[CustomNavController class]];
    
//    MessageViewController *infoVC = [[MessageViewController alloc] init];
//    [self addChildController:infoVC title:@"供应" imageName:@"message_unselect@2x.png" selectedImageName:@"message_select@2x.png" navVc:[CustomNavController class]];
////
//    VideoListViewController *videoVC = [[VideoListViewController alloc] init];
//    [self addChildController:videoVC title:@"视频" imageName:@"tabbar_video@2x.png" selectedImageName:@"tabbar_video_select@2x.png" navVc:[CustomNavController class]];
//
//    MineController *svc = [[MineController alloc] init];
//    [self addChildController:svc title:@"我的" imageName:@"mine_unselect@2x.png" selectedImageName:@"mine_select@2x.png" navVc:[CustomNavController class]];
}

- (void)addChildController:(UIViewController*)childController title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName navVc:(Class)navVc{
    childController.title = title;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];    
    [childController.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : THEME_COLOR}forState:UIControlStateSelected];
    CustomNavController* nav = [[navVc alloc] initWithRootViewController:childController];
    nav.navigationBar.translucent = NO;
    [self addChildViewController:nav];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
   
}

@end
