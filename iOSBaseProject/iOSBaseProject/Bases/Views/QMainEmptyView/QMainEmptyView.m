//
//  QMainEmptyView.m
//  Chrysanthemum
//
//  Created by zl1 on 2018/11/21.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import "QMainEmptyView.h"

@interface QMainEmptyView()

@property (weak, nonatomic) IBOutlet UIImageView *emptyImageView;
@property (weak, nonatomic) IBOutlet UILabel *emptyLabel;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *emptyImageAspect;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *emptyImageHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *emptyImageWidth;

@end


@implementation QMainEmptyView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.emptyLabel.textColor = SUBTITLE_GRAY_COLOR;
    self.emptyLabel.font = [UIFont systemFontOfSize:DETAIL_FONT_SIZE];
    
    [MDMethod setCustomBorderButton:self.goButton backgroundColor:THEME_COLOR title:@"" borderColor:THEME_COLOR titleColor:[UIColor whiteColor] titleFont:DETAIL_NORMAL_FONT_SIZE controlState:UIControlStateNormal];
    self.goButton.layer.cornerRadius = 5.; 
}

- (void)setType:(Q_Main_Empty_Type)type {

    _type = type;
    switch (_type) {
        case Q_Main_Empty_Type_Car:
        {
            
            self.emptyImageView.image = [UIImage imageNamed:@"owner_car_manage_car_nothing"];
            self.emptyImageWidth.constant = 397./209. * 100.;
            self.emptyLabel.text = @"暂无车辆~~";
            [self.goButton setTitle:@"添加车辆" forState:UIControlStateNormal];
            break;
        }
        case Q_Main_Empty_Type_Order:
        {
            self.emptyImageView.image = [UIImage imageNamed:@"common_order_task_order_nothing"];
            self.emptyImageWidth.constant = 506./235. * 100.;
            self.emptyLabel.text = @"暂无任务~~";
            [self.goButton setTitle:@"发布出车任务" forState:UIControlStateNormal];
            break;
        }
        case Q_Main_Empty_Type_Comment:
        {
            
            
            break;
        }
        case Q_Main_Empty_Type_Driver_Issue:
        {
            self.emptyImageView.image = [UIImage imageNamed:@"driver_task_img_line_nothing"];
            self.emptyImageHeight.constant = 200.;
            self.emptyImageWidth.constant = 490./400. * 200.;
            self.emptyLabel.text = @"";
            [self.goButton setTitle:@"立即添加路线" forState:UIControlStateNormal];
            break;
        }
        default:
            break;
    }
}

- (IBAction)clickGo:(id)sender {
    
    self.emptyHandle();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
