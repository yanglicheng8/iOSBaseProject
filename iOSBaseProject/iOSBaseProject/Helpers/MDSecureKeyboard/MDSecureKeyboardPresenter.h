//
//  MDSecureKeyboardPresenter.h
//  QMainProject
//
//  Created by 李孟东 on 2018/9/18.
//  Copyright © 2018年 dareway. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MD_KEYBOARD_NUM) {
    
    MD_KEYBOARD_NUM_0 = 1,          //0
    MD_KEYBOARD_NUM_1,              //1
    MD_KEYBOARD_NUM_2,              //2
    MD_KEYBOARD_NUM_3,              //3
    MD_KEYBOARD_NUM_4,              //4
    MD_KEYBOARD_NUM_5,              //5
    MD_KEYBOARD_NUM_6,              //6
    MD_KEYBOARD_NUM_7,              //7
    MD_KEYBOARD_NUM_8,              //8
    MD_KEYBOARD_NUM_9,              //9
    MD_KEYBOARD_NUM_DEL             //删除
    
};

@interface MDSecureKeyboardPresenter : NSObject

/// 初始化
- (void)initPwd;

/// 获取当前输出的密码
- (NSString *)supplyOutputPwd;

/// 获取密码长度
- (NSInteger)supplyPwdLength;

/// 添加内容
- (void)queryKeyboardNum:(MD_KEYBOARD_NUM)keyboardNum success:(void(^)(void))success failure:(void(^)(void))failure;

@end
