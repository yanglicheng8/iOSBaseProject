//
//  QMainBaseModel.m
//  QMainProject
//
//  Created by Leo on 2018/9/3.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainBaseModel.h"

@implementation QMainBaseModel

-(id)initWithData:(NSDictionary *)data {
    
    self = [super init];
    if(self)
    {
        [self setValuesForKeysWithDictionary:data];
    }
    return  self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    MDK_WarningLog([NSString stringWithFormat:@"undefinedKey: %@", key]);
}

@end
