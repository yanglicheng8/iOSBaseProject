//
//  QMainSearchView.h
//  QMainProject
//
//  Created by Leo on 2018/9/10.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^QMainSearchHandle)(NSString *searchStr);

@interface QMainSearchView : UIView

@property (nonatomic, copy) QMainSearchHandle searchHandle;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, copy) NSString *defaulutStr;

@end
