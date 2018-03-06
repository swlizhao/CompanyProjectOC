//
//  AppDelegate+ShareSDK.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/5.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "AppDelegate+ShareSDK.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
//微信SDK头文件
#import "WXApi.h"
#import "WeiboSDK.h"
@implementation AppDelegate (ShareSDK)


- (void)registerShareSDK {
     NSLog(@"shareSDK被注册了...");
    [ShareSDK registerActivePlatforms:@[
                                        @(SSDKPlatformTypeWechat),
                                        @(SSDKPlatformTypeQQ),
                                         @(SSDKPlatformTypeSinaWeibo)
                                        ]
                             onImport:^(SSDKPlatformType platformType) {
                                 switch (platformType) {
                                     case SSDKPlatformTypeWechat:
                                         [ShareSDKConnector connectWeChat:[WXApi class]];
                                         break;
                                      case SSDKPlatformTypeQQ:
                                         [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                                         break;
                                     case SSDKPlatformTypeSinaWeibo:
                                         [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                                         break;
                                     default:
                                         break;
                                 }
                             }
                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo){
                          switch (platformType) {
                              case SSDKPlatformTypeWechat:
                                  [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                                        appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                                  break;
                                  case SSDKPlatformTypeQQ:
                                  [appInfo SSDKSetupQQByAppId:@"100371282"
                                                       appKey:@"aed9b0303e3ed1e27bae87c33761161d"
                                                     authType:SSDKAuthTypeBoth];
                                  break;
                              case SSDKPlatformTypeSinaWeibo:
                                  [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                                                            appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                                          redirectUri:@"http://www.sharesdk.cn"
                                                             authType:SSDKAuthTypeBoth];
                                  break;
                                  
                              default:
                                  break;
                          }
                      }];
}


@end
