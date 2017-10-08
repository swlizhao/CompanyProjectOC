//
//  UIView+LZNavigationBackItem.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "UIView+LZNavigationBackItem.h"
#import "JRSwizzle.h"
@implementation UIView (LZNavigationBackItem)

+ (void)load {
    if (@available(iOS 11, *)) {
      [NSClassFromString(@"_UIBackButtonContainerView") jr_swizzleMethod:@selector(addSubview:) withMethod:@selector(iOS11BackButtonNoTextTrick_addSubview:) error:nil];
    }
}

- (void)iOS11BackButtonNoTextTrick_addSubview:(UIView *)view {
    view.alpha = 0;
    if ([view isKindOfClass:[UIButton class]]) {
        UIButton *button = (id)view;
        [button setTitle:@" " forState:UIControlStateNormal];
    }
    [self iOS11BackButtonNoTextTrick_addSubview:view];
    
}

@end
