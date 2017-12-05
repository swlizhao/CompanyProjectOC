//
//  LZWKWebViewController.m
//  CompanyProjectOC
//
//  Created by apple on 2017/11/17.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "LZWKWebViewController.h"

@interface LZWKWebViewController ()

@property(nonatomic,strong)LZWKWebView * wkWebView;

@end

@implementation LZWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    [self.view addSubview:self.wkWebView];
    _scrollview = self.wkWebView.lz_WKWebView.scrollView;
}

- (void)setUrlString:(NSString *)urlString {
    _urlString = urlString;
    self.wkWebView.urlString = _urlString;
}

- (LZWKWebView *)wkWebView {
    if (!_wkWebView) {
        _wkWebView = [[LZWKWebView alloc]initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_BAR_HEIGHT)];
    }
    return _wkWebView;
}

@end
