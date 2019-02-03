//
//  CommonTypeSelectModel.m
//  Chrysanthemum
//
//  Created by mengdong on 2018/11/28.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import "CommonTypeSelectModel.h"

@implementation CommonTypeSelectModel

-(id)initWithData:(NSDictionary *)data {
    
    self = [super init];
    if(self)
    {
        for (NSString *key in [data allKeys]) {
            
            if ([key isEqualToString:@"id"]) {
                
                [self setValue:data[key] forKey:@"typeId"];
            } else {
                
                [self setValue:data[key] forKey:key];
            }
            
        }
    }
    return  self;
}

@end
