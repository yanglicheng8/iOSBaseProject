//
//  BaseViewController.m
//  QA
//
//  Created by Yoga on 2017/4/19.
//  Copyright © 2017年 ZDQK. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UITextFieldDelegate>

@end

@implementation BaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
}

#pragma mark - method

- (void)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    _keyboardAnimationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    _keyboardBenginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    _keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
}
- (void)keyboardDidShow:(NSNotification *)notification {
    _keyboardAnimationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    _keyboardBenginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    _keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
}
- (void)keyboardWillHide:(NSNotification *)notification {
    _keyboardAnimationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    _keyboardBenginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    _keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"left_back"] style:UIBarButtonItemStylePlain target:self action:@selector(disMissSelf)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setNavigationBarAlpha:(CGFloat)alpha animation:(BOOL)animation {
    if (animation) {
        [UIView animateWithDuration:0.2 animations:^{
            self.navigationController.navigationBar.subviews[0].alpha = alpha;
        }];
    } else {
        self.navigationController.navigationBar.subviews[0].alpha = alpha;
    }
}
- (void)setStatusBarStyle:(UIStatusBarStyle)style animated:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarStyle:style animated:animated];
}
- (void)disMissSelf {
    if(self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)popToRootViewController {
    if (self.navigationController) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)popToRoot {
    [self dismissViewControllerAnimated:NO completion:nil];
//    if ([self.presentingViewController isKindOfClass:[MineHomeViewController class]]) {
//        [self.presentingViewController viewWillAppear:NO];
//        return;
//    }
//    else if ([self.presentingViewController isKindOfClass:[BaseTabbarViewController class]]) {
//        UIViewController *topVC = ((UINavigationController *)((BaseTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController).selectedViewController).topViewController;
//        [topVC.navigationController popToRootViewControllerAnimated:YES];
//        return;
//    }
//    else if (self.presentingViewController.navigationController) {
//        [self.presentingViewController.navigationController popToRootViewControllerAnimated:YES];
//        return;
//    }
//    else {
//        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//    }
}
- (void)showAlertMessage:(NSString *)message {
    self.alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.alertBlock) {
            self.alertBlock(action.title);
        }
    }];
    [_alertC addAction:action];
    [self presentViewController:_alertC animated:YES completion:nil];
}
- (void)showAlertTextFieldWithTitleArray:(NSArray *)buttonTitleArray title:(NSString *)title {
    self.alertC = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    for (NSString *str in buttonTitleArray) {
        UIAlertActionStyle style = UIAlertActionStyleDestructive;
        if ([str isEqualToString:@"取消"] || [str isEqualToString:@"拒绝"]) {
            style = UIAlertActionStyleCancel;
        }
        UIAlertAction *action = [UIAlertAction actionWithTitle:str style:style handler:^(UIAlertAction * _Nonnull action) {
            if (self.alertBlock) {
                self.alertBlock(action.title);
            }
            
        }];
        [_alertC addAction:action];
    }
    __weak typeof(self) weakSelf = self;
    [_alertC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.delegate = weakSelf;
        textField.tag = 999999;
    }];
    
    [self presentViewController:_alertC animated:YES completion:nil];
}
- (void)showAlertWithTitleArray:(NSArray *)buttonTitleArray title:(NSString *)title message:(NSString *)message alertStyle:(UIAlertControllerStyle)alertStyle{
    self.alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];
    
    for (NSString *str in buttonTitleArray) {
        UIAlertActionStyle style;
        if (alertStyle == UIAlertControllerStyleAlert) {
            style = UIAlertActionStyleDestructive;  // alert
        } else {
            style = UIAlertActionStyleDefault;      // sheet
        }
        
        if ([str isEqualToString:@"取消"] || [str isEqualToString:@"拒绝"] || [str containsString:@"否"]||[str containsString:@"知道了"]) {
            style = UIAlertActionStyleCancel;
        }
        UIAlertAction *action = [UIAlertAction actionWithTitle:str style:style handler:^(UIAlertAction * _Nonnull action) {
            if (self.alertBlock) {
                self.alertBlock(action.title);
            }
        }];
        [_alertC addAction:action];
    }
    [self presentViewController:_alertC animated:YES completion:nil];
}

- (void)showLocalPicture:(UIImageView *)imageView index:(NSInteger)index {
//    NSMutableArray *urlArr = [NSMutableArray array];
//    for (NSString *imgUrl in urls) {
//        NSURL *url = [NSURL URLWithString:imgUrl];
//        [urlArr addObject:url];
//    }
    //    IDMPhoto *photo = [IDMPhoto photoWithURL:[NSURL URLWithString:imgUrl]];
    
//    IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotoURLs:urlArr animatedFromView:imageView];
//    IDMPhoto *photo=[IDMPhoto photoWithImage:[UIImage imageNamed:@"placeHolder@2x.png"]];
//    IDMPhotoBrowser *browser=[[IDMPhotoBrowser alloc] initWithPhotos:@[photo] animatedFromView:imageView];
//    //    IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotos:@[photo] animatedFromView:self.imageView];
//    browser.displayActionButton = NO;
//    browser.displayArrowButton = NO;
//    browser.displayCounterLabel = NO;
//    browser.displayDoneButton = NO;
//    browser.doneButtonImage = [UIImage imageNamed:@"out"];
//    browser.scaleImage = imageView.image;
//    browser.dismissOnTouch = YES;
//    [browser setInitialPageIndex:index];
//    [self presentViewController:browser animated:YES completion:nil];
}

- (void)showPicture:(UIImageView *)imageView index:(NSInteger)index urls:(NSArray *)urls{
    NSMutableArray *urlArr = [NSMutableArray array];
    for (NSString *imgUrl in urls) {
        NSURL *url = [NSURL URLWithString:imgUrl];
        [urlArr addObject:url];
    }
    //    IDMPhoto *photo = [IDMPhoto photoWithURL:[NSURL URLWithString:imgUrl]];
    
//    IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotoURLs:urlArr animatedFromView:imageView];
//    //    IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotos:@[photo] animatedFromView:self.imageView];
//    browser.displayActionButton = NO;
//    browser.displayArrowButton = NO;
//    browser.displayCounterLabel = NO;
//    browser.displayDoneButton = NO;
//    browser.doneButtonImage = [UIImage imageNamed:@"out"];
//    browser.scaleImage = imageView.image;
//    browser.dismissOnTouch = YES;
//    [browser setInitialPageIndex:index];
//    [self presentViewController:browser animated:YES completion:nil];
}

#pragma mark - textFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.tag == 999999) {
        if ([string isEqualToString:@""]) {
            return YES;
        }
        if (textField.text.length >= 120) {
            return NO;
        } else {
            return YES;
        }
    }
    return YES;
}

@end
