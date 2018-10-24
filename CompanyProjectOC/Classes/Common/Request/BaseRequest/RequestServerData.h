//
//  RequestServerData.h
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.

/**
 *
 *   AFNetworking 
 *
 */

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
typedef void(^RequestProgressBlock)(NSProgress * downloadProgress);
typedef void(^RequestSuccessBlock)(NSURLSessionDataTask * task, id  responseObject);
typedef void(^RequestFailBlock)(NSURLSessionDataTask * task, NSError *  error);

@interface RequestServerData : NSObject

+ (RequestServerData *)getServerInstance;

- (void)postDataWithUrl:(NSString*)url
                  math:(NSString*)math
            parameters:(NSDictionary*)paramterDic
              formData:(void (^)(id <AFMultipartFormData> formData))formdata
              progress:(RequestProgressBlock)progress
               success:(RequestSuccessBlock)success;
// Login
- (void)postLoginDataToServerWithName:(NSString *)name
                                  pwd:(NSString *)pwd
                             progress:(RequestProgressBlock)progress
                              success:(RequestSuccessBlock)success;

//Upload photo
- (void)postPhotoDataToServerWithUserID:(NSString *)user_id
                               formData:(void (^)(id <AFMultipartFormData> formData))formdata
                               progress:(RequestProgressBlock)progress
                                success:(RequestSuccessBlock)success;

//查询版本信息
- (void)postAppVersionInAppStoreWithApple_ID:(NSString *)apple_ID
                                     success:(RequestSuccessBlock)success;
//前往appstore
- (void)goToAppStore;

@end
