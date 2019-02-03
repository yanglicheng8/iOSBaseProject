//
//  QMainSortSelectView.m
//  QMainProject
//
//  Created by Leo on 2018/9/10.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainSortSelectView.h"

@interface QMainSortSelectView()<UIScrollViewDelegate> {
    
    NSInteger _totalNum;
    CGFloat _buttonWidth;
}

@property (nonatomic, assign) NSInteger currentSort;

@property (nonatomic, strong) UIScrollView *sortScrollView;

@property (nonatomic, strong) NSMutableArray *sortButtonArray;

@property (nonatomic, strong) UIView *sortLine;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation QMainSortSelectView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.currentSort = 0;
        
        self.sortScrollView.backgroundColor = [UIColor whiteColor];
        
        self.sortButtonArray = [NSMutableArray arrayWithCapacity:0];
        
        self.sortLine.hidden = YES;
        
        self.lineView.hidden = YES;
        
    }
    
    return self;
}

- (void)setSortArray:(NSArray<QMainSortSelectModel *> *)sortArray {
    _sortArray = sortArray;
    
    [self.sortButtonArray removeAllObjects];
    for (id temp in _sortScrollView.subviews) {
        if ([temp isKindOfClass:[UIButton class]]) {
            
            [temp removeFromSuperview];
        }
    }
    
    _totalNum = _sortArray.count;
    
    CGFloat buttonHeight = _sortScrollView.mdk_height - 1.;
    
    if (_totalNum <= 4) {
        
        _buttonWidth = self.mdk_width / _totalNum;
        
        self.sortScrollView.contentSize = CGSizeMake(self.mdk_width, self.mdk_height);
        self.lineView.frame = CGRectMake(0, _sortScrollView.mdk_height - 1., _sortScrollView.contentSize.width, 1.);
    } else {
        
        _buttonWidth = self.mdk_width/4;
        
        self.sortScrollView.contentSize = CGSizeMake(_totalNum * _buttonWidth, self.mdk_height);
    }
    
    self.sortLine.frame = CGRectMake(13., _sortScrollView.mdk_height - 1., _buttonWidth - 2 * 13., 1.);
    
    for (int i=0; i<_sortArray.count; i++) {
        
        QMainSortSelectModel *sortModel = _sortArray[i];
        UIButton *sortButton = [UIButton buttonWithType:UIButtonTypeCustom];
        sortButton.frame = CGRectMake(i * _buttonWidth, 0, _buttonWidth, buttonHeight);
        [sortButton addTarget:self action:@selector(clickSort:) forControlEvents:UIControlEventTouchUpInside];
        [_sortScrollView addSubview:sortButton];
        
        if (sortModel.sortVariable) {
            
//            if (self.currentSort == i) {


//                [MDMethod setCustomAroundButton:sortButton image:@"common_sort_normal" title:sortModel.sortStr titleColor:THEME_COLOR titleFont:DETAIL_NORMAL_FONT_SIZE];
//            } else {

                [MDMethod setCustomAroundButton:sortButton image:@"common_sort_normal" title:sortModel.sortStr titleColor:TEXT_BLACK_COLOR titleFont:DETAIL_NORMAL_FONT_SIZE controlState:UIControlStateNormal];
//            }
        } else {
            
            [sortButton setTitle:sortModel.sortStr forState:UIControlStateNormal];
            
            sortButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
            if (self.currentSort == i) {
            
                [sortButton setTitleColor:THEME_COLOR forState:UIControlStateNormal];
            } else {
                
                [sortButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
            }
        }
        
//        if (sortModel.showTaskNumber) {
//         
//            [sortButton showTaskNumber:sortModel.taskNumber];
//        }
        
        [self.sortButtonArray addObject:sortButton];
    }
    
}

- (void)setShowSortLine:(BOOL)showSortLine {
    _showSortLine = showSortLine;
    
    if (_showSortLine) {
        
        self.sortLine.hidden = NO;
    } else {
        
        self.sortLine.hidden = YES;
    }
}

//默认类型
- (void)setDefaultSort:(QMainSortSelectModel *)defaultSortModel {
    
    NSInteger defaultSortNum = [self.sortArray indexOfObject:defaultSortModel];
    self.currentSort = defaultSortNum;
    
    if (_totalNum > 4) {
        
        if (defaultSortNum > 1) {
            
            if (defaultSortNum + 2 < _totalNum) {
                
                self.sortScrollView.contentOffset = CGPointMake(_buttonWidth * (defaultSortNum - 1), 0);
            } else {
             
                self.sortScrollView.contentOffset = CGPointMake(_buttonWidth * (_totalNum - 4), 0);
            }
            
        } else if (defaultSortNum == 1) {
            
            self.sortScrollView.contentOffset = CGPointMake(0, 0);
        }
    }
    
    self.sortLine.frame = CGRectMake(defaultSortNum * _buttonWidth + 13., _sortScrollView.mdk_height - 1., _buttonWidth - 2 * 13., 1.);
    
    QMainSortSelectModel *currentModel = [self.sortArray objectAtIndex:defaultSortNum];
    UIButton *currentSortButton = [self.sortButtonArray objectAtIndex:defaultSortNum];
    
    if (currentModel.sortVariable) {
        
        currentModel.sortType = QMainSortSelectType_Asc;
        [MDMethod setCustomAroundButton:currentSortButton image:@"common_sort_asc" title:currentModel.sortStr titleColor:THEME_COLOR titleFont:DETAIL_NORMAL_FONT_SIZE controlState:UIControlStateNormal];
    } else {
        
        [currentSortButton setTitleColor:THEME_COLOR forState:UIControlStateNormal];
    }
    
}

//设置当前类型
- (void)selectSort:(QMainSortSelectModel *)defaultSortModel {
    
    for (int i=0; i<self.sortArray.count; i++) {
        QMainSortSelectModel *tempModel = self.sortArray[i];
    
        if ([tempModel.sortId isEqualToString:defaultSortModel.sortId]) {
            
            UIButton *tempButton = (UIButton *)self.sortButtonArray[i];
            [self clickSort:tempButton];
            
            break;
        }
    }
}

- (void)clickSort:(UIButton *)sender {
    
    NSInteger lastSort = self.currentSort;
    NSInteger currentSort = [self.sortButtonArray indexOfObject:sender];
    
    if (_totalNum > 4) {
        
        if (currentSort > 1 && currentSort + 2 < _totalNum) {
            
            if (_buttonWidth * (currentSort - 1) + self.mdk_width > self.sortScrollView.contentSize.width) {
                
                self.sortScrollView.contentOffset = CGPointMake(self.sortScrollView.contentSize.width - self.mdk_width, 0);
            } else {
                self.sortScrollView.contentOffset = CGPointMake(_buttonWidth * (currentSort - 1), 0);
            }
        
        } else if (currentSort <= 1) {
            
            self.sortScrollView.contentOffset = CGPointMake(0, 0);
        }
    }
    
    self.sortLine.frame = CGRectMake(currentSort * _buttonWidth + 13., _sortScrollView.mdk_height - 1., _buttonWidth - 2 * 13., 1.);
    
    // 先判断当前选择跟之前选择是否一样
    if (lastSort == currentSort) {
        //一样的话，判断当前选择是否可以切换排序状态
        QMainSortSelectModel *currentModel = [self.sortArray objectAtIndex:currentSort];
        if (currentModel.sortVariable) {
            //能排序，判断当前的排序状态
//            if (currentModel.sortType == QMainSortSelectType_Normal) {
//                //默认排序状态改为升序
//                currentModel.sortType = QMainSortSelectType_Desc;
//                [MDMethod setCustomAroundButton:sender image:@"common_sort_desc" title:currentModel.sortStr titleColor:THEME_COLOR titleFont:DETAIL_NORMAL_FONT_SIZE];
//            } else
            if (currentModel.sortType == QMainSortSelectType_Desc) {
                //降序改为升序
                currentModel.sortType = QMainSortSelectType_Asc;
                [MDMethod setCustomAroundButton:sender image:@"common_sort_asc" title:currentModel.sortStr titleColor:THEME_COLOR titleFont:DETAIL_NORMAL_FONT_SIZE controlState:UIControlStateNormal];
            } else if (currentModel.sortType == QMainSortSelectType_Asc) {
                //升序改为降序
                currentModel.sortType = QMainSortSelectType_Desc;
                [MDMethod setCustomAroundButton:sender image:@"common_sort_desc" title:currentModel.sortStr titleColor:THEME_COLOR titleFont:DETAIL_NORMAL_FONT_SIZE controlState:UIControlStateNormal];
            }
            
            [self.delegate selectSort:currentModel];
            
        } else {
            //不能排序，则忽略
            
        }
        
    } else {
        //不一样的话，先将之前的状态按钮恢复默认
        UIButton *lastSortButton = [self.sortButtonArray objectAtIndex:lastSort];
        QMainSortSelectModel *lastSortModel = [self.sortArray objectAtIndex:lastSort];
        if (lastSortModel.sortVariable) {
            
            [MDMethod setCustomAroundButton:lastSortButton image:@"common_sort_normal" title:lastSortModel.sortStr titleColor:TEXT_BLACK_COLOR titleFont:DETAIL_NORMAL_FONT_SIZE controlState:UIControlStateNormal];
        } else {
            
            [lastSortButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
        }
        
        //再将当前的按钮置为选中
        UIButton *currentSortButton = sender;
        QMainSortSelectModel *currentSortModel = [self.sortArray objectAtIndex:currentSort];
        if (currentSortModel.sortVariable) {
            //默认改为升序
            
            currentSortModel.sortType = QMainSortSelectType_Asc;
            [MDMethod setCustomAroundButton:sender image:@"common_sort_asc" title:currentSortModel.sortStr titleColor:THEME_COLOR titleFont:DETAIL_NORMAL_FONT_SIZE controlState:UIControlStateNormal];
        } else {
            
            [currentSortButton setTitleColor:THEME_COLOR forState:UIControlStateNormal];
        }
        
        self.currentSort = currentSort;
        
        [self.delegate selectSort:currentSortModel];
        
    }
    
}

- (UIScrollView *)sortScrollView {
    
    if (_sortScrollView == nil) {
        
        _sortScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.mdk_width, self.mdk_height)];
        _sortScrollView.showsVerticalScrollIndicator = NO;
        _sortScrollView.showsHorizontalScrollIndicator = NO;
        _sortScrollView.delegate = self;
        [self addSubview:_sortScrollView];
    }
    
    return _sortScrollView;
}

