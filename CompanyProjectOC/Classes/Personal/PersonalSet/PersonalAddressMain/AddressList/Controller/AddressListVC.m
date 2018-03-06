//
//  AddressListVC.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "AddressListVC.h"
#import "LZAdd.h"
#import "AddressListMainView.h"
@interface AddressListVC ()

@property(nonatomic,strong)LZAdd * addView;
@property(nonatomic,strong)AddressListMainView * mainView;
@property(nonatomic,strong)NSMutableArray * dataSources;
@end

@implementation AddressListVC

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
    [self initAddressListFromServer];
}

- (void)setup {
    [self.view addSubview:self.addView];
    [self.view addSubview:self.mainView];
}

- (void)initConfig {
    self.navigationItem.title = @"地址管理";
    WeakSelf(weakSelf)
    self.addView.lzAddBtnClickedBlock = ^(UIButton *button) {
        UIViewController * vc = [[NSClassFromString(@"AddAddressVC") alloc]init];
         vc.navigationItem.title = @"新建收货人";
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    self.mainView.baseViewTableViewCellBtnAndIndexPathSenderBlock = ^(UIButton *button, NSIndexPath *indexPath) {
        [weakSelf tableViewCellBtnActionWihtIndexPath:indexPath button:button];
    };
}

#pragma mark - tableViewCellBtnAction
- (void)tableViewCellBtnActionWihtIndexPath:(NSIndexPath *)indexPath button:(UIButton *)button {
    NSLog(@"btnTag:%ld -- section:%ld row:%ld",button.tag , indexPath.section ,indexPath.row);
    if (button.tag == 10000) {
        [self tableViewCellSelectStatusWithIndexPath:indexPath];
    }else if (button.tag == 10001) {
        [self tableViewCellEditActionWithIndexPath:indexPath];
    }else if (button.tag == 10002) {
        [self tableViewCellDeleActionWithIndexPath:indexPath];
    }else{}
}

- (void)tableViewCellSelectStatusWithIndexPath:(NSIndexPath *)indexPath {
        [self initDefaultDataToServerWithIndexPath:indexPath];
}

- (void)tableViewCellEditActionWithIndexPath:(NSIndexPath *)indexPath {
    UIViewController * vc = [[NSClassFromString(@"AddAddressVC") alloc]init];
    vc.navigationItem.title = @"编辑收货人";
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)tableViewCellDeleActionWithIndexPath:(NSIndexPath *)indexPath {
    [Tools MsgBox:[NSString stringWithFormat:@"删除第%ld条数据",indexPath.section]];
}


#pragma mark - 初始化视图
- (AddressListMainView *)mainView {
    if (!_mainView) {
        _mainView = [[AddressListMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT - 50)];
        _mainView.backgroundColor = RGB(245, 245, 245);
    }
    return _mainView;
}

- (LZAdd *)addView {
    if (!_addView) {
        _addView = [[LZAdd alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)];
        _addView.backgroundColor = [UIColor redColor];
        _addView.titleString = @"新建地址";
        _addView.titleColor = [UIColor whiteColor];
        _addView.titleFont = [UIFont systemFontOfSize:FONTSIZE_16];
    }
    return _addView;
}

#pragma mark - 获取地址列表
- (void)initAddressListFromServer {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"AddressListData" ofType:@"json"];
    NSData * responseObject = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    NSDictionary * result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
    NSArray * array = result[@"data"];
    
    for (int i = 0; i < array.count; i++) {
        NSDictionary * dict = [array objectAtIndex:i];
        AddressListModel * model = [AddressListModel modelWithDictionary:dict];
        [self.dataSources addObject:model];
    }
    self.mainView.dataSources = self.dataSources;
}

#pragma mark - 设置选中数据为默认
- (void)initDefaultDataToServerWithIndexPath:(NSIndexPath *)indexPath {
    AddressListModel * currentModel = self.dataSources[indexPath.section];
    if ([currentModel.defaultStatus isEqualToString:@"0"]) {
        currentModel.defaultStatus = @"1";
        for (int i = 0; i < self.dataSources.count; i++) {
            AddressListModel * model = self.dataSources[i];
            if (model != currentModel) {
                if ([model.defaultStatus isEqualToString:@"1"]) {
                    model.defaultStatus = @"0";
                }
            }
        }
        self.mainView.dataSources = self.dataSources;
    }
}

@end
