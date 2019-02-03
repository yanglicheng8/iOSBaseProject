//
//  QMainBaseViewController.m
//  Unicorn_Aged
//
//  Created by Leo on 2018/7/24.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainBaseViewController.h"
#import "AppDelegate.h"
#import "TitleView.h"
#import "WRNavigationBar.h"
#import "WRCustomNavigationBar.h"
//#import "NewCommonCertificationViewController.h"
//#import "YLCDriverCertificationViewController.h"

@interface QMainBaseViewController () {
    BOOL _keyboardNotification;
    CGFloat _keyboardHeight;
    CGFloat _keyboardWidth;
}

@property (nonatomic, copy) QMainKeyboardShowHandle showHandle;
@property (nonatomic, copy) QMainKeyboardDismissHandle dismissHandle;

@end

@implementation QMainBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BACKGROUND_COLOR;
    
    [self wr_setNavBarTintColor:[UIColor whiteColor]];
    [self wr_setNavBarTitleColor:[UIColor whiteColor]];
    [self wr_setNavBarShadowImageHidden:YES];
    [self wr_setStatusBarStyle:UIStatusBarStyleDefault];
    [self wr_setNavBarBarTintColor:THEME_COLOR];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    AppDelegate *appDe = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDe.currentVc = self;
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //    [SVProgressHUD dismiss];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
   
}


#pragma mark ---------- 方法     ----------
// 设置左上角按钮 - 返回图片
- (void)setNormalLeftIconButton {
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"common_back_white"] style:UIBarButtonItemStyleDone target:self action:@selector(popViewController)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

- (void)popViewController {
    
    [self.navigationController popViewControllerAnimated:YES];
}

// 设置左上角按钮 - 定制按钮图片
- (void)setCustomLeftIconButton:(NSString *)icon action:(nullable SEL)action {
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:icon] style:UIBarButtonItemStyleDone target:self action:action];
    self.navigationItem.leftBarButtonItem = leftBarItem;
}

// 设置左上角按钮 - 自定义文字
- (void)setCustomLeftTitleButton:(NSString *)title action:(nullable SEL)action {
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    
    self.navigationItem.leftBarButtonItem = leftBarItem;
}

// 设置左上角按钮 - 自定义view
- (void)setCustomLeftBarView:(UIView *)barView size:(CGSize)barSize action:(nullable SEL)action {
    
    UIButton *barButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    barButton.frame = CGRectMake(0, 0, barSize.width, barSize.height);
    [barButton addSubview:barView];
    barView.userInteractionEnabled = NO;
    [barButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    leftBarItem.width = barSize.width;
    
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
}

// 设置右上角按钮 - 定制按钮图片
- (void)setCustomRightIconButton:(NSString *)icon action:(nullable SEL)action {
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:icon] style:UIBarButtonItemStyleDone target:self action:action];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

