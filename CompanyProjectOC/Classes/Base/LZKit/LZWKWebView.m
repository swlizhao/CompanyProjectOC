//
//  LZWKWebView.m
//  CompanyProjectOC
//
//  Created by apple on 2017/11/17.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "LZWKWebView.h"
@interface LZWKWebView ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler,UIScrollViewDelegate>


@end

@implementation LZWKWebView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.lz_WKWebView];
    [self setNeedsUpdateConstraints];
    _isScroll = YES;
}

- (void)setIsScroll:(BOOL)isScroll {
    _isScroll = isScroll;
    _lz_WKWebView.scrollView.scrollEnabled = _isScroll;
}

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    [self.lz_WKWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
}


#pragma mark - WKUIDelegate

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"LZWKWebView start loading...");
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"收到服务器重定向请求");
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"LZWKWebView finish load");
    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id data, NSError * _Nullable error) {
        CGFloat height = [data floatValue];
//        NSLog(@"-加载完成后页面总高度--height:%f",height);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"LZWKWebViewScrollHeight" object:nil userInfo: @{@"scrollHeight":@(height)}];
    }];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加LZWKWebView---load-error:%@",error);
}

/*
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"在请求开始加载之前调用，决定是否跳转");
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    NSLog(@"收到响应，决定是否跳转...");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败");
}

- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
    
}

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    
}
 */

#pragma  mark - 初始化视图
- (WKWebView *)lz_WKWebView {
    if (!_lz_WKWebView) {
        WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc]init];
        _lz_WKWebView = [[WKWebView alloc]initWithFrame:CGRectZero configuration:config];
        _lz_WKWebView.UIDelegate = self;
        _lz_WKWebView.navigationDelegate = self;
    }
    return _lz_WKWebView;
}

- (void)updateConstraints {
    [super updateConstraints];
    [_lz_WKWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}


@end
