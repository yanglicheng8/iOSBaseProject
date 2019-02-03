//
//  QMainPictureView.m
//  QMainProject
//
//  Created by Leo on 2018/9/20.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainPictureView.h"

@interface QMainPictureView()
// 图片类型
@property (nonatomic, assign) QMAIN_PICTURE_TYPE pictureType;

// 图片数据（如果是添加按钮，则不需传入）
@property (nonatomic, strong) QMainPictureViewModel *pictureModel;



@property (nonatomic, strong) UIButton *deleteButton;

@property (nonatomic, strong) UIButton *addButton;

@end

@implementation QMainPictureView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
    }
    
    return self;
}

-(void)setPictureViewWithType:(QMAIN_PICTURE_TYPE)pictureType model:(QMainPictureViewModel *)pictureModel {
    
    _pictureType = pictureType;
    _pictureModel = pictureModel;
    
    switch (pictureType) {
        case QMAIN_PICTURE_TYPE_NORMAL:
        {
            
            if (_pictureModel.sourceType == QMAIN_PICTURE_SOURCE_TYPE_CAMERA_ALBUM) {
                
                if (_pictureModel.thumbImage == nil) {
                    
                    [self.pictureButton setImage:_pictureModel.placeholder forState:UIControlStateNormal];
                } else {
                    
                    [self.pictureButton setImage:_pictureModel.thumbImage forState:UIControlStateNormal];
                }
            } else if (_pictureModel.sourceType == QMAIN_PICTURE_SOURCE_TYPE_URL) {
                
                if (MDKStringIsEmpty(_pictureModel.pictureUrl)) {
                    
                    [self.pictureButton setImage:_pictureModel.placeholder forState:UIControlStateNormal];
                } else {
                    
                    [self.pictureButton sd_setImageWithURL:[NSURL URLWithString:_pictureModel.pictureUrl] forState:UIControlStateNormal];
                }
            }
            
            break;
        }
        case QMAIN_PICTURE_TYPE_DELETE:
        {
            
            if (_pictureModel.sourceType == QMAIN_PICTURE_SOURCE_TYPE_CAMERA_ALBUM) {
                
                if (_pictureModel.thumbImage == nil) {
                    
                    [self.pictureButton setImage:_pictureModel.placeholder forState:UIControlStateNormal];
                    self.deleteButton.hidden = YES;
                } else {
                    
                    [self.pictureButton setImage:_pictureModel.thumbImage forState:UIControlStateNormal];
                    self.deleteButton.hidden = NO;
                }
            } else if (_pictureModel.sourceType == QMAIN_PICTURE_SOURCE_TYPE_URL) {
                
                if (MDKStringIsEmpty(_pictureModel.pictureUrl)) {
                    
                    [self.pictureButton setImage:_pictureModel.placeholder forState:UIControlStateNormal];
                    self.deleteButton.hidden = YES;
                } else {
                    
                    [self.pictureButton sd_setImageWithURL:[NSURL URLWithString:_pictureModel.pictureUrl] forState:UIControlStateNormal];
                    self.deleteButton.hidden = NO;
                }
            }
            
            break;
        }
        case QMAIN_PICTURE_TYPE_ADD:
        {
            
            [self.addButton setImage:[UIImage imageNamed:@"common_add_picture"] forState:UIControlStateNormal];
            
            break;
        }
        default:
            break;
    }
}


#pragma mark 懒加载
- (UIButton *)pictureButton {
 
    if (_pictureButton == nil) {
        
        _pictureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _pictureButton.frame = self.bounds;
        [_pictureButton addTarget:self action:@selector(clickPicture) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_pictureButton];
    }
    
    return _pictureButton;
}

- (UIButton *)deleteButton {
 
    if (_deleteButton == nil) {
        
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteButton.frame = CGRectMake(self.mdk_width - 20, 0, 20, 20);
        [_deleteButton setImage:[UIImage imageNamed:@"common_delete_circle"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(clickDeletePicture) forControlEvents:UIControlEventTouchUpInside];
        _deleteButton.imageEdgeInsets = UIEdgeInsetsMake(5., 5., 5., 5.);
        [self addSubview:_deleteButton];
    }
    
    return _deleteButton;
}

- (UIButton *)addButton {

    if (_addButton == nil) {
        
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addButton.frame = self.bounds;
        [_addButton addTarget:self action:@selector(clickAddPicture) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_addButton];
    }
    
    return _addButton;
}

#pragma mark action
- (void)clickPicture {
    
    self.showDetailHandle(self.pictureModel);
}

- (void)clickDeletePicture {
    
    self.deleteHandle(self.pictureModel);
}

- (void)clickAddPicture {
    
    self.addHandle();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
