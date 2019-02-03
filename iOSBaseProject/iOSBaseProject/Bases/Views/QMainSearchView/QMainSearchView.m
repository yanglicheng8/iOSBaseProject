//
//  QMainSearchView.m
//  QMainProject
//
//  Created by Leo on 2018/9/10.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainSearchView.h"

@interface QMainSearchView()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *searchField;

@end

@implementation QMainSearchView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    
    self.searchField.attributedPlaceholder = [MDMethod getAttributedString:placeholder attriColor:PLACEHOLDER_COLOR normalColr:PLACEHOLDER_COLOR font:DETAIL_FONT_SIZE attriSize:0];
}

- (void)setDefaulutStr:(NSString *)defaulutStr {
    _defaulutStr = defaulutStr;
    
    self.searchField.text = _defaulutStr;
}

- (UITextField *)searchField {
    
    if (_searchField == nil) {
        
        _searchField = [[UITextField alloc] initWithFrame:self.bounds];
        _searchField.backgroundColor = [UIColor whiteColor];
        _searchField.textColor = TEXT_BLACK_COLOR;
        _searchField.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
        _searchField.returnKeyType = UIReturnKeySearch;
        _searchField.delegate = self;
        _searchField.layer.masksToBounds = YES;
        _searchField.layer.cornerRadius = _searchField.mdk_height/2;
        _searchField.tintColor = THEME_COLOR;
        [self addSubview:_searchField];
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, _searchField.mdk_height)];
        leftView.backgroundColor = [UIColor clearColor];
        
        _searchField.leftView = leftView;
        _searchField.leftViewMode = UITextFieldViewModeAlways;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0, 0, _searchField.mdk_height, _searchField.mdk_height);
        [rightButton setImage:[UIImage imageNamed:@"owner_issue_manage_search"] forState:UIControlStateNormal];
        
        _searchField.rightView = rightButton;
        _searchField.rightViewMode = UITextFieldViewModeAlways;
    }
    
    return _searchField;
}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.searchField resignFirstResponder];
    
    self.searchHandle(textField.text);
 
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
