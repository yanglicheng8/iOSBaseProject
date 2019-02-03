//
//  UITextView+PlaceHolder.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UITextView+PlaceHolder.h"
static const char *phTextView = "placeHolderTextView";
@implementation UITextView (PlaceHolder)
- (UITextView *)placeHolderTextView {
    return objc_getAssociatedObject(self, phTextView);
}
- (void)setPlaceHolderTextView:(UITextView *)placeHolderTextView {
    objc_setAssociatedObject(self, phTextView, placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)addPlaceHolder:(NSString *)placeHolder {
    if (![self placeHolderTextView]) {
//        self.delegate = self;
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
//        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor colorWithRed:102/ 255.0 green:102/ 255.0 blue:102/ 255.0 alpha:1.0];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        if ([placeHolder isEqualToString:@"请输入遇到的问题"]) {
            textView.backgroundColor = [UIColor whiteColor];
        }else{
//            textView.backgroundColor = [UIColor colorWithRed:232/ 255.0 green:232/ 255.0 blue:232/ 255.0 alpha:1.0];
        }
        
//        textView.layer.borderColor = [UIColor whiteColor].CGColor;
        [self addSubview:textView];
        [self setPlaceHolderTextView:textView];
    }
}
# pragma mark -
# pragma mark - UITextViewDelegate
//- (void)textViewDidBeginEditing:(UITextView *)textView {
//    self.placeHolderTextView.hidden = YES;
//    // if (self.textViewDelegate) {
//    //
//    // }
//}
//- (void)textViewDidEndEditing:(UITextView *)textView {
//    if (textView.text && [textView.text isEqualToString:@""]) {
//        self.placeHolderTextView.hidden = NO;
//    }
//}

@end
