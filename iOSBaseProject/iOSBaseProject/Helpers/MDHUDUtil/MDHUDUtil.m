//
//  MDHUDUtil.m
//  Unicorn_Aged
//
//  Created by Leo on 2018/7/26.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "MDHUDUtil.h"
#import "MBProgressHUD.h"

@interface MDHUDUtil ()
@property (nonatomic, strong) MBProgressHUD *hud;
@end
@implementation MDHUDUtil

+ (void)load {
    [self sharedDWHUBUtil];
}

static MDHUDUtil *hudUtil = nil;
+ (instancetype)sharedDWHUBUtil {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hudUtil = [[MDHUDUtil alloc] init];
        hudUtil.hud = [[MBProgressHUD alloc] init];
        hudUtil.hud.removeFromSuperViewOnHide = YES;
    });
    return hudUtil;
}

+ (void)showCircleOnView:(UIView *)view offset:(BOOL)offset {
    [hudUtil.hud hide:NO];
    hudUtil.hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hudUtil.hud.offset = offset;
    hudUtil.hud.removeFromSuperViewOnHide = YES;
    hudUtil.hud.dimBackground = YES;
}

+ (void)showCircleOnWindow {
    [hudUtil.hud hide:NO];
    hudUtil.hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window] animated:YES];
    hudUtil.hud.removeFromSuperViewOnHide = YES;
    hudUtil.hud.dimBackground = YES;
}

+ (void)showText:(NSString *)text offset:(BOOL)offset {
    [hudUtil.hud hide:NO];
    hudUtil.hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window] animated:YES];
    hudUtil.hud.offset = offset;
    hudUtil.hud.mode = MBProgressHUDModeText;
    hudUtil.hud.removeFromSuperViewOnHide = YES;
    hudUtil.hud.dimBackground = YES;
    hudUtil.hud.labelText = text;
    [hudUtil.hud hide:YES afterDelay:MDHUDDuration];
}

+ (void)showTextNoHidden:(NSString *)text offset:(BOOL)offset {
    [hudUtil.hud hide:NO];
    hudUtil.hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window] animated:YES];
    hudUtil.hud.offset = offset;
    hudUtil.hud.mode = MBProgressHUDModeText;
    hudUtil.hud.removeFromSuperViewOnHide = YES;
    hudUtil.hud.dimBackground = YES;
    hudUtil.hud.labelText = text;
}

+ (void)showText:(NSString *)text detailText:(NSString *)detailText offset:(BOOL)offset {
    [hudUtil.hud hide:NO];
    hudUtil.hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window] animated:YES];
    hudUtil.hud.offset = offset;
    hudUtil.hud.mode = MBProgressHUDModeText;
    hudUtil.hud.labelText = text;
    hudUtil.hud.detailsLabelText = detailText;
    hudUtil.hud.removeFromSuperViewOnHide = YES;
    hudUtil.hud.dimBackground = YES;
    [hudUtil.hud hide:YES afterDelay:MDHUDDuration];
}

+ (void)hidden:(BOOL)animation {
    [hudUtil.hud hide:animation];
}


@end
