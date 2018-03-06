//
//  AccountSecurityMainVC.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "AccountSecurityMainVC.h"
#import "AccountSecurityMainView.h"
@interface AccountSecurityMainVC ()

@property(nonatomic,strong)AccountSecurityMainView * mainView;
@property(nonatomic,strong)NSMutableArray * dataSources;
@end

@implementation AccountSecurityMainVC

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
    [self initAccountSecurityData];
}

- (void)setup {
    [self.view addSubview:self.mainView];
}

- (void)initConfig {
    self.navigationItem.title = @"账户安全";
}

#pragma mark - 初始化视图
- (AccountSecurityMainView *)mainView {
    if (!_mainView) {
        _mainView = [[AccountSecurityMainView  alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT)];
        _mainView.backgroundColor = RGB(245, 245, 245);
    }
    return _mainView;
}

- (void)initAccountSecurityData {
    NSString * jsonPath = [[NSBundle mainBundle]pathForResource:@"AccountSecurityData" ofType:@"json"];
    NSData * responseObject = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    NSDictionary * result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
    NSArray * array = result[@"data"];
    for (int i = 0; i < array.count; i++) {
        NSDictionary * dict = array[i];
        AccountSecurityListModel * model = [AccountSecurityListModel modelWithDictionary:dict];
        [self.dataSources addObject:model];
    }
    self.mainView.dataSources = self.dataSources;
}

@end
