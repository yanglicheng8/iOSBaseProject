//
//  CommonTypeSelectView.m
//  Chrysanthemum
//
//  Created by mengdong on 2018/11/28.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import "CommonTypeSelectView.h"

@interface CommonTypeSelectView() {
 
    NSMutableArray *_typeButtonArray;
}

@property (weak, nonatomic) IBOutlet UIView *typeView;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UIView *typeContentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *typeContentHeight;

@end

@implementation CommonTypeSelectView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [MDMethod setNormalDetailTextColorLalbel:self.typeLabel];
}

- (void)setTypeTitle:(NSString *)typeTitle {

    self.typeLabel.text = typeTitle;
}

- (void)setTypeArray:(NSArray<CommonTypeSelectModel *> *)typeArray {
    _typeArray = typeArray;

    [self.typeContentView layoutIfNeeded];
    
    _typeButtonArray = [NSMutableArray arrayWithCapacity:0];
    for (UIButton *tempButton in self.typeContentView.subviews) {
        
        [tempButton removeFromSuperview];
    }
    
    CGFloat buttonWidth = (self.typeContentView.mdk_width - 3 * common_type_select_x_insert) / 4;
    CGFloat buttonHeight = buttonWidth * common_type_select_w_h_scale;
    
    self.typeContentHeight.constant = (buttonHeight + common_type_select_y_insert) * ((_typeArray.count - 1)/4 + 1);
    
    for (int i=0; i<_typeArray.count; i++) {
        
        CommonTypeSelectModel *typeModel = _typeArray[i];
        
        UIButton *typeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        typeButton.frame = CGRectMake((buttonWidth + common_type_select_x_insert) * (i%4), (buttonHeight + common_type_select_y_insert) * (i/4), buttonWidth, buttonHeight);
        [typeButton setBackgroundImage:[UIImage imageNamed:@"owner_car_manage_default"] forState:UIControlStateNormal];
        [typeButton setBackgroundImage:[UIImage imageNamed:@"owner_car_manage_selected"] forState:UIControlStateSelected];
        [typeButton setTitleColor:SUBTITLE_GRAY_COLOR forState:UIControlStateNormal];
        [typeButton setTitleColor:THEME_COLOR forState:UIControlStateSelected];
        typeButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
        [typeButton setTitle:typeModel.name forState:UIControlStateNormal];
        [typeButton addTarget:self action:@selector(clickType:) forControlEvents:UIControlEventTouchUpInside];
        [self.typeContentView addSubview:typeButton];
        
        [_typeButtonArray addObject:typeButton];
        
        typeButton.selected = typeModel.select;
    }
    
}

- (void)clickType:(UIButton *)sender {

    NSInteger currentSelectIndex = [_typeButtonArray indexOfObject:sender];
    CommonTypeSelectModel *currentTypeModel = (CommonTypeSelectModel *)[_typeArray objectAtIndex:currentSelectIndex];
    self.selectHandle(currentTypeModel);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
