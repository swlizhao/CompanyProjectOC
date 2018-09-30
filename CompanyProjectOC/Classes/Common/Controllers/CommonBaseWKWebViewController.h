//
//  CommonBaseWKWebViewController.h
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/23.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "CommonBaseViewController.h"
#import <WebKit/WebKit.h>
@interface CommonBaseWKWebViewController : CommonBaseViewController

@property(nonatomic,strong)WKWebView * webView;
@property (nonatomic,copy)NSString * urlString;

@end
