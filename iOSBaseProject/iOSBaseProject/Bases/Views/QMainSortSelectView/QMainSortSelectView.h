//
//  QMainSortSelectView.h
//  QMainProject
//
//  Created by Leo on 2018/9/10.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QMainSortSelectModel.h"

@protocol QMainSortSelectViewDelegate

- (void)selectSort:(QMainSortSelectModel *)sortModel;

@end

@interface QMainSortSelectView : UIView

@property (nonatomic, weak) id<QMainSortSelectViewDelegate> delegate;

@property (nonatomic, strong) NSArray <QMainSortSelectModel *> *sortArray;

//是否显示底部line
@property (nonatomic, assign) BOOL showSortLine;

//默认类型 - 初始化
- (void)setDefaultSort:(QMainSortSelectModel *)defaultSortModel;

//设置当前类型 - 使用过程中
- (void)selectSort:(QMainSortSelectModel *)defaultSortModel;

//刷新
- (void)refresh;

@end
