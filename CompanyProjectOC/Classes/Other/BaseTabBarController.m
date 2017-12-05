//
//  BaseTabBarController.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeMainVC.h"
#import "ProductCategoriesMainVC.h"
#import "ShoppingCartMainVC.h"
#import "PersonalMainVC.h"
@interface BaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarController
#define RANDOM_COLOR [UIColor colorWithHue: (arc4random() % 256 / 256.0) saturation:((arc4random()% 128 / 256.0 ) + 0.5) brightness:(( arc4random() % 128 / 256.0 ) + 0.5) alpha:1]


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"BaseTabBarController --->viewDidLoad");
    WeakSelf(weakSelf)
    self.delegate = self;
    [self setupTabBarItemsAttributes];
    [self setupViewControllers];
    [self setViewDidLayoutSubViewsBlock:^(CYLTabBarController *aTabBarController) {
        NSLog(@"tabBarViewController --->badgePoint");
        UIViewController *viewController = aTabBarController.viewControllers[0];
        UIView *tabBadgePointView0 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
        [viewController.tabBarItem.cyl_tabButton cyl_setTabBadgePointView:tabBadgePointView0];
        [viewController cyl_showTabBadgePoint];
        
        UIView *tabBadgePointView1 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
        [aTabBarController.viewControllers[1] cyl_setTabBadgePointView:tabBadgePointView1];
        [aTabBarController.viewControllers[1] cyl_showTabBadgePoint];
        
        UIView *tabBadgePointView2 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
        [aTabBarController.viewControllers[2] cyl_setTabBadgePointView:tabBadgePointView2];
        [aTabBarController.viewControllers[2] cyl_showTabBadgePoint];
        
        [aTabBarController.viewControllers[3] cyl_showTabBadgePoint];
        
        //添加提示动画，引导用户点击
        [weakSelf addScaleAnimationOnView:aTabBarController.viewControllers[3].cyl_tabButton.cyl_tabImageView repeatCount:20];
    }];
    [[UINavigationBar appearance] setTintColor:[UIColor grayColor]];
    if (@available(iOS 11, *)) {
        
    }else {
        [[UIBarButtonItem appearance]setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    }
    UIImage *backButtonImage = [[UIImage imageNamed:@" img_back_left_32"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [[UINavigationBar appearance] setBackIndicatorImage:backButtonImage];
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = backButtonImage;
    
}

- (void)setupViewControllers {
    UINavigationController * homeMainNC = [STORYBOARD_MAIN  instantiateViewControllerWithIdentifier:@"HomeMainNC"];
    UINavigationController * categoriesMainNC = [STORYBOARD_MAIN  instantiateViewControllerWithIdentifier:@"ProductCategoriesMainNC"];
    UINavigationController * shoppingCartMainNC = [STORYBOARD_MAIN  instantiateViewControllerWithIdentifier:@"ShoppingCartMainNC"];
    UINavigationController * personalMainNC = [STORYBOARD_MAIN  instantiateViewControllerWithIdentifier:@"PersonalMainNC"];
    self.viewControllers = @[homeMainNC,categoriesMainNC,shoppingCartMainNC,personalMainNC];
}

- (void)setupTabBarItemsAttributes {
    NSDictionary * homeTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"home_normal",
                                                 CYLTabBarItemSelectedImage : @"home_highlight"
                                                 };
    NSDictionary * streetTabBarItemsAttributes = @{
                                                   CYLTabBarItemTitle : @"街区",
                                                   CYLTabBarItemImage : @"mycity_normal",
                                                   CYLTabBarItemSelectedImage : @"mycity_highlight"
                                                   };
    NSDictionary * thirdTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"购物车",
                                                  CYLTabBarItemImage : @"message_normal",
                                                  CYLTabBarItemSelectedImage : @"message_highlight"
                                                  };
    NSDictionary * personalTabBarItemsAttributes = @{
                                                     CYLTabBarItemTitle : @"我的",
                                                     CYLTabBarItemImage : @"account_normal",
                                                     CYLTabBarItemSelectedImage : @"account_highlight"
                                                     };
    self.tabBarItemsAttributes = @[homeTabBarItemsAttributes,streetTabBarItemsAttributes,thirdTabBarItemsAttributes,personalTabBarItemsAttributes];
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    NSLog(@"我是didSelectControl");
    UIView * animationView;
    if ([control cyl_isTabButton]) {
        if ([self.selectedViewController cyl_isShowTabBadgePoint]) {
            [self.selectedViewController cyl_removeTabBadgePoint];
        }else {
            [self.selectedViewController cyl_showTabBadgePoint];
        }
        animationView = [control cyl_tabImageView];
    }
    if (self.selectedIndex % 2 == 0) {
        [self addScaleAnimationOnView:animationView repeatCount:1];
    } else {
        [self addRotateAnimationOnView:animationView];
    }
}

- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    // 针对旋转动画，需要将旋转轴向屏幕外侧平移，最大图片宽度的一半
    // 否则背景与按钮图片处于同一层次，当按钮图片旋转时，转轴就在背景图上，动画时会有一部分在背景图之下。
    // 动画结束后复位
    CGFloat oldZPosition = animationView.layer.zPosition;//0
    animationView.layer.zPosition = 65.f / 2;
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
}




@end
