//
//  GQTextScrollView.m
//  ImageViewer
//
//  Created by 高旗 on 16/11/30.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import "GQTextScrollView.h"
#import "NSString+GQImageViewrCategory.h"
#import "NSAttributedString+GQImageViewerCategory.h"
#import "GQImageViewrConfigure.h"
#import "GQImageViewerModel.h"
#import "GQImageViewerConst.h"

static NSInteger pageNumberTag = 10086;

static const CGFloat maxTextHight = 200;

@interface GQTextScrollView(){
    CGFloat _textHeight;
    UIColor *_textColor;
    UIFont *_textFont;
    CGFloat _maxHeight;
    UIEdgeInsets _textEdgeInsets;
    NSInteger _pageNumber;
}

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UILabel *pageLabel;

@end

@implementation GQTextScrollView

#pragma mark -- life cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.textLabel];
        [self addSubview:self.pageControl];
        [self addSubview:self.pageLabel];
        
        self.scrollEnabled = YES;
        
        //隐藏滚动条
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.contentSize = CGSizeMake(self.bounds.size.width, _textHeight + _textEdgeInsets.top + _textEdgeInsets.bottom);
    _pageControl.frame = CGRectMake(0, 0, self.bounds.size.width, 10);
    _textLabel.frame = CGRectMake(_textEdgeInsets.left, _textEdgeInsets.top, self.bounds.size.width - _textEdgeInsets.left - _textEdgeInsets.right, _textHeight);
    _pageLabel.frame = CGRectMake(0, 0, self.bounds.size.width, 20);
}

- (void)dealloc {
    _pageControl = nil;
    _textLabel = nil;
    _pageLabel = nil;
}

#pragma mark -- public method

- (CGFloat)configureSource:(id)source
             withConfigure:(GQImageViewrConfigure *)configure
          withCurrentIndex:(NSInteger)currentIndex
            withTotalCount:(NSInteger)totalCount
        withSuperViewWidth:(CGFloat)width
{
    
    UIFont *textFont = configure.textFont?:[UIFont systemFontOfSize:15];
    if (![_textFont isEqual:textFont]) {
        _textFont = textFont;
        _textLabel.font = _textFont;
    }
    
    UIColor *textColor = configure.textColor?:[UIColor whiteColor];
    if (![_textColor isEqual:textColor]) {
        _textColor = textColor;
        _textLabel.textColor = _textColor;
    }
    
    id text = source;
    if (![_text isEqual:text]) {
        _text = [text copy];
    }
    
    CGFloat height = 0;
    CGSize originSize = CGSizeMake(width - _textEdgeInsets.left - _textEdgeInsets.right, MAXFLOAT);
    if ([_text isKindOfClass:[NSString class]]) {
        _textLabel.text = _text;
        height = [text stringSizeWithFont:textFont
                                withcSize:originSize].height;
    } else if ([_text isKindOfClass:[NSAttributedString class]]) {
        _textLabel.attributedText = _text;
        height = [text attributedStringSizeWithSize:originSize
                                    withDefaultFont:textFont].height;
    }
    
    CGFloat maxHeight = configure.maxTextHeight?:maxTextHight;
    if (_maxHeight != maxHeight) {
        _maxHeight = maxHeight;
    }
    
    if (_pageNumber != totalCount) {
        _pageNumber = totalCount;
        _pageControl.numberOfPages = totalCount;
    }
    
    if (!UIEdgeInsetsEqualToEdgeInsets(configure.textEdgeInsets, UIEdgeInsetsZero)&&
        !UIEdgeInsetsEqualToEdgeInsets(_textEdgeInsets, configure.textEdgeInsets)) {
        _textEdgeInsets = configure.textEdgeInsets;
    }
    
    self.backgroundColor = configure.textViewBgColor?:[[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    CGFloat scolleViewHeight = height + _textEdgeInsets.top + _textEdgeInsets.bottom;
    
    if (scolleViewHeight >_maxHeight) {
        scolleViewHeight = _maxHeight;
    }
    
    _textHeight = height;
    
    if (_text) {
        [_pageLabel setHidden:YES];
        [_pageControl setHidden:YES];
        [_textLabel setHidden:NO];
    }else {
        switch (configure.showIndexType) {
            case GQImageViewerShowIndexTypeNone:
                scolleViewHeight = 0;
                break;
            case GQImageViewerShowIndexTypeLabel:{
                scolleViewHeight = 20;
                _pageLabel.text = [NSString stringWithFormat:@"%@/%@",GQ_IntToString(currentIndex+1),GQ_IntToString(totalCount)];
                [_pageLabel setHidden:NO];
                [_pageControl setHidden:YES];
                [_textLabel setHidden:YES];
                break;
            }
            case GQImageViewerShowIndexTypePageControl:{
                _pageControl.currentPage = currentIndex;
                scolleViewHeight = 10;
                [_pageLabel setHidden:YES];
                [_pageControl setHidden:NO];
                [_textLabel setHidden:YES];
                break;
            }
            default:
                break;
        }
    }
    
    [self setContentOffset:CGPointZero animated:NO];
    [self setNeedsLayout];
    return scolleViewHeight;
}

#pragma mark -- lazy load

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.tag = pageNumberTag;
        [_pageControl setHidden:YES];
    }
    return _pageControl;
}

- (UILabel *)pageLabel {
    if (!_pageLabel){
        _pageLabel = [[UILabel alloc] init];
        _pageLabel.textAlignment = NSTextAlignmentCenter;
        _pageLabel.tag = pageNumberTag;
        [_pageLabel setHidden:YES];
        _pageLabel.textColor = [UIColor whiteColor];
    }
    return _pageLabel;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textEdgeInsets = UIEdgeInsetsMake(0, 5, 10, 5);
        _textLabel = [[UILabel alloc] init];
        _textLabel.numberOfLines = 0;
    }
    return _textLabel;
}

@end
