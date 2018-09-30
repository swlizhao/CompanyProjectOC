//
//  AppDelegate+RCIM.m
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/17.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "AppDelegate+RCIM.h"

@implementation AppDelegate (RCIM)

- (void)initRCIMWithApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[RCIM sharedRCIM]initWithAppKey:RCIM_KEY]; //初始化
//    [[RCIM sharedRCIM]setUserInfoDataSource:self]; //用户信息提供者
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(RICMTokenNoti:) name:RICMTOKEN object:nil];
}

@end
