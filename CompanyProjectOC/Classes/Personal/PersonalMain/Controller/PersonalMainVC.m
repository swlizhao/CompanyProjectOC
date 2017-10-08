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

@property(nonatomic,strong)PersonalMainView * personalMainView;
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
    [self.view insertSubview:self.personalMainView atIndex:0];
}

- (void)initConfig {
    [self initFalseData];
}

#pragma mark - mainViewBlk
- (void)personalMainViewCellSelectWithIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section:%ld---row:%ld",indexPath.section , indexPath.row);
    [self pushLogin];
}

- (void)pushLogin {
    UIViewController * vc = [STORYBOARD_LOGIN instantiateViewControllerWithIdentifier:@"LoginNC"];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

- (PersonalMainView *)personalMainView {
    if (!_personalMainView) {
        _personalMainView = [[PersonalMainView alloc]initWithFrame:CGRectMake(0., STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT)];
        _personalMainView.backgroundColor = RGB(245, 245, 245);
        WeakSelf(weakSelf)
        _personalMainView.handleCellSelectBlk = ^(NSIndexPath *indexPath) {
            [weakSelf personalMainViewCellSelectWithIndexPath:indexPath];
        };
    }
    return _personalMainView;
}

#pragma mark - serviceData

- (void)initFalseData {
    NSArray * falseData = @[
                            @{
                                @"name":@"我的订单"
                                
                                },
                            @{
                                @"name":@"我的收藏"
                                },
                            @{
                                @"name":@"我的卡券"
                                },
                            @{
                                @"name":@"我的伙伴"
                                },
                            @{
                                @"name":@"我的动态"
                                },
                            @{
                                @"name":@"我的活动"
                                },
                            @{
                                @"name":@"我的钱包"
                                },
                            @{
                                @"name":@"消息"
                                },
                            @{
                                @"name":@"设置"
                                }
                            ];
    
    self.dataSources = [falseData copy];
}


@end
