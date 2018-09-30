//
//  RequestServerData.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "RequestServerData.h"

@implementation RequestServerData

+ (RequestServerData *)getServerInstance {
    static RequestServerData * requestServerData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        requestServerData = [[RequestServerData alloc]init];
    });
    return requestServerData;
}

- (void)postDataWithUrl:(NSString*)url
                   math:(NSString*)math
             parameters:(NSDictionary*)paramterDic
               formData:(void (^)(id <AFMultipartFormData> formData))formdata
               progress:(RequestProgressBlock)progress
                success:(RequestSuccessBlock)success {

    url = [NSString stringWithFormat:@"%@%@",MAIN_URL,url];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.securityPolicy.allowInvalidCertificates = YES;
    if ([math isEqualToString:@"GET"]) {
        [manager GET:url parameters:paramterDic progress:progress success:success failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"RequestServerData - GET - failure - error:%@",error);
        }];
    }else if ([math isEqualToString:@"POST"]) {
        if (!paramterDic && !formdata) {
            [manager POST:url parameters:nil progress:progress success:success failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"RequestServerData - POST - !para && !form - failure - error:%@",error);
            }];
        }else {
            [manager POST:url parameters:paramterDic constructingBodyWithBlock:formdata progress:progress success:success failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"RequestServerData - POST - ![!para && !form] - error:%@",error);

            }];
        }
    }else {
        NSLog(@"No Handle");
    }
}

//公用接口(appStore)
- (void)postAppStoreDataWithUrl:(NSString*)url
                          math:(NSString*)math
                    parameters:(NSDictionary*)paramterDic
                      progress:(RequestProgressBlock*)progress
                       success:(RequestSuccessBlock)sucess {
    url = [NSString stringWithFormat:@"%@%@",MAIN_URL,url];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer     = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [manager GET:url parameters:paramterDic progress:nil success:sucess failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"RequestServerData - GET - APPSTORE - error:%@",error);
    }];
}

- (void)postLoginDataToServerWithName:(NSString *)name
                                  pwd:(NSString *)pwd
                             progress:(RequestProgressBlock)progress
                              success:(RequestSuccessBlock)success {
    
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    [parame setObject:name     forKey:@"user"];
    [parame setObject:pwd      forKey:@"password"];
    [self postDataWithUrl:@"/login.php" math:@"POST" parameters:parame formData:nil progress:progress success:success];
}

- (void)postPhotoDataToServerWithUserID:(NSString *)user_id
                               formData:(void (^)(id <AFMultipartFormData> formData))formdata
                               progress:(RequestProgressBlock)progress
                                success:(RequestSuccessBlock)success {
    
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    [parame setObject:user_id forKeyedSubscript:@"user_id"];
    [self postDataWithUrl:@".php?m=Home&c=User&a=edit_member_avator" math:@"POST" parameters:parame formData:formdata progress:progress success:success];
}

//查询版本信息
- (void)postAppVersionInAppStoreWithApple_ID:(NSString *)apple_ID
                                     success:(RequestSuccessBlock)success {
       [self postAppStoreDataWithUrl:APPLE_ID math:@"GET" parameters:nil progress:nil success:success];
}

- (void)goToAppStore {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?mt=8", APPLE_ID]];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)getWithCity:(NSString *)city
            success:(RequestSuccessBlock)success {
    NSMutableDictionary *parame = [NSMutableDictionary dictionary];
    [parame setObject:city forKeyedSubscript:@"city"];
        [self postAppStoreDataWithUrl:@"/open/api/weather/json.shtml" math:@"GET" parameters:parame progress:nil success:success];
}

@end
