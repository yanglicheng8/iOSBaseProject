//
//  QMainPictureViewModel.h
//  QMainProject
//
//  Created by Leo on 2018/9/20.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainBaseModel.h"

typedef NS_ENUM(NSInteger, QMAIN_PICTURE_SOURCE_TYPE) {
    
    QMAIN_PICTURE_SOURCE_TYPE_CAMERA_ALBUM = 1,         //相机相册获取的图片
    QMAIN_PICTURE_SOURCE_TYPE_URL,                      //网络获取的图片
};

@interface QMainPictureViewModel : QMainBaseModel

//图片来源
@property (nonatomic, assign) QMAIN_PICTURE_SOURCE_TYPE sourceType;

//本地相册、相机，缩略图片
@property (nonatomic, strong) UIImage *thumbImage;

//本地相册、相机，图片
@property (nonatomic, strong) UIImage *photoImage;

//图片名称
@property (nonatomic, copy) NSString *photoName;

//网络图片，地址
@property (nonatomic, copy) NSString *pictureUrl;

//占位图
@property (nonatomic, strong) UIImage *placeholder;

//是否已经上传
@property (nonatomic, assign) BOOL haveUpload;

@end