// 设置右上角按钮 - 自定义文字
- (void)setCustomRightTitleButton:(NSString *)title action:(nullable SEL)action {
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

// 设置右上角按钮 - 自定义view
- (void)setCustomRightBarView:(UIView *)barView size:(CGSize)barSize action:(nullable SEL)action {
    
    UIButton *barButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    barButton.frame = CGRectMake(0, 0, barSize.width, barSize.height);
    [barButton addSubview:barView];
    barView.userInteractionEnabled = NO;
    [barButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    rightBarItem.width = barSize.width;
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}

/// 设置title - 自定义view
- (void)setCustomTitleView:(UIView *)titleView size:(CGSize)barSize action:(nullable SEL)action {
    
    TitleView *barTitleView = [[TitleView alloc] initWithFrame:CGRectMake(0, 0, barSize.width, barSize.width)];
    
    UIButton *barButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    barButton.frame = barTitleView.bounds;
    
    [barButton addSubview:titleView];
    
    [barButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [barTitleView addSubview:barButton];
    
    self.navigationItem.titleView = barTitleView;
}

// 返回指定页面
- (void)popToAssignViewController:(NSString *)assignViewController {
    
    Class assignClass = NSClassFromString(assignViewController);
    
    BOOL isContain = NO;
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:assignClass]) {
            [self.navigationController popToViewController:controller animated:YES];
            
            isContain = YES;
        }
    }
    
    if (!isContain) {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

/// 增加键盘监听
- (void)addKeyBoardNotification:(QMainKeyboardShowHandle)show dismiss:(QMainKeyboardDismissHandle)dismiss {
    
    _keyboardNotification = YES;
    self.showHandle = show;
    self.dismissHandle = dismiss;
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)keyboardWillShow:(NSNotification *)aNotification {
    //获取键盘的高度
    
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    _keyboardHeight = keyboardRect.size.height;
    _keyboardWidth = keyboardRect.size.width;
    
    self.showHandle(_keyboardHeight, _keyboardWidth);
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification {
    
    self.dismissHandle(_keyboardHeight, _keyboardWidth);
}

/// 移除键盘监听
- (void)removeKeyBoardNotification {
    
    if (_keyboardNotification) {
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    }
}

/// 给view添加一个点击事件 - 点击收起键盘
- (void)addDismissKeyboardTapGesture:(UIView *)view {
    
    [MDMethod addNormalTapGesture:view target:self action:@selector(dismissKeyboard)];
}
//
////实名认证判断
//- (void)goCertification{
//    if (![[MDUserDefaults is_check] isEqualToString:@"1"]) {
//        NewCommonCertificationViewController *cerVc = [[NewCommonCertificationViewController alloc] init];
//        cerVc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:cerVc animated:YES];
//    }else{
//        YLCDriverCertificationViewController *vc = [[YLCDriverCertificationViewController alloc] init];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//}
//// 0 待审核  -1 审核不通过 -100:未提交资料 2: 缺少会员费用
//- (void)alertIsGoCertification{
//    if ([[MDUserDefaults is_check] isEqualToString:@"-1"]) {
//        [MDMethod alertWithTitle:@"提示" content:@"您的认证未审核通过，是否前往重新提交审核？" cancelButton:@"取消" otherButtons:@[@"前往"] style:QMainAlertViewStyleNotice parameters:nil alertHandle:^(NSInteger selectIndex) {
//            if (selectIndex == 1) {
//                #ifdef Driver
//                YLCDriverCertificationViewController *vc = [[YLCDriverCertificationViewController alloc] init];
//                vc.hidesBottomBarWhenPushed = YES;
//                [self.navigationController pushViewController:vc animated:YES];
//                #endif
//            }
//        }];
//    }else if ([[MDUserDefaults is_check] isEqualToString:@"-100"]){
//        [MDMethod alertWithTitle:@"提示" content:@"您还没有认证，是否前往认证？" cancelButton:@"取消" otherButtons:@[@"前往"] style:QMainAlertViewStyleNotice parameters:nil alertHandle:^(NSInteger selectIndex) {
//            if (selectIndex == 1) {
//                [self goCertification];
//            }
//        }];
//    }else if ([[MDUserDefaults is_check] isEqualToString:@"0"]){
//        [MDMethod alertWithTitle:@"提示" content:@"您的认证还在审核中，请耐心等候~~" cancelButton:@"确定" otherButtons:nil style:QMainAlertViewStyleNotice parameters:nil alertHandle:^(NSInteger selectIndex) {
//        }];
//    }else if ([[MDUserDefaults is_check] isEqualToString:@"2"]){
//        [MDMethod alertWithTitle:@"提示" content:@"您还没有缴纳会员费用，是否前往缴纳？" cancelButton:@"确定" otherButtons:nil style:QMainAlertViewStyleNotice parameters:nil alertHandle:^(NSInteger selectIndex) {
//        }];
//    }else{
//#ifdef Driver
//        if ([[MDUserDefaults is_driver] isEqualToString:@"-1"]) {
//            [MDMethod alertWithTitle:@"提示" content:@"您的驾驶证认证未审核通过，是否前往重新提交审核？" cancelButton:@"取消" otherButtons:@[@"前往"] style:QMainAlertViewStyleNotice parameters:nil alertHandle:^(NSInteger selectIndex) {
//                if (selectIndex == 1) {
//                    YLCDriverCertificationViewController *vc = [[YLCDriverCertificationViewController alloc] init];
//                    vc.hidesBottomBarWhenPushed = YES;
//                    [self.navigationController pushViewController:vc animated:YES];
//                }
//            }];
//        }else if ([[MDUserDefaults is_driver] isEqualToString:@"-100"]){
//            [MDMethod alertWithTitle:@"提示" content:@"您的驾驶证还没有认证，是否前往认证？" cancelButton:@"取消" otherButtons:@[@"前往"] style:QMainAlertViewStyleNotice parameters:nil alertHandle:^(NSInteger selectIndex) {
//                if (selectIndex == 1) {
//                    YLCDriverCertificationViewController *vc = [[YLCDriverCertificationViewController alloc] init];
//                    vc.hidesBottomBarWhenPushed = YES;
//                    [self.navigationController pushViewController:vc animated:YES];
//                }
//            }];
//        }else if ([[MDUserDefaults is_driver] isEqualToString:@"0"]){
//            [MDMethod alertWithTitle:@"提示" content:@"您的驾驶证认证还在审核中，请耐心等候~~" cancelButton:@"确定" otherButtons:nil style:QMainAlertViewStyleNotice parameters:nil alertHandle:^(NSInteger selectIndex) {
//            }];
//        }else if ([[MDUserDefaults is_driver] isEqualToString:@"2"]){
//            [MDMethod alertWithTitle:@"提示" content:[NSString stringWithFormat:@"您的驾驶证因%@未能通过认证,请前往个人中心联系客服", [MDUserDefaults is_driver_msg]] cancelButton:@"确定" otherButtons:nil style:QMainAlertViewStyleNotice parameters:nil alertHandle:^(NSInteger selectIndex) {
//            }];
//        }
//#endif
//    }
//}


#pragma mark ---------- 代理协议    ----------

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissKeyboard];
}

#pragma mark ---------- method ----------
- (void)dismissKeyboard {
    
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [self removeKeyBoardNotification];
}

@end
