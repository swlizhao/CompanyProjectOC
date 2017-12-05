//
//  BaseViewController.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBaseSetup];
    [self initBaseConfig];
}

- (void)initBaseSetup {
    NSLog(@"我是BaseViewController--->ViewDidLoad");
}

- (void)initBaseConfig {
    NSLog(@"我是BaseConfig --->ViewDidLoad");
}


@end
