//
//  MDSecureKeyboard.m
//  QMainProject
//
//  Created by Leo on 2018/9/18.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "MDSecureKeyboard.h"

#import "MDSecureKeyboardPresenter.h"

@interface MDSecureKeyboard()

@property (nonatomic, strong) MDSecureKeyboardPresenter *presenter;

@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;


@property (weak, nonatomic) IBOutlet UIView *secureView;

@property (weak, nonatomic) IBOutlet UIView *secureFirstView;
@property (weak, nonatomic) IBOutlet UIView *secureFirstCircleView;

@property (weak, nonatomic) IBOutlet UIView *secureSecondView;
@property (weak, nonatomic) IBOutlet UIView *secureSecondCircleView;

@property (weak, nonatomic) IBOutlet UIView *secureThirdView;
@property (weak, nonatomic) IBOutlet UIView *secureThirdCircleView;

@property (weak, nonatomic) IBOutlet UIView *secureFourthView;
@property (weak, nonatomic) IBOutlet UIView *secureFourthCircleView;

@property (weak, nonatomic) IBOutlet UIView *secureFifthView;
@property (weak, nonatomic) IBOutlet UIView *secureFifthCircleView;

@property (weak, nonatomic) IBOutlet UIView *secureSixthView;
@property (weak, nonatomic) IBOutlet UIView *secureSixthCircleView;

@property (weak, nonatomic) IBOutlet UIView *keyBoardView;

@property (weak, nonatomic) IBOutlet UIButton *keyboardOneButton;
@property (weak, nonatomic) IBOutlet UIButton *keyboardTwoButton;
@property (weak, nonatomic) IBOutlet UIButton *keyboardThreeButton;
@property (weak, nonatomic) IBOutlet UIButton *keyboardFourButton;
@property (weak, nonatomic) IBOutlet UIButton *keyboardFiveButton;
@property (weak, nonatomic) IBOutlet UIButton *keyboardSixButton;
@property (weak, nonatomic) IBOutlet UIButton *keyboardSevenButton;
@property (weak, nonatomic) IBOutlet UIButton *keyboardEightButton;
@property (weak, nonatomic) IBOutlet UIButton *keyboardNineButton;

@property (weak, nonatomic) IBOutlet UIButton *keyboardBlankButton;
@property (weak, nonatomic) IBOutlet UIButton *keyboardZeroButton;
@property (weak, nonatomic) IBOutlet UIButton *keyboardDeleteButton;

@end

@implementation MDSecureKeyboard

