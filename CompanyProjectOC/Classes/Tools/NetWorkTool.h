//
//  NetWorkTool.h
//  CompanyProjectOC
//
//  Created by 李钊 on 2019/5/30.
//  Copyright © 2019 LIZHAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiResultModel.h"
#import "AFNetworking.h"

@interface NetWorkTool : NSObject


/**
 * GET请求
 * @param method 接口名称
 * @param parameters 参数
 * @param resultBlock 结果回调
 **/

+ (void)httpGetWithMethod:(NSString *)method
           withParameters:(NSMutableDictionary *)parameters
          withResultBlock:(void(^)(ApiResultModel *model))resultBlock;


/**
 * POST请求
 * @param parameters 参数
 * @param resultBlock 结果回调
 *
 **/

+ (void)httpPostWithMethod:(NSString *)method
            withParameters:(NSMutableDictionary *)parameters
           withResultBlock:(void(^)(ApiResultModel *model))resultBlock;

@end


