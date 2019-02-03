//
//  QMainWebJSHelper.m
//  QMainProject
//
//  Created by Leo on 2018/9/15.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainWebJSHelper.h"
#import "QMainWebViewController.h"

@interface QMainWebJSHelper()

@property (nonatomic, weak) QMainWebViewController *webVc;

@end

@implementation QMainWebJSHelper

- (instancetype)initWithDelegate:(id<QMainWebJSHelperDelegate>)delegate webVc:(QMainWebViewController *)webVc {
    
    self = [super init];
    if (self) {
        
        self.delegate = delegate;
        self.webVc = webVc;
    }
    
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:message.body];
    NSString *functionName = dic[@"functionname"];
    NSString *encodedPara = dic[@"para"];
    
    NSDictionary *paraDict;
    if (![encodedPara isEqualToString:@""]) {
        paraDict= [MDMethod dictionaryWithJsonString:[encodedPara stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    
    MDKLog(@"================= %@ ==================== %@", dic, paraDict);
    
    if ([message.name isEqualToString:@"QMain"] && [dic isKindOfClass:[NSDictionary class]]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if ([functionName isEqualToString:@""]) {
                
                
            } else {
                
                return;
            }
            
        });
        
    } else {
        
        return;
    }

}

@end
