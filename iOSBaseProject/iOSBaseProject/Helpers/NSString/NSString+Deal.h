//
//  NSString+Deal.h
//  DracoWealth
//
//  Created by wht on 16/4/21.
//  Copyright © 2016年 wht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <Security/Security.h>

@interface NSString (Deal)
//把金额插入点和小数点后两位
+ (NSString *)countNumAndChangeformat:(NSString *)num;
//MD5加密
- (NSString *)md5Encrypt;
//DES加密
+ (NSString *)DESStringFromText:(NSString *)text key:(NSString *)key action:(NSString *)action;
//DES解密
+ (NSString *)textFromEncryptionString:(NSString *)str key:(NSString *)key;

@end
