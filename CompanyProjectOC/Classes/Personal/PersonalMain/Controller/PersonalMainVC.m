//
//  PersonalMainVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "PersonalMainVC.h"
#import "PersonalMainView.h"
@interface PersonalMainVC ()

@property(nonatomic,strong)PersonalMainView * mainView;
@property(nonatomic,strong)NSMutableArray * dataSources;
@end

@implementation PersonalMainVC

- (NSMutableArray *)dataSources {
    if (!_dataSources) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self initConfig];
}

- (void)setup {
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.mainView];
}

- (void)initConfig {

}

- (PersonalMainView *)mainView {
    if (!_mainView) {
        _mainView = [[PersonalMainView alloc]initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_BAR_HEIGHT)];
    }
    return _mainView;
}


@end
