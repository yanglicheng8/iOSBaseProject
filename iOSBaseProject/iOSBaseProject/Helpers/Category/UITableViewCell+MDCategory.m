//
//  UITableViewCell+MDCategory.m
//  Chrysanthemum
//
//  Created by zl1 on 2018/11/24.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import "UITableViewCell+MDCategory.h"

@implementation UITableViewCell (MDCategory)

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
