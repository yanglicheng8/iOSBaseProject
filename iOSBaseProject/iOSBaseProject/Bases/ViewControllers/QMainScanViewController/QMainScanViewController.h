//
//  QMainScanViewController.h
//  duoduoshangcheng
//
//  Created by Leo on 2018/9/7.
//  Copyright © 2018年 cuixiaocun. All rights reserved.
//

#import "QMainBaseViewController.h"

typedef void(^QMainScanSuccessHandle)(NSString *stringValue);
typedef void(^QMainScanFailureHandle)(void);

@interface QMainScanViewController : QMainBaseViewController

//title
@property (nonatomic, copy) NSString *titleStr;

//提示文字
@property (nonatomic, copy) NSString *tipsStr;

//成功
@property (nonatomic, copy) QMainScanSuccessHandle successHandle;

//失败
@property (nonatomic, copy) QMainScanFailureHandle failureHandle;

@end