- (void)awakeFromNib {
    [super awakeFromNib];
 
    self.presenter = [[MDSecureKeyboardPresenter alloc] init];
    [self.presenter initPwd];
    
    self.backgroundColor = [UIColor colorWithRed:0. green:0. blue:0. alpha:0.3];
    
    self.backView.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel.tintColor = TEXT_BLACK_COLOR;
    self.titleLabel.font = [UIFont systemFontOfSize:TITLE_BIG_FONT_SIZE];
    
    self.secureView.backgroundColor = LINE_GRAY_COLOR;
    
    self.secureFirstView.backgroundColor = [UIColor whiteColor];
    self.secureFirstCircleView.backgroundColor = TEXT_BLACK_COLOR;
    self.secureFirstCircleView.layer.cornerRadius = self.secureFirstCircleView.mdk_height/2.;
    self.secureFirstCircleView.hidden = YES;
    
    self.secureSecondView.backgroundColor = [UIColor whiteColor];
    self.secureSecondCircleView.backgroundColor = TEXT_BLACK_COLOR;
    self.secureSecondCircleView.layer.cornerRadius = self.secureSecondCircleView.mdk_height/2.;
    self.secureSecondCircleView.hidden = YES;
    
    self.secureThirdView.backgroundColor = [UIColor whiteColor];
    self.secureThirdCircleView.backgroundColor = TEXT_BLACK_COLOR;
    self.secureThirdCircleView.layer.cornerRadius = self.secureThirdCircleView.mdk_height/2.;
    self.secureThirdCircleView.hidden = YES;
    
    self.secureFourthView.backgroundColor = [UIColor whiteColor];
    self.secureFourthCircleView.backgroundColor = TEXT_BLACK_COLOR;
    self.secureFourthCircleView.layer.cornerRadius = self.secureFourthCircleView.mdk_height/2.;
    self.secureFourthCircleView.hidden = YES;
    
    self.secureFifthView.backgroundColor = [UIColor whiteColor];
    self.secureFifthCircleView.backgroundColor = TEXT_BLACK_COLOR;
    self.secureFifthCircleView.layer.cornerRadius = self.secureFifthCircleView.mdk_height/2.;
    self.secureFifthCircleView.hidden = YES;
    
    self.secureSixthView.backgroundColor = [UIColor whiteColor];
    self.secureSixthCircleView.backgroundColor = TEXT_BLACK_COLOR;
    self.secureSixthCircleView.layer.cornerRadius = self.secureSixthCircleView.mdk_height/2.;
    self.secureSixthCircleView.hidden = YES;
    
    self.keyBoardView.backgroundColor = LINE_GRAY_COLOR;
    
    [self.keyboardOneButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
    self.keyboardOneButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    
    [self.keyboardTwoButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
    self.keyboardTwoButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    
    [self.keyboardThreeButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
    self.keyboardThreeButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    
    [self.keyboardFourButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
    self.keyboardFourButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    
    [self.keyboardFiveButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
    self.keyboardFiveButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    
    [self.keyboardSixButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
    self.keyboardSixButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    
    [self.keyboardSevenButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
    self.keyboardSevenButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    
    [self.keyboardEightButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
    self.keyboardEightButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    
    [self.keyboardNineButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
    self.keyboardNineButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    
    [self.keyboardZeroButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
    self.keyboardZeroButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
    
    self.hidden = YES;
    
}

- (void)showKeyboard {
    
    [self.presenter initPwd];
    [self initKeyboardView];
    self.hidden = NO;
}

- (void)hideKeyboard {
    
    self.hidden = YES;
}

- (IBAction)clickClose:(id)sender {
    
    [self hideKeyboard];
}

- (IBAction)clickOne:(id)sender {

    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_1 success:^{
        
        [self addSecure];
        if ([self.presenter supplyPwdLength] == 6) {
            
            [self.delegate MDSecureKeyboardOutputPwd:[self.presenter supplyOutputPwd]];
        }
    } failure:^{
        
    }];
}

- (IBAction)clickTwo:(id)sender {
    
    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_2 success:^{
        
        [self addSecure];
        if ([self.presenter supplyPwdLength] == 6) {
            
            [self.delegate MDSecureKeyboardOutputPwd:[self.presenter supplyOutputPwd]];
        }
    } failure:^{
        
    }];
}

- (IBAction)clickThree:(id)sender {
    
    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_3 success:^{
        
        [self addSecure];
        if ([self.presenter supplyPwdLength] == 6) {
            
            [self.delegate MDSecureKeyboardOutputPwd:[self.presenter supplyOutputPwd]];
        }
    } failure:^{
        
    }];
}

- (IBAction)clickFour:(id)sender {
    
    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_4 success:^{
        
        [self addSecure];
        if ([self.presenter supplyPwdLength] == 6) {
            
            [self.delegate MDSecureKeyboardOutputPwd:[self.presenter supplyOutputPwd]];
        }
    } failure:^{
        
    }];
}

- (IBAction)clickFive:(id)sender {
    
    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_5 success:^{
        
        [self addSecure];
        if ([self.presenter supplyPwdLength] == 6) {
            
            [self.delegate MDSecureKeyboardOutputPwd:[self.presenter supplyOutputPwd]];
        }
    } failure:^{
        
    }];
}

- (IBAction)clickSix:(id)sender {
    
    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_6 success:^{
        
        [self addSecure];
        if ([self.presenter supplyPwdLength] == 6) {
            
            [self.delegate MDSecureKeyboardOutputPwd:[self.presenter supplyOutputPwd]];
        }
    } failure:^{
        
    }];
}

- (IBAction)clickSeven:(id)sender {
    
    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_7 success:^{
        
        [self addSecure];
        if ([self.presenter supplyPwdLength] == 6) {
            
            [self.delegate MDSecureKeyboardOutputPwd:[self.presenter supplyOutputPwd]];
        }
    } failure:^{
        
    }];
}

- (IBAction)clickEight:(id)sender {
    
    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_8 success:^{
        
        [self addSecure];
        if ([self.presenter supplyPwdLength] == 6) {
            
            [self.delegate MDSecureKeyboardOutputPwd:[self.presenter supplyOutputPwd]];
        }
    } failure:^{
        
    }];
}

- (IBAction)clickNine:(id)sender {
    
    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_9 success:^{
        
        [self addSecure];
        if ([self.presenter supplyPwdLength] == 6) {
            
            [self.delegate MDSecureKeyboardOutputPwd:[self.presenter supplyOutputPwd]];
        }
    } failure:^{
        
    }];
}

- (IBAction)clickBlank:(id)sender {
    
}

- (IBAction)clickZero:(id)sender {
    
    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_0 success:^{
        
        [self addSecure];
        if ([self.presenter supplyPwdLength] == 6) {
            
            [self.delegate MDSecureKeyboardOutputPwd:[self.presenter supplyOutputPwd]];
        }
    } failure:^{
        
    }];
}

- (IBAction)clickDelete:(id)sender {
    
    [self.presenter queryKeyboardNum:MD_KEYBOARD_NUM_DEL success:^{
        
        [self deleteSecure];
        
    } failure:^{
        
    }];
}

- (void)initKeyboardView {
    
    self.secureFirstCircleView.hidden = YES;
    self.secureSecondCircleView.hidden = YES;
    self.secureThirdCircleView.hidden = YES;
    self.secureFourthCircleView.hidden = YES;
    self.secureFifthCircleView.hidden = YES;
    self.secureSixthCircleView.hidden = YES;
}

- (void)addSecure {
    
    if ([self.presenter supplyPwdLength]==1) {
        
        self.secureFirstCircleView.hidden = NO;
    } else if ([self.presenter supplyPwdLength]==2) {
        
        self.secureSecondCircleView.hidden = NO;
    } else if ([self.presenter supplyPwdLength]==3) {
        
        self.secureThirdCircleView.hidden = NO;
    } else if ([self.presenter supplyPwdLength]==4) {
        
        self.secureFourthCircleView.hidden = NO;
    } else if ([self.presenter supplyPwdLength]==5) {
        
        self.secureFifthCircleView.hidden = NO;
    } else if ([self.presenter supplyPwdLength]==6) {
        
        self.secureSixthCircleView.hidden = NO;
    }
}

- (void)deleteSecure {
    
    if ([self.presenter supplyPwdLength]==0) {
        
        self.secureFirstCircleView.hidden = YES;
    } else if ([self.presenter supplyPwdLength]==1) {
        
        self.secureSecondCircleView.hidden = YES;
    } else if ([self.presenter supplyPwdLength]==2) {
        
        self.secureThirdCircleView.hidden = YES;
    } else if ([self.presenter supplyPwdLength]==3) {
        
        self.secureFourthCircleView.hidden = YES;
    } else if ([self.presenter supplyPwdLength]==4) {
        
        self.secureFifthCircleView.hidden = YES;
    } else if ([self.presenter supplyPwdLength]==5) {
        
        self.secureSixthCircleView.hidden = YES;
    }
}

@end
