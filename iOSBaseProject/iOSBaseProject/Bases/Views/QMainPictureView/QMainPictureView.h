//
//  QMainPictureView.h
//  QMainProject
//
//  Created by Leo on 2018/9/20.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QMainPictureViewModel.h"

typedef NS_ENUM(NSInteger, QMAIN_PICTURE_TYPE) {
    
    QMAIN_PICTURE_TYPE_NORMAL = 1,          //普通状态，显示图片
    QMAIN_PICTURE_TYPE_DELETE,              //显示图片，并且左上角有删除按钮
    QMAIN_PICTURE_TYPE_ADD,                 //显示添加图片按钮
};

typedef void(^showDetailHandle)(QMainPictureViewModel *pictureModel);
typedef void(^deleteHandle)(QMainPictureViewModel *pictureModel);
typedef void(^addHandle)(void);

@interface QMainPictureView : UIView

@property (nonatomic, copy) showDetailHandle showDetailHandle;
@property (nonatomic, copy) deleteHandle deleteHandle;
@property (nonatomic, copy) addHandle addHandle;

@property (nonatomic, strong) UIButton *pictureButton;

-(void)setPictureViewWithType:(QMAIN_PICTURE_TYPE)pictureType model:(QMainPictureViewModel *)pictureModel;

@end
