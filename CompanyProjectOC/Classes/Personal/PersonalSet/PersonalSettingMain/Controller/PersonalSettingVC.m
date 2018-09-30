//
//  PersonalSettingVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/8.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "PersonalSettingVC.h"
#import "PersonalSetMainView.h"
#import "LZAdd.h"


@interface PersonalSettingVC ()

@property(nonatomic,strong)LZAdd * exitLoginView;
@property(nonatomic,strong)PersonalSetMainView * mainView;
@property(nonatomic,strong)NSMutableArray * dataSources;
@property(nonatomic,strong)NSArray * classNames;
@end

@implementation PersonalSettingVC

- (NSArray *)classNames {
    if (!_classNames) {
        _classNames = [NSArray arrayWithObjects:@"AccountSecurityMainVC",@"AddressListVC",@"2",@"3" ,@"4",nil];
    }
    return _classNames;
}

- (NSMutableArray *)dataSources {
    if (!_dataSources) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self initConfig];
    [self initSettingData];
}

- (void)setup {
    [self.view addSubview:self.mainView];
    [self.view addSubview:self.exitLoginView];
}

- (void)initConfig {
    WeakSelf(weakSelf)
    self.navigationItem.title = @"设置";
    self.mainView.backgroundColor = RGB(245, 245, 245);
    self.mainView.baseViewTableViewSelectRowSenderBlock = ^(NSIndexPath *indexPath) {
        [weakSelf mainViewDidSelectRowWithIndexPath:indexPath];
    };
    self.exitLoginView.lzAddBtnClickedBlock = ^(UIButton *button) {
        [weakSelf loginActionWithButton:button];
    };
}

- (void)loginActionWithButton:(UIButton *)button {
    [Tools MsgBox:@"退出登录"];
}

- (void)mainViewDidSelectRowWithIndexPath:(NSIndexPath *)indexPath {
    UIViewController * vc = [[NSClassFromString(self.classNames[indexPath.row]) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
     
}

#pragma mark - 初始化视图
- (PersonalSetMainView *)mainView {
    if (!_mainView) {
        _mainView = [[PersonalSetMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT)];
    }
    return _mainView;
}

- (LZAdd *)exitLoginView {
    if (!_exitLoginView) {
        _exitLoginView = [[LZAdd alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - TAB_BAR_HEIGHT, SCREEN_WIDTH, TAB_BAR_HEIGHT)];
        _exitLoginView.backgroundColor = [UIColor redColor];
        _exitLoginView.titleColor = [UIColor whiteColor];
        _exitLoginView.titleFont = [UIFont systemFontOfSize:FONTSIZE_16];
        _exitLoginView.titleString = @"退出登录";
    }
    return _exitLoginView;
}

- (void)initShare {
    NSLog(@"我是分享..");
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"img_arrow_left_22"]];
//    （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        
        [ShareSDK share:SSDKPlatformTypeWechat  parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            NSLog(@"状态：%ld",(long)state);
            //状态变更回调处理
        }];
    }

}

- (void)initSettingData {
    NSString * jsonPath = [[NSBundle mainBundle]pathForResource:@"PersonalSettingData" ofType:@"json"];
    NSData * responseObject = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    NSDictionary * result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
    NSArray * array = result[@"data"];
    for (int i = 0; i< array.count; i++) {
        NSDictionary * dict = [array objectAtIndex:i];
        PersonalSettingMainModel * model = [PersonalSettingMainModel modelWithDictionary:dict];
        [self.dataSources addObject:model];
    }
    self.mainView.setDatas = self.dataSources;
}

@end
