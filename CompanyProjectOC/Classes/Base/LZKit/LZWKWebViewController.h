//
//  LZWKWebViewController.h
//  CompanyProjectOC
//
//  Created by apple on 2017/11/17.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "CommonBaseViewController.h"
#import "LZWKWebView.h"
@interface LZWKWebViewController : CommonBaseViewController

@property(nonatomic,strong)UIScrollView *  scrollview;
@property(nonatomic,copy)NSString  * urlString;

@end
