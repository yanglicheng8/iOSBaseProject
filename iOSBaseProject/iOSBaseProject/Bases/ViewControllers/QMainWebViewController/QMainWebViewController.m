//
//  QMainWebViewController.m
//  QMainProject
//
//  Created by Leo on 2018/9/15.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "QMainWebViewController.h"

#import <WebKit/WebKit.h>

#import "QMainWebJSHelper.h"

@interface QMainWebViewController ()<WKNavigationDelegate, WKUIDelegate, QMainWebJSHelperDelegate>

//
@property (nonatomic, strong) QMainWebJSHelper *jsHelper;

// webview
@property (nonatomic, strong) WKWebView *webview;

@end

@implementation QMainWebViewController

- (void)doInit {
    
    
    
}

- (void)setUpUI {
    
    self.jsHelper.webView = self.webview;
    NSLog(@"++++++url+++++++++++++++  %@", self.webUrl);
    // 加载初始URL
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"";
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"common_back_white"] style:UIBarButtonItemStyleDone target:self action:@selector(popViewController)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    
    [self doInit];
    [self setUpUI];
    
}

#pragma mark ---------- 通知中心    ----------

#pragma mark ---------- 网络请求     ----------

#pragma mark ---------- 懒  加  载    ----------
- (WKWebView *)webview {
    
    if (_webview == nil) {
        
        // webview配置文件
        WKWebViewConfiguration *vcc = [[WKWebViewConfiguration alloc] init];
        vcc.userContentController = [[WKUserContentController alloc] init];
        [vcc.userContentController addScriptMessageHandler:self.jsHelper
                                                      name:@"QMain"];
        // 允许在线播放
        [vcc setAllowsInlineMediaPlayback:YES];
        
        _webview = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:vcc];
        _webview.scrollView.bounces = NO;
      
        [_webview setUIDelegate:self];
        [_webview setNavigationDelegate:self];
        [_webview setMultipleTouchEnabled:YES];
        [_webview.scrollView setAlwaysBounceVertical:YES];
        // 禁用左滑退出
        _webview.allowsBackForwardNavigationGestures = NO;
        [self.view addSubview:_webview];
    }
    
    return _webview;
}

- (QMainWebJSHelper *)jsHelper {
    
    if (_jsHelper == nil) {
        
        _jsHelper = [[QMainWebJSHelper alloc] initWithDelegate:self webVc:self];
        
    }
    
    return _jsHelper;
}

#pragma mark ---------- 按钮事件     ----------
- (void)popViewController {

    if (self.isLaunchSkip) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        self.dismissHandle();
    } else {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark ---------- 代理协议    ----------
#pragma mark - WKNavigationDelegate 追踪加载过程

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    // 准备加载页面
    // NSLog(@"request cache policy : %d",[[NSURLRequest requestWithURL:webView.URL] cachePolicy]);
    
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
 
    self.title = MDMethodCheckString(webView.title);
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    //    [self.activity stopAnimating];
    if([error code] == NSURLErrorCancelled)  {
        return;
    }
    
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    //    [self.activity stopAnimating];
    if([error code] == NSURLErrorCancelled)  {
        return;
    }
    
}

//当js渲染完成时调用，用来隐藏laod图片
- (void)webLoadFinish {
    

}

//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
//{
//    
//    
//}

#pragma mark - WKNavigationDelegate 进行页面跳转

// 接收到服务器跳转请求之后再执行
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation
{
    
}

// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - WKUIDelegate

// 创建一个新的WebView
- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    return nil;
}

// WebView关闭（9.0中的新方法）
- (void)webViewDidClose:(WKWebView *)webView
{
    
}

// 显示一个JS的Alert（与JS交互的）
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    if ([message containsString:@"tel:"]) {

        NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", [message substringFromIndex:4]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
        completionHandler();
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *action){
                                                    completionHandler();
                                                }]];
        [self presentViewController:alert
                           animated:YES
                         completion:NULL];
    }
}

// 弹出一个输入框（与JS交互的）
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"输入"
                                                                   message:prompt
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField){
        textField.textColor = [UIColor blackColor];
        textField.placeholder = defaultText;
    }];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action){
                                                completionHandler([[alert.textFields lastObject] text]);
                                            }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消"
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction * _Nonnull action){
                                                completionHandler(nil);
                                            }]];
    [self presentViewController:alert
                       animated:YES
                     completion:NULL];
}

// 显示一个确认框（JS的）
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action){
                                                completionHandler(YES);
                                            }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消"
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction * _Nonnull action){
                                                completionHandler(NO);
                                            }]];
    [self presentViewController:alert
                       animated:YES
                     completion:NULL];
}
#pragma mark ---------- 私有方法     ----------


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
