//
//  LZWKWebView.h
//  CompanyProjectOC
//
//  Created by apple on 2017/11/17.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface LZWKWebView : UIView

/*
 * wkwebView  实例对象
 */
@property(nonatomic,strong)WKWebView * lz_WKWebView;

/**
 *  urlString  字符串网址
 */
@property(nonatomic,copy)NSString * urlString;

/**
 * isScroll 是否能滚动 默认YES
 */
@property(nonatomic,assign)BOOL isScroll;


@end
