//
//  ApiTokenHelper.m
//  CompanyProjectOC
//
//  Created by 李钊 on 2019/5/30.
//  Copyright © 2019 LIZHAO. All rights reserved.
//

#import "ApiTokenHelper.h"

@implementation ApiTokenHelper

/**
 接口参数封装
 
 @param method 接口名称
 @param parameters 参数
 @return <#return value description#>
 */
+ (NSMutableDictionary *)parametersWithMethod:(NSString *)method withParameters:(NSMutableDictionary *)parameters {
    //快速枚举遍历所有KEY的值
    for (NSString *key in [parameters keyEnumerator]) {
        if ([[parameters objectForKey:key] isEqual:[NSNull null]] || [parameters objectForKey:key] == nil) {
            [parameters setObject:@"" forKey:key];
        }
    }
    
  return parameters;
    
}



/**
 获取接口地址
 
 @return api地址
 */
+ (NSString *)getApiUrl {
   /*
    switch ([InstallationAddress intValue]) {
        case 1:
            return APIURL;
            break;
        case 2:
            return APIURLTest;
            break;
        case  3:
            return APIURLlocalTest;
            break;
        default:
            return @"";
            break;
    }
    */
    return @"www.baidu.com";
}

@end
