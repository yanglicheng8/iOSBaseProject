//
//  UIImageView+QMain.m
//  Chrysanthemum
//
//  Created by mengdong on 2018/12/13.
//  Copyright © 2018 LiMengDong. All rights reserved.
//

#import "UIImageView+QMain.h"
#import "GQImageViewer.h"

@interface UIImageView()

@property (nonatomic, strong) NSArray *pickers;

@property (nonatomic, copy) NSString *currentItem;

@end

@implementation UIImageView (QMain)
static NSString *pickersKey = @"pickersKey"; //name的key
static NSString *currentItemKey = @"currentItemKey"; //name的key

- (void)tapShowBigImageView {
    
    self.userInteractionEnabled = YES;
    [MDMethod addNormalTapGesture:self target:self action:@selector(showBigImageView)];
}

- (void)tapShowPickerBrowser:(NSArray *)pickers currentItem:(NSInteger)currentItem {
    
    self.userInteractionEnabled = YES;
    self.pickers = [pickers copy];
    self.currentItem = [NSString stringWithFormat:@"%ld", currentItem];
    [MDMethod addNormalTapGesture:self target:self action:@selector(showPickerBrowser)];
}

- (void)showBigImageView {
    
    [MDMethod showDetailImageWithImage:self.image];
}

- (void)showPickerBrowser {
    
    GQWeakify(self);
    //链式调用
    [GQImageViewer sharedInstance]
    .configureChain(^(GQImageViewrConfigure *configure) {
        [configure configureWithImageViewBgColor:[UIColor blackColor]
                                 textViewBgColor:nil
                                       textColor:[UIColor whiteColor]
                                        textFont:[UIFont systemFontOfSize:12]
                                   maxTextHeight:100
                                  textEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)
                                       scaleType:GQImageViewerScaleTypeEqualWidth
                                 launchDirection:GQLaunchDirectionBottom];
        [configure setRequestClassName:@"DemoURLRequest"];
//        configure.launchFromView = self;
        configure.showIndexType = YES;
        [configure setNeedTapAutoHiddenTopBottomView:YES];//设置是否需要自动隐藏顶部和底部视图
    })
    .dataSouceArrayChain(self.pickers,nil)//如果仅需要图片浏览就只需要传图片即可，无需传文字数组
    .selectIndexChain([self.currentItem integerValue])//设置选中的索引
    .topViewConfigureChain(^(UIView *configureView) {
        configureView.height = 80;
    })
    .bottomViewConfigureChain(^(UIView *configureView) {
        configureView.height = 50;
    })
    .achieveSelectIndexChain(^(NSInteger selectIndex){//获取当前选中的图片索引
        NSLog(@"%ld",selectIndex);
    })
    .singleTapChain(^(NSInteger selectIndex){//点击手势回调
        NSLog(@"%ld",selectIndex);
        [[GQImageViewer sharedInstance] dissMissWithAnimation:YES];
    })
    .longTapIndexChain(^(UIImage *image , NSInteger selectIndex){//长按手势回调
        NSLog(@"%p,%ld",image,selectIndex);
    })
    .dissMissChain(^(){
        NSLog(@"dissMiss");
    })
    .showInViewChain(MDKAppDelegate.window,YES);//显示GQImageViewer到指定view上
}

///taskNumberLabel setter+getter
- (void)setPickers:(NSArray *)pickers {
    
    objc_setAssociatedObject(self, &pickersKey, pickers, OBJC_ASSOCIATION_RETAIN);
}

- (NSArray *)pickers {
    return objc_getAssociatedObject(self, &pickersKey);
}

///markView setter+getter
- (void)setCurrentItem:(NSString *)currentItem {
    
    objc_setAssociatedObject(self, &currentItemKey, currentItem, OBJC_ASSOCIATION_COPY);
}

- (NSString *)currentItem {
    return objc_getAssociatedObject(self, &currentItemKey);
}


@end
