//
//  HomeMainVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "HomeMainVC.h"
#import "HomeMainView.h"
@interface HomeMainVC ()

@property(nonatomic,strong)HomeMainView * mainView;

@end

@implementation HomeMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initHomeUI];
    [self  initHomeConfig];
    
    for (int i = 0; i<200000000000; i++) {
        NSLog(@"1");
    }
}

- (void)initHomeUI {
   [self.view  addSubview:self.mainView];
}

- (void)initHomeConfig {
    self.mainView.backgroundColor = RGB(245, 245, 245);
    self.navigationItem.title = @"首页";
}

#pragma mark - 懒加载视图
- (HomeMainView *)mainView {
    if (_mainView) {
        return _mainView;
    }
       _mainView = [[HomeMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT)];
    return _mainView;
}


@end
