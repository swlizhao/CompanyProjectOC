//
//  NetWorkTool.m
//  CompanyProjectOC
//
//  Created by 李钊 on 2019/5/30.
//  Copyright © 2019 LIZHAO. All rights reserved.
//

#import "NetWorkTool.h"


@implementation NetWorkTool

+ (AFHTTPSessionManager *)sharedAFHTTPSessionManager {
    static AFHTTPSessionManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:@""]];
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO//如果是需要验证自建证书，需要设置为YES
        securityPolicy.allowInvalidCertificates = NO;
        //validatesDomainName 是否需要验证域名，默认为YES；
        securityPolicy.validatesDomainName = NO;
        manager.securityPolicy = securityPolicy;
    });
    return manager;
}



/**
 * GET请求
 * @param method 接口名称
 * @param parameters 参数
 * @param resultBlock 结果回调
 **/

+ (void)httpGetWithMethod:(NSString *)method
           withParameters:(NSMutableDictionary *)parameters
          withResultBlock:(void(^)(ApiResultModel *model))resultBlock {
    
}


/**
 * POST请求
 * @param parameters 参数
 * @param resultBlock 结果回调
 *
 **/

+ (void)httpPostWithMethod:(NSString *)method
            withParameters:(NSMutableDictionary *)parameters
           withResultBlock:(void(^)(ApiResultModel *model))resultBlock {
    
}


@end
