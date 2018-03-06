//
//  PersonalCollectionBaseVC.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "PersonalCollectionBaseVC.h"
#import "PersonalCollectionShopVC.h"
#import "PersonalCollectionProductVC.h"
@interface PersonalCollectionBaseVC ()

@end

@implementation PersonalCollectionBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initConfig];
    [self initSegment];
    [self initViewControllers];
}

- (void)initConfig {
    self.navigationItem.title = @"我的收藏";
}

- (void)initSegment {
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
    PersonalCollectionProductVC * collectionProductVC = [[PersonalCollectionProductVC alloc]init];
    collectionProductVC.yp_tabItemTitle = @"商品收藏";
    PersonalCollectionShopVC * collecionShopVC = [[PersonalCollectionShopVC alloc]init];
    collecionShopVC.yp_tabItemTitle = @"店铺收藏";

    self.viewControllers = [NSMutableArray arrayWithObjects:collectionProductVC,collecionShopVC,nil];
    
}

@end
