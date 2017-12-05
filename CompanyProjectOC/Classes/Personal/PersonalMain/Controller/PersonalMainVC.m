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
}

- (void)initConfig {

}



@end
