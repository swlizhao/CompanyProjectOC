//
//  ApiTokenHelper.h
//  CompanyProjectOC
//
//  Created by 李钊 on 2019/5/30.
//  Copyright © 2019 LIZHAO. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ApiTokenHelper : NSObject

/**
 接口参数封装
 
 @param method 接口名称
 @param parameters 参数
 @return <#return value description#>
 */
+ (NSMutableDictionary *)parametersWithMethod:(NSString *)method withParameters:(NSMutableDictionary *)parameters;


+ (NSString *)getApiUrl;


@end