- (UIView *)sortLine {
    
    if (_sortLine == nil) {
        
        _sortLine = [[UIView alloc] init];
        _sortLine.backgroundColor = THEME_COLOR;
        [_sortScrollView addSubview:_sortLine];
    }
    
    return _sortLine;
}

- (UIView *)lineView {
    
    if (_lineView == nil) {
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = LINE_GRAY_COLOR;
        [_sortScrollView addSubview:_lineView];
    }
    
    return _lineView;
}

//刷新
- (void)refresh {
 
    for (int i=0; i<self.sortArray.count; i++) {
        
        QMainSortSelectModel *sortModel = _sortArray[i];
        
        UIButton *sortButton = (UIButton *)self.sortButtonArray[i];
        
        if (sortModel.sortVariable) {
            
            [MDMethod setCustomAroundButton:sortButton image:@"common_sort_normal" title:sortModel.sortStr titleColor:TEXT_BLACK_COLOR titleFont:DETAIL_NORMAL_FONT_SIZE controlState:UIControlStateNormal];
        } else {
            
            [sortButton setTitle:sortModel.sortStr forState:UIControlStateNormal];
            
            sortButton.titleLabel.font = [UIFont systemFontOfSize:DETAIL_NORMAL_FONT_SIZE];
            if (self.currentSort == i) {
                
                [sortButton setTitleColor:THEME_COLOR forState:UIControlStateNormal];
            } else {
                
                [sortButton setTitleColor:TEXT_BLACK_COLOR forState:UIControlStateNormal];
            }
        }
        
        if (sortModel.showTaskNumber) {
            if (MDKStringIsEmpty(sortModel.taskNumber) || [sortModel.taskNumber isEqualToString:@"0"]) {
                
                [sortButton hideTaskNumber];
            } else {
             
                [sortButton showTaskNumber:sortModel.taskNumber];
            }
        }
        
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
