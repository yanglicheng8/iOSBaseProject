//
//  QMainBaseModel.h
//  QMainProject
//
//  Created by Leo on 2018/9/3.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QMainBaseModel : NSObject

-(id)initWithData:(NSDictionary*)data;//初始化方法

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;//防崩

@end
