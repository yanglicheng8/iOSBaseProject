//
//  MDSecureKeyboardPresenter.m
//  QMainProject
//
//  Created by Leo on 2018/9/18.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "MDSecureKeyboardPresenter.h"

@interface MDSecureKeyboardPresenter()

@property (nonatomic, copy) NSMutableString *pwd;

@property (nonatomic, assign) NSInteger pwdLength;

@end

@implementation MDSecureKeyboardPresenter

/// 初始化
- (void)initPwd {
    
    self.pwd = [NSMutableString stringWithCapacity:0];
    self.pwdLength = 0;
}

/// 获取当前输出的密码
- (NSString *)supplyOutputPwd {
    
    return self.pwd;
}

/// 获取密码长度
- (NSInteger)supplyPwdLength {
    
    return self.pwdLength;
}

/// 添加内容
- (void)queryKeyboardNum:(MD_KEYBOARD_NUM)keyboardNum success:(void(^)(void))success failure:(void(^)(void))failure {
    
    if (self.pwdLength == 6 && keyboardNum != MD_KEYBOARD_NUM_DEL) {
        
        failure();
        return;
    }
    
    switch (keyboardNum) {
        case MD_KEYBOARD_NUM_0:
        {
            [self.pwd appendString:@"0"];
            self.pwdLength++;
            break;
        }
        case MD_KEYBOARD_NUM_1:
        {
            [self.pwd appendString:@"1"];
            self.pwdLength++;
            break;
        }
        case MD_KEYBOARD_NUM_2:
        {
            [self.pwd appendString:@"2"];
            self.pwdLength++;
            break;
        }
        case MD_KEYBOARD_NUM_3:
        {
            [self.pwd appendString:@"3"];
            self.pwdLength++;
            break;
        }
        case MD_KEYBOARD_NUM_4:
        {
            [self.pwd appendString:@"4"];
            self.pwdLength++;
            break;
        }
        case MD_KEYBOARD_NUM_5:
        {
            [self.pwd appendString:@"5"];
            self.pwdLength++;
            break;
        }
        case MD_KEYBOARD_NUM_6:
        {
            [self.pwd appendString:@"6"];
            self.pwdLength++;
            break;
        }
        case MD_KEYBOARD_NUM_7:
        {
            [self.pwd appendString:@"7"];
            self.pwdLength++;
            break;
        }
        case MD_KEYBOARD_NUM_8:
        {
            [self.pwd appendString:@"8"];
            self.pwdLength++;
            break;
        }
        case MD_KEYBOARD_NUM_9:
        {
            [self.pwd appendString:@"9"];
            self.pwdLength++;
            break;
        }case MD_KEYBOARD_NUM_DEL:
        {
            if (self.pwdLength > 0) {
                [self.pwd deleteCharactersInRange:NSMakeRange(self.pwdLength - 1, 1)];
                self.pwdLength--;
            } else {
                failure();
            }
            break;
        }
        default:
            break;
    }
    
    success();
}

- (void)setPwd:(NSMutableString *)pwd {
    _pwd = [pwd mutableCopy];
}

@end
