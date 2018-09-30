//
//  CommonBaseWKWebViewController.m
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/23.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "CommonBaseWKWebViewController.h"

@interface CommonBaseWKWebViewController () <WKUIDelegate,WKNavigationDelegate>

@end

@implementation CommonBaseWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  setup];
}

- (void)setup {
    [self.view addSubview:self.webView];
}

#pragma mark - 加载网络请求
- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
//    [self show];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"webView ---> start");
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"webView ---> didFinish");
//    [self hide];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"webView-error:%@",error);
}

#pragma mark - 添加视图
- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc]init];
        //        config.preferences.minimumFontSize = 14;
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH,SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT) configuration:config];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
    }
    return _webView;
}


@end
