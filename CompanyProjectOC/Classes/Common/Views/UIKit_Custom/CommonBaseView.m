//
//  CommonBaseView.m
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/17.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "CommonBaseView.h"

@implementation CommonBaseView

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
