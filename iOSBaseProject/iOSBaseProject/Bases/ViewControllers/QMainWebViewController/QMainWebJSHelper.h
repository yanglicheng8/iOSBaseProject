//
//  QMainWebJSHelper.h
//  QMainProject
//
//  Created by Leo on 2018/9/15.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QMainWebViewController.h"
#import <WebKit/WebKit.h>

@protocol QMainWebJSHelperDelegate <NSObject>

@optional

@end

@interface QMainWebJSHelper : NSObject<WKScriptMessageHandler>

@property (nonatomic, weak) id<QMainWebJSHelperDelegate> delegate;
@property (nonatomic, weak) WKWebView *webView;

- (instancetype)initWithDelegate:(id<QMainWebJSHelperDelegate>)delegate webVc:(QMainWebViewController *)webVc;

@end
