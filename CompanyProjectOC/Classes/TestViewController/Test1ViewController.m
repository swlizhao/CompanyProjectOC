//
//  Test1ViewController.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "Test1ViewController.h"

@interface Test1ViewController ()
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation Test1ViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = arc4randomColor;
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 100)];
    _contentLabel.numberOfLines = 0;
    _contentLabel.backgroundColor = arc4randomColor;
    [self.view addSubview:_contentLabel];
}

- (void) viewWillAppear:(BOOL)paramAnimated{
    [super viewWillAppear:paramAnimated];
    _contentLabel.text = _content;
    //    [self.myWebView loadHTMLString:_dataObject baseURL:nil];
    //    [self.view addSubview:self.myWebView];
    
}


@end
