//
//  NewsInformationBaseVC.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "NewsInformationBaseVC.h"
#import "NewsFocusVC.h"
#import "NewsRecommendVC.h"
#import "NewsVideoVC.h"
#import "NewsEntertainmentVC.h"
@interface NewsInformationBaseVC ()

@end

@implementation NewsInformationBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initConfig];
    [self setup];
}


- (void)initConfig {
    self.navigationItem.title = @"新闻资讯";
}

- (void)setup {
    [self initViewControllers];
    [self setTabBarFrame:CGRectMake(0., STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, 44.)
        contentViewFrame:CGRectMake(0., STATUS_NAVIGATION_BAR_HEIGHT + 44., SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT - 44. - TAB_BAR_HEIGHT)];
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
    NewsFocusVC * focusVC = [[NewsFocusVC alloc]init];
    focusVC.yp_tabItemTitle = @"关注";
    NewsRecommendVC * recommendVC = [[NewsRecommendVC alloc]init];
    recommendVC.yp_tabItemTitle = @"推荐";
    NewsVideoVC * videoVC = [[NewsVideoVC alloc]init];
    videoVC.yp_tabItemTitle = @"视频";
    NewsEntertainmentVC * entertainmentVC = [[NewsEntertainmentVC alloc]init];
    entertainmentVC.yp_tabItemTitle = @"娱乐";
    self.viewControllers = [NSMutableArray arrayWithObjects:focusVC,recommendVC,videoVC,entertainmentVC,nil];
    
}

@end
