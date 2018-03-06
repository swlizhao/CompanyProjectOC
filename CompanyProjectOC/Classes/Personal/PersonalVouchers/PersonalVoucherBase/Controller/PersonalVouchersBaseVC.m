//
//  PersonalVouchersBaseVC.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "PersonalVouchersBaseVC.h"
#import "PersonalVoucherUseVC.h"
#import "PersonalVoucherUsedVC.h"
#import "PersonalVoucherOverdueVC.h"
@interface PersonalVouchersBaseVC ()

@end

@implementation PersonalVouchersBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initConfig];
    [self setup];
    [self initViewControllers];
}

- (void)initConfig {
   self.navigationItem.title = @"我的代金券";
}

- (void)setup {
    [self initViewControllers];
    [self setTabBarFrame:CGRectMake(0., STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, 44.)
        contentViewFrame:CGRectMake(0., STATUS_NAVIGATION_BAR_HEIGHT + 44., SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT - 44.)];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.indicatorScrollFollowContent = YES;
    self.tabBar.indicatorAnimationStyle = YPTabBarIndicatorAnimationStyle1;
    self.tabBar.indicatorColor = [UIColor redColor];
    self.tabBar.itemTitleColor = [UIColor blackColor];
    self.tabBar.itemTitleSelectedColor = [UIColor redColor];
    self.tabBar.itemTitleFont = [UIFont systemFontOfSize:FONTSIZE_14];
    self.tabBar.itemTitleSelectedFont = [UIFont systemFontOfSize:FONTSIZE_16];
    //    [self.tabBar setScrollEnabledAndItemFitTextWidthWithSpacing:20];
    [self.tabBar setIndicatorWidthFixTextAndMarginTop:42
                                         marginBottom:0
                                      widthAdditional:0
                                    tapSwitchAnimated:YES];
    [self setContentScrollEnabled:YES tapSwitchAnimated:YES];
}

- (void)initViewControllers {
    PersonalVoucherUseVC * canUseVC = [[PersonalVoucherUseVC alloc]init];
    canUseVC.yp_tabItemTitle = @"未使用";
    PersonalVoucherUsedVC * usedVC = [[PersonalVoucherUsedVC alloc]init];
    usedVC.yp_tabItemTitle = @"已使用";
    PersonalVoucherOverdueVC * overdueVC = [[PersonalVoucherOverdueVC alloc]init];
    overdueVC.yp_tabItemTitle = @"已过期";
    self.viewControllers = [NSMutableArray arrayWithObjects:canUseVC,usedVC,overdueVC,nil];
    
}



@end
