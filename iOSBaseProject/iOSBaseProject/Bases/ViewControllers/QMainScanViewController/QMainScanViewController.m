//
//  QMainScanViewController.m
//  duoduoshangcheng
//
//  Created by Leo on 2018/9/7.
//  Copyright © 2018年 cuixiaocun. All rights reserved.
//

#import "QMainScanViewController.h"
#import "SGQRCode.h"

@interface QMainScanViewController ()<SGQRCodeScanManagerDelegate, SGQRCodeAlbumManagerDelegate> {
    
    NSString *_scanningStr;
}

@property (nonatomic, strong) SGQRCodeScanManager *manager;
@property (nonatomic, strong) SGQRCodeScanningView *scanningView;
@property (nonatomic, strong) UILabel *promptLabel;

@end

@implementation QMainScanViewController

- (void)doInit {
    
    self.manager = [SGQRCodeScanManager sharedManager];
    NSArray *arr = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    // AVCaptureSessionPreset1920x1080 推荐使用，对于小型的二维码读取率较高
    [_manager setupSessionPreset:AVCaptureSessionPreset1920x1080 metadataObjectTypes:arr currentController:self];
    //    [manager cancelSampleBufferDelegate];
    _manager.delegate = self;
}

- (void)setUpUI {
    
    [self.view addSubview:self.scanningView];
    [self.view addSubview:self.promptLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (MDKStringIsEmpty(self.titleStr)) {
    
        self.title = @"扫一扫";
    } else {
        
        self.title = self.titleStr;
    }
    
    [self setNormalLeftIconButton];
    
    [self doInit];
    [self setUpUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self scanStartRunning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self scanStopRunning];
}

#pragma mark method
/// 开启
- (void)scanStartRunning {
    
    [self.scanningView addTimer];
    [_manager resetSampleBufferDelegate];
    
    [_manager startRunning];
}

///关闭
- (void)scanStopRunning {
    
    [self.scanningView removeTimer];
    [_manager cancelSampleBufferDelegate];
    
    [_manager stopRunning];
}

#pragma mark 懒加载
- (SGQRCodeScanningView *)scanningView {
    if (!_scanningView) {
        _scanningView = [[SGQRCodeScanningView alloc] initWithFrame:self.view.bounds];
        _scanningView.cornerWidth = 5.;
        
    }
    return _scanningView;
}

- (UILabel *)promptLabel {
    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc] init];
        _promptLabel.backgroundColor = [UIColor clearColor];
        CGFloat promptLabelX = 0;
        CGFloat promptLabelY = 0.65 * self.view.frame.size.height;
        CGFloat promptLabelW = self.view.frame.size.width;
        CGFloat promptLabelH = 25;
        _promptLabel.frame = CGRectMake(promptLabelX, promptLabelY, promptLabelW, promptLabelH);
        _promptLabel.textAlignment = NSTextAlignmentCenter;
        _promptLabel.font = [UIFont boldSystemFontOfSize:13.0];
        _promptLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        if (MDKStringIsEmpty(self.tipsStr)) {
            
            _promptLabel.text = @"将二维码图片放在取景框内即可自动扫描";
        } else {
            
            _promptLabel.text = self.tipsStr;
        }
        
    }
    return _promptLabel;
}

#pragma mark - - - SGQRCodeAlbumManagerDelegate
- (void)QRCodeAlbumManagerDidCancelWithImagePickerController:(SGQRCodeAlbumManager *)albumManager {
    
    [self.view addSubview:self.scanningView];
}

- (void)QRCodeAlbumManager:(SGQRCodeAlbumManager *)albumManager didFinishPickingMediaWithResult:(NSString *)result {
    
    
}

#pragma mark - - - SGQRCodeScanManagerDelegate
- (void)QRCodeScanManager:(SGQRCodeScanManager *)scanManager didOutputMetadataObjects:(NSArray *)metadataObjects {
    
    if (metadataObjects != nil && metadataObjects.count > 0) {
        
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects objectAtIndex:0];
        //输出扫描字符串
        MDK_SuccessLog([NSString stringWithFormat:@"扫描结果   ****      %@",metadataObject.stringValue]);
        [scanManager palySoundName:@"SGQRCode.bundle/sound.caf"];
        [scanManager stopRunning];
 
        [self.navigationController popViewControllerAnimated:YES];
        self.successHandle(metadataObject.stringValue);
    } else {
        
        [self.navigationController popViewControllerAnimated:YES];
        self.failureHandle();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
