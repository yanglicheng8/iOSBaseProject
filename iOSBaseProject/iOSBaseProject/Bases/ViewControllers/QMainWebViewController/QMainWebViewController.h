//
//  QMainWebViewController.h
//  QMainProject
//
//  Created by Leo on 2018/9/15.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainBaseViewController.h"

typedef void(^QMainWebDismissHandle)(void);

@interface QMainWebViewController : QMainBaseViewController

/// web地址
@property (nonatomic, copy) NSString *webUrl;

///是否是launch页面过来的
@property (nonatomic, assign) BOOL isLaunchSkip;

@property (nonatomic, copy) QMainWebDismissHandle dismissHandle;

@end
