//
//  QMainItemView.m
//  Chrysanthemum
//
//  Created by mengdong on 2018/12/8.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import "QMainItemView.h"

@interface QMainItemView()


@end

@implementation QMainItemView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [MDMethod setNormalDetailTextColorLalbel:self.itemLabel];
    [MDMethod addNormalTapGesture:self target:self action:@selector(clickItem)];
}

- (void)clickItem {
    
    self.itemHandle();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
