//
//  AppDelegate.m
//  iOSBaseProject
//
//  Created by 贺方轩 on 2019/1/31.
//  Copyright © 2019 LeoThink. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark 处理推送，传入推送详情、是否在后台
- (void)disposePushWithPushInfo:(NSDictionary *)pushInfo {
    
//    if (![MDUserDefaults customerState]) {
//        //如果没登录、不做操作
//        
//        
//        return;
//    }
//    
//    MDKLog(@"%@", pushInfo);
//    
//    // 取得 APNs 标准信息内容
//    NSDictionary *aps = [pushInfo valueForKey:@"aps"];
//    NSString *messageContent = [aps valueForKey:@"alert"];//推送显示的内容
//    if ([[pushInfo allKeys] containsObject:@"type"]) {
//        
//        NSInteger messageType = [[pushInfo valueForKey:@"type"] integerValue];
//        NSString *messageTitle;
//        if (messageType == 1) {
//            //任务通知
//            messageTitle = @"任务通知";
//        } else if (messageType == 2) {
//            //订单通知
//            messageTitle = @"订单通知";
//        } else if (messageType == 3) {
//            //系统通知
//            messageTitle = @"系统通知";
//            
//#ifdef Owner
//            if ([self.currentVc isKindOfClass:[OwnerIssueViewController class]]) {
//                //如果在当前页面，刷新未读消息量
//                [(OwnerIssueViewController *)self.currentVc getUnreadMessageNumber];
//            }
//#else
//            if ([self.currentVc isKindOfClass:[DriverIssueViewController class]]) {
//                //如果在当前页面，刷新未读消息量
//                [(DriverIssueViewController *)self.currentVc getUnreadMessageNumber];
//            }
//#endif
//            
//        } else if (messageType == 4) {
//            //评价
//            messageTitle = @"评价";
//        }
//        
//        [MDMethod alertWithTitle:messageTitle content:messageContent cancelButton:@"取消" otherButtons:@[@"前往查看"] style:QMainAlertViewStyleNotice parameters:nil alertHandle:^(NSInteger selectIndex) {
//            
//            if (selectIndex == 1) {
//                
//                if (messageType == 1 || messageType == 2) {
//                    //任务(1)、订单通知(2)
//#ifdef Owner
//                    OwnerIssueDetailViewController *issueDetailVc = [[OwnerIssueDetailViewController alloc] init];
//                    issueDetailVc.hidesBottomBarWhenPushed = YES;
//                    if (messageType == 1) {
//                        //任务
//                        issueDetailVc.detailType = Owner_Issue_Detail_Type_Issue;
//                        issueDetailVc.issueId = pushInfo[@"to_id"];
//                    } else {
//                        //订单
//                        issueDetailVc.detailType = Owner_Issue_Detail_Type_Order;
//                        issueDetailVc.orderId = pushInfo[@"to_id"];
//                    }
//                    [self.currentVc.navigationController pushViewController:issueDetailVc animated:YES];
//#else
//                    DriverIssueDetailViewController *issueDetailVc = [[DriverIssueDetailViewController alloc] init];
//                    issueDetailVc.hidesBottomBarWhenPushed = YES;
//                    if (messageType == 1) {
//                        //任务
//                        issueDetailVc.detailType = Driver_Issue_Detail_Type_Issue;
//                        issueDetailVc.issueId = pushInfo[@"to_id"];
//                    } else {
//                        //订单
//                        issueDetailVc.detailType = Driver_Issue_Detail_Type_Order;
//                        issueDetailVc.orderId = pushInfo[@"to_id"];
//                    }
//                    [self.currentVc.navigationController pushViewController:issueDetailVc animated:YES];
//#endif
//                } else if (messageType == 3) {
//                    //系统通知
//                    if ([self.currentVc isKindOfClass:[CommonNewsViewController class]]) {
//                        //如果在当前页面，刷新
//                        [(CommonNewsViewController *)self.currentVc refreshSystemNews];
//                    } else {
//                        //否则，跳转
//                        CommonNewsViewController *newsVc = [[CommonNewsViewController alloc] init];
//                        if (self.currentVc.navigationController.viewControllers.count == 1) {
//                            newsVc.hidesBottomBarWhenPushed = YES;
//                        }
//                        [self.currentVc.navigationController pushViewController:newsVc animated:YES];
//                    }
//                    
//                } else if (messageType == 4) {
//                    //评价
//                    if ([self.currentVc isKindOfClass:[OwnerCommentListViewController class]]) {
//                        //如果在当前页面，刷新
//                        [(OwnerCommentListViewController *)self.currentVc refreshCommentList];
//                    } else {
//                        //否则，跳转
//                        OwnerCommentListViewController *commentVc = [[OwnerCommentListViewController alloc] init];
//                        if (self.currentVc.navigationController.viewControllers.count == 1) {
//                            commentVc.hidesBottomBarWhenPushed = YES;
//                        }
//                        commentVc.acceptCommentState = YES;
//                        [self.currentVc.navigationController pushViewController:commentVc animated:YES];
//                    }
//                } else {
//                    
//                }
//            }
//        }];
//        
//    } else {
//        
//        
//    }
}

@end
