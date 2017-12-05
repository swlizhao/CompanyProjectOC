//
//  LoginVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // [self commitLoginDataToServer];
    // [self commitPhotoDataToServer];
    // [self getAppStoreAppVersionInfo];

}

#pragma mark - btnClickedSender
- (IBAction)backBtnAction:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - serviceData
//demo与服务器接口
- (void)commitLoginDataToServer {
  [[RequestServerData getServerInstance]postLoginDataToServerWithName:@"13233236037" pwd:@"123456" progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * result = (NSDictionary *)responseObject;
        NSLog(@"登录接口服务器返回的数据：%@",result);
        // Handle 
    }];
}

//上传图片
- (void)commitPhotoDataToServer {
    [[RequestServerData getServerInstance]postPhotoDataToServerWithUserID:@"138" formData:^(id<AFMultipartFormData> formData) {
        UIImage * image = [UIImage imageNamed:@"img_back_right_16"];
        NSData * imgData = UIImageJPEGRepresentation(image, 0.5);
        NSDate * date = [NSDate date];
        NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy年MM月dd日"];
        NSString * dateString = [formatter stringFromDate:date];
        NSString * fileName = [NSString stringWithFormat:@"%@.png",dateString];
        [formData appendPartWithFileData:imgData name:@"avator" fileName:fileName mimeType:@"image/jpeg"];
    } progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * result = (NSDictionary *)responseObject;
        NSLog(@"上传头像服务器返回的数据：%@",result);
    } ];
}

//获取apptore版本信息
- (void)getAppStoreAppVersionInfo {
    [[RequestServerData getServerInstance] postAppVersionInAppStoreWithApple_ID:APPLE_ID success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"AppStore版本信息：%@",result);
        NSArray * array =result[@"results"];
        NSDictionary * resultDic =[array lastObject];
        NSString * appStoreVersionStr =[NSString stringWithFormat:@"%@",resultDic[@"version"]];
        NSLog(@"appstore获取的==version===%@",appStoreVersionStr);
    }];
}



@end
