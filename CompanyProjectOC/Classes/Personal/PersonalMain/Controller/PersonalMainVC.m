//
//  PersonalMainVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "PersonalMainVC.h"
#import "PersonalMainView.h"
#import "LZNavView.h"
#import "PersonalSettingVC.h"
#import "MessageMainVC.h"
#import "PersonalOrderBaseVC.h"
@interface PersonalMainVC ()

@property(nonatomic,strong)LZNavView * navView;
@property(nonatomic,strong)PersonalMainView * mainView;
@property(nonatomic,strong)NSMutableArray * dataSources;
@property(nonatomic,strong)NSMutableArray * orderDataSources;
@property(nonatomic,strong)NSArray * classNames;
@end

@implementation PersonalMainVC

- (NSArray *)classNames {
    if (!_classNames) {
        _classNames = [NSArray arrayWithObjects:@"PersonalWalletVC",@"PersonalVouchersBaseVC",@"PersonalCollectionBaseVC",@"PersonalHistoryVC",@"PersonalIntegralVC",@"",nil];
    }
    return _classNames;
}

- (NSMutableArray *)dataSources {
    if (!_dataSources) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}

- (NSMutableArray *)orderDataSources {
    if (!_orderDataSources) {
        _orderDataSources = [NSMutableArray array];
    }
    return _orderDataSources;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
   [super viewWillDisappear:animated];
   self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self initConfig];
    [self initOrderDataFromServer];
}

- (void)setup {
    [self.view addSubview:self.mainView];
    [self.view addSubview:self.navView];
}

- (void)initConfig {
    self.navView.titleString = @"个人中心";
    WeakSelf(weakSelf)
    _navView.btnTypeBlock = ^(UIButton *button) {
        [weakSelf navViewBtnSender:button];
    };
    _mainView.scrollViewDidScrollNavColorAlphaBlock = ^(UIScrollView *scrollView, CGFloat colorAlphaRadio) {
        weakSelf.navView.colorAlpha = colorAlphaRadio;
    };
    _mainView.baseViewButtonSenderBlock = ^(UIButton *button) {
        [weakSelf orderItemClickedWithButton:button];
    };
    _mainView.baseViewTableViewSectionViewBtnAndSectionBlock = ^(UIButton *button, NSInteger section) {
        [weakSelf tableViewSectionBtnClickedWithSection:section button:button];
    };
    _mainView.headViewBtnType = ^(UIButton *button) {
        [weakSelf tableViewHeadViewActionWithBtn:button];
    };
}

- (void)tableViewHeadViewActionWithBtn:(UIButton *)button {
    dispatch_async(dispatch_get_main_queue(), ^{
      LoginVC * loginVC = [[LoginVC alloc]init];
      BaseNavigationController * loginNC = [[BaseNavigationController alloc]initWithRootViewController:loginVC];
      [self  presentViewController:loginNC animated:YES completion:nil];
    });
}

#pragma mark - tableViewSectionBtnClicked
- (void)tableViewSectionBtnClickedWithSection:(NSInteger)section button:(UIButton *)button {
    if (section == 0) {
        PersonalOrderBaseVC * orderBaseVC = [[PersonalOrderBaseVC alloc]init];
        [self.navigationController pushViewController:orderBaseVC animated:YES];
    }
}

#pragma mark - orderClicked
- (void)orderItemClickedWithButton:(UIButton *)button {
    NSInteger selectIndex = button.tag - 100;
    PersonalOrderBaseVC * orderBaseVC = [[PersonalOrderBaseVC alloc]init];
    orderBaseVC.defaultSelectedControllerIndex = selectIndex + 1;
    [self.navigationController pushViewController:orderBaseVC animated:YES];
}

#pragma mark -  mainViewSender
- (void)mainViewTableViewRowSelectWithIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.classNames.count - 1) {
        [Tools MsgBox:@"分享app"];
    }else {
        UIViewController * vc = [[NSClassFromString(self.classNames[indexPath.row]) alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - navViewSender
- (void)navViewBtnSender:(UIButton *)button {
    if (button.tag == 100000) {
        MessageMainVC * msgVC = [[MessageMainVC alloc]init];
        [self.navigationController pushViewController:msgVC animated:YES];
    }
    if (button.tag == 100001) {
        PersonalSettingVC * setVC = [[PersonalSettingVC alloc]init];
        [self.navigationController pushViewController:setVC animated:YES];
    }
}

#pragma mark- 初始化视图
- (LZNavView *)navView {
    if (!_navView) {
        _navView = [[LZNavView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_NAVIGATION_BAR_HEIGHT)];
        _navView.leftImgString = @"img_msg_white";
        _navView.highLeftImgString = @"img_msg_high";
        _navView.rightImgString = @"img_set_white";
        _navView.highRightImgString = @"img_set_high";
        _navView.titleString = @"英雄联盟";
        _navView.titleColor = [UIColor whiteColor];
        _navView.highTitleColor = RGB(18, 150, 219);
    }
    return _navView;
}

- (PersonalMainView *)mainView {
    if (!_mainView) {
        WeakSelf(weakSelf)
        _mainView = [[PersonalMainView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, SCREEN_HEIGHT - TAB_BAR_HEIGHT)];
        _mainView.backgroundColor = RGB(245, 245, 245);
        _mainView.baseViewTableViewSelectRowSenderBlock = ^(NSIndexPath *indexPath) {
            [weakSelf mainViewTableViewRowSelectWithIndexPath:indexPath];
        };
    }
    return _mainView;
}

#pragma mark - 获取服务器数据
- (void)initOrderDataFromServer {
    NSArray * orderDatas = @[
                             @{
                                 @"img":@"img_noPay",
                                 @"title":@"待付款",
                                 @"badge":@"3"
                                 },
                             @{
                                 @"img":@"img_sendGoods",
                                 @"title":@"待发货",
                                 @"badge":@"2"
                                 },
                             @{
                                 @"img":@"img_receivedGoods",
                                 @"title":@"待收货",
                                 @"badge":@"5"
                                 },
                             @{
                                 @"img":@"img_evaluation",
                                 @"title":@"待评价",
                                 @"badge":@"20"
                                 },
                             @{
                                 @"img":@"img_shouhou",
                                 @"title":@"退款/售后",
                                 @"badge":@"1"
                                 }
                             ];
    for (NSDictionary * dict in orderDatas) {
        LZOrderModel * model = [LZOrderModel new];
        model.title = dict[@"title"];
        model.imageName = dict[@"img"];
        model.badge = dict[@"badge"];
        [self.orderDataSources addObject:model];
    }
    self.mainView.orderDatas = self.orderDataSources;
    NSString * jsonPath = [[NSBundle mainBundle]pathForResource:@"PersonalMainDatas" ofType:@"json"];
    NSData * responseObject = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    NSDictionary * result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
    NSArray * arr = result[@"data"];
    for (int i = 0; i < arr.count; i++) {
        NSDictionary * dict = [arr objectAtIndex:i];
        PersonalMainModel * model = [PersonalMainModel modelWithDictionary:dict];
        [self.dataSources addObject:model];
    }
    self.mainView.datas = self.dataSources;
    
}


@end
