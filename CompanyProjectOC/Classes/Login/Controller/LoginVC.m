//
//  LoginVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "LoginVC.h"
#import "LoginMainView.h"
#import "RegisterVC.h"
#import "ForgotVC.h"
@interface LoginVC ()

@property(nonatomic,strong)LoginMainView * mainView;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self initConfig];
    // [self commitLoginDataToServer];
    // [self commitPhotoDataToServer];
    // [self getAppStoreAppVersionInfo];
}

- (void)setup {
    [self.view addSubview:self.mainView];
    __weak typeof(self)weakSelf = self;
    BaseButton * backBtn = [BaseButton baseButtonWithFrame:CGRectMake(0, 0, 15, 15) title:nil titleFont:nil titleColor:nil backgroundColor:nil image:[UIImage imageNamed:@"img_arrow_left_22"] backgroundImage:nil];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    [backBtn baseButtonActionWithBlock:^(UIButton *button) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    BaseButton * registerBtn = [BaseButton baseButtonWithFrame:CGRectMake(0, 0, 10, 10) title:@"注册" titleFont: [UIFont systemFontOfSize:FONTSIZE_14] titleColor:[UIColor redColor] backgroundColor:nil image:nil backgroundImage:nil];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:registerBtn];
    [registerBtn baseButtonActionWithBlock:^(UIButton *button) {
        RegisterVC * registerVC = [[RegisterVC alloc]init];
        [weakSelf.navigationController pushViewController:registerVC animated:YES];
    }];
    [self.mainView.forgotBtn baseButtonActionWithBlock:^(UIButton *button) {
        ForgotVC * forgotVC = [[ForgotVC alloc]init];
        [weakSelf.navigationController pushViewController:forgotVC animated:YES];
    }];
    [self.mainView.loginBtn baseButtonActionWithBlock:^(UIButton *button) {
        [Tools MsgBox:@"登录"];
    }];
}

- (void)initConfig {
    self.navigationItem.title = @"用户登录";
}

- (LoginMainView *)mainView {
    if (!_mainView) {
        _mainView  = [[LoginMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT)];
    }
    return _mainView;
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
        UIImage * image = [UIImage imageNamed:nil];
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
