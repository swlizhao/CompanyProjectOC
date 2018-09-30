//
//  BaseView.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self _setupBaseView];
        [self _initConfigBaseView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupBaseView];
        [self _initConfigBaseView];
    }
    return  self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _setupBaseView];
        [self _initConfigBaseView];
    }
    return self;
}

- (void)_setupBaseView {
    
}

- (void)_initConfigBaseView {
    self.backgroundColor = [UIColor colorWithRed:250./255. green:250./255. blue:250./255. alpha:1.];
}

#pragma mark - 显示视图
- (void)show {
    __weak typeof(self)WEAK_SELF = self;
    [UIView animateWithDuration:0.25 animations:^{
        WEAK_SELF.alpha = 1.;
    }];
}

#pragma mark - 隐藏视图
- (void)hidden {
     self.alpha = 0.;
}

@end
