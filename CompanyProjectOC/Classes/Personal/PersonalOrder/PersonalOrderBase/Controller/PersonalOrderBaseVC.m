//
//  PersonalOrderBaseVC.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "PersonalOrderBaseVC.h"
#import "PersonalOrderAllVC.h"
#import "PersonalOrderPayVC.h"
#import "PersonalOrderSendVC.h"
#import "PersonalOrderRecieveVC.h"
#import "PersonalOrderEvaluationVC.h"
#import "PersonalOrderRefundVC.h"
@interface PersonalOrderBaseVC ()

@end

@implementation PersonalOrderBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initConfig];
    [self setup];
    [self initViewControllers];
}

- (void)initConfig {
    self.navigationItem.title = @"我的订单";
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
    [self.tabBar setScrollEnabledAndItemFitTextWidthWithSpacing:20];
    [self.tabBar setIndicatorWidthFixTextAndMarginTop:41
                                         marginBottom:0
                                      widthAdditional:0
                                    tapSwitchAnimated:YES];
    [self setContentScrollEnabled:YES tapSwitchAnimated:YES];
}

- (void)initViewControllers {
    PersonalOrderAllVC * allVC = [[PersonalOrderAllVC alloc]init];
    allVC.yp_tabItemTitle = @"全部";
    PersonalOrderPayVC * payVC = [[PersonalOrderPayVC alloc]init];
    payVC.yp_tabItemTitle = @"待付款";
    PersonalOrderSendVC * sendVC = [[PersonalOrderSendVC alloc]init];
    sendVC.yp_tabItemTitle = @"待发货";
    PersonalOrderRecieveVC * recieveVC = [[PersonalOrderRecieveVC alloc]init];
    recieveVC.yp_tabItemTitle = @"待收货";
    PersonalOrderEvaluationVC * evaluationVC = [[PersonalOrderEvaluationVC alloc]init];
    evaluationVC.yp_tabItemTitle = @"待评价";
    PersonalOrderRefundVC * refundVC = [[PersonalOrderRefundVC alloc]init];
    refundVC.yp_tabItemTitle = @"退款/售后";
    self.viewControllers = [NSMutableArray arrayWithObjects:allVC,payVC,sendVC,recieveVC,evaluationVC,refundVC,nil];
    
}



@end
