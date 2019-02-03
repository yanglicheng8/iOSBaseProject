//
//  QMainLoadView.m
//  Unicorn_Aged
//
//  Created by 李孟东 on 2018/7/31.
//  Copyright © 2018年 dareway. All rights reserved.
//

#import "QMainLoadView.h"


static CGFloat const q_main_load_label_height = 40.;
static CGFloat const q_main_load_inset_height = 10.;
static CGFloat const q_main_load_image_size = 60.;

@interface QMainLoadView()

@property (nonatomic, strong) UIImageView *loadImageView;

@property (nonatomic, strong) UILabel *loadLabel;

@property (nonatomic, strong) UIButton *checkButton;

@property (nonatomic, strong) UIButton *refreshButton;

@end

@implementation QMainLoadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    
    }
    
    return self;
}

/// loading
- (void)loading:(NSString *)tipsString {
    
    self.loadImageView.image = [UIImage imageNamed:@"q_main_load_loading"];
    
    self.loadLabel.text = MDMethodCheckString(tipsString);
}

/// 加载失败
- (void)loadFail:(NSString *)tipsString {
    
    self.loadImageView.image = [UIImage imageNamed:@"q_main_load_failure"];
    
    self.loadLabel.text = MDMethodCheckString(tipsString);
}

/// 列表为空
- (void)loadEmptList:(NSString *)tipsString {
    
    self.loadImageView.image = [UIImage imageNamed:@"q_main_load_empty"];
    
    self.loadLabel.text = MDMethodCheckString(tipsString);
}

#pragma mark action
- (void)clickCheck {

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
        
        if (@available(iOS 10.0, *)) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
        } else {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
    }
}

- (void)clickRefresh {
    
//    [self.delegate loadViewDidSelectRefresh];
}

#pragma mark 懒加载
- (UIImageView *)loadImageView {
    
    if (_loadImageView == nil) {
        
        _loadImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - q_main_load_image_size) / 2, (self.frame.size.height - q_main_load_label_height - q_main_load_inset_height - q_main_load_image_size) / 2, q_main_load_image_size, q_main_load_image_size)];
        [self addSubview:_loadImageView];
    }
    
    return _loadImageView;
}

- (UILabel *)loadLabel {
    
    if (_loadLabel == nil) {
        
        _loadLabel = [[UILabel alloc] initWithFrame:CGRectMake(20., _loadImageView.mdk_maxY + q_main_load_inset_height, self.frame.size.width - 2 * 20., q_main_load_label_height)];
        _loadLabel.textColor = SUBTITLE_GRAY_COLOR;
        _loadLabel.font = [UIFont systemFontOfSize:MINI_FONT_SIZE];
        _loadLabel.textAlignment = NSTextAlignmentCenter;
        _loadLabel.numberOfLines = 2;
        [self addSubview:_loadLabel];
    }
    
    return _loadLabel;
}

- (UIButton *)checkButton {
    
    if (_checkButton == nil) {
        
        _checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _checkButton.frame = CGRectMake((self.frame.size.width - 80.) / 2, _loadLabel.mdk_maxY + 10., 80., 22.);
        [_checkButton setImage:[UIImage imageNamed:@"UA_Common_checknet"] forState:UIControlStateNormal];
        [_checkButton addTarget:self action:@selector(clickCheck) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_checkButton];
    }
    
    return _checkButton;
}

- (UIButton *)refreshButton {
    
    if (_refreshButton == nil) {
        
        _refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _refreshButton.frame = CGRectMake((self.frame.size.width - 80.) / 2, _checkButton.mdk_maxY + 10., 80., 20.);
        [_refreshButton setTitle:@"刷新" forState:UIControlStateNormal];
        [_refreshButton setTitleColor:[UIColor colorWithRed:254./255. green:118./255. blue:24./255. alpha:1.] forState:UIControlStateNormal];
        _refreshButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_FONT_SIZE];
        _refreshButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_refreshButton addTarget:self action:@selector(clickRefresh) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_refreshButton];
    }
    
    return _refreshButton;
}

@end
