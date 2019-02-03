//
//  QMainVariableView.m
//  Chrysanthemum
//
//  Created by zl1 on 2018/11/26.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import "QMainVariableView.h"

@interface QMainVariableView() {
    
    NSMutableArray *_widgetButtonArray;
}

@property (nonatomic, strong) NSArray *widgets;

@property (nonatomic, copy) WidgetSelectHandle widgetSelectHandle;

@end

@implementation QMainVariableView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        
    }
    
    return self;
}

- (void)getWidgetSizeWithWidgetHeight:(CGFloat)widgetHeight widgetInsert:(CGFloat)widgetInsert widgetRowInsert:(CGFloat)widgetRowInsert widgetMaxWidth:(CGFloat)widgetMaxWidth widgetFont:(CGFloat)widgetFont widgets:(NSArray *)widgets widgetHandle:(WidgetHandle)widgetHandle widgetSelectHandle:(WidgetSelectHandle)widgetSelectHandle {
    
    _widgetButtonArray = [NSMutableArray arrayWithCapacity:0];
    
    self.widgets = widgets;
    self.widgetSelectHandle = widgetSelectHandle;
    
    //每个widget两边多加的宽度
    CGFloat widgetAppendInsert = 20.;
    //当前顶部距离
    CGFloat widgetsHeightInsert = 0.0;
    //每个value之间的间隔
    CGFloat valueInsert = 10.;
    //返回的高度
    CGFloat widgetsHeight = 0.0;
    //用来记录当前的总宽度，来进行换行
    CGFloat tempWidth = 0.0;
    
    for (int i=0; i<self.widgets.count; i++) {
        
        NSString *widgetDetail = self.widgets[i];
        
        CGFloat valueWidth = [MDMethod queryTextWidthByString:widgetDetail width:MAXFLOAT fontSize:widgetFont] + widgetAppendInsert;
        
        if (tempWidth + valueWidth < widgetMaxWidth) {
            
            if (tempWidth == 0) {
                
                widgetsHeight += widgetHeight + widgetInsert;
            }
            
            UIButton *widgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
            widgetButton.frame = CGRectMake(tempWidth, widgetsHeightInsert, valueWidth, widgetHeight);
            [MDMethod setCustomBorderButton:widgetButton backgroundColor:[UIColor colorWithRed:230./255. green:230./255. blue:230./255. alpha:1.] title:widgetDetail borderColor:[UIColor colorWithRed:230./255. green:230./255. blue:230./255. alpha:1.] titleColor:TEXT_BLACK_COLOR titleFont:widgetFont controlState:UIControlStateNormal];
            [widgetButton addTarget:self action:@selector(clickWidget:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:widgetButton];
            [_widgetButtonArray addObject:widgetButton];
            
            tempWidth += valueWidth + valueInsert;
        } else {
            
            if (valueWidth < widgetMaxWidth) {
                
                UIButton *widgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
                widgetButton.frame = CGRectMake(tempWidth, widgetsHeightInsert, valueWidth, widgetHeight);
                [MDMethod setCustomBorderButton:widgetButton backgroundColor:[UIColor colorWithRed:230./255. green:230./255. blue:230./255. alpha:1.] title:widgetDetail borderColor:[UIColor colorWithRed:230./255. green:230./255. blue:230./255. alpha:1.] titleColor:TEXT_BLACK_COLOR titleFont:widgetFont controlState:UIControlStateNormal];
                [widgetButton addTarget:self action:@selector(clickWidget:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:widgetButton];
                [_widgetButtonArray addObject:widgetButton];
                
                tempWidth = valueWidth + valueInsert;
                widgetsHeight = widgetsHeight + widgetHeight + widgetRowInsert;
                widgetsHeightInsert = widgetsHeightInsert + widgetHeight + widgetRowInsert;
            } else {
                NSInteger tempNumber = (valueWidth - 1.)/widgetMaxWidth + 1;
                
                UIButton *widgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
                widgetButton.frame = CGRectMake(tempWidth, widgetsHeightInsert, widgetMaxWidth, tempNumber * widgetHeight);
                [MDMethod setCustomBorderButton:widgetButton backgroundColor:[UIColor colorWithRed:230./255. green:230./255. blue:230./255. alpha:1.] title:widgetDetail borderColor:[UIColor colorWithRed:230./255. green:230./255. blue:230./255. alpha:1.] titleColor:TEXT_BLACK_COLOR titleFont:widgetFont controlState:UIControlStateNormal];
                [widgetButton addTarget:self action:@selector(clickWidget:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:widgetButton];
                [_widgetButtonArray addObject:widgetButton];
                
                tempWidth = 0;
                widgetsHeight = widgetsHeight + tempNumber * widgetHeight + widgetRowInsert;
                widgetsHeightInsert = widgetsHeightInsert + tempNumber * widgetHeight + widgetRowInsert;
            }
        }
    }
    
    widgetHandle(widgetsHeight);
}

- (void)clickWidget:(UIButton *)sender {
    
    NSInteger selectIndex = [_widgetButtonArray indexOfObject:sender];
    self.widgetSelectHandle([self.widgets objectAtIndex:selectIndex]);
}

@end
