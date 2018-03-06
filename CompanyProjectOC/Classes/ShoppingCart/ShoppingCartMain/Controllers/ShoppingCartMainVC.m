//
//  ShoppingCartMainVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "ShoppingCartMainVC.h"
#import "ShoppingCartMainView.h"
@interface ShoppingCartMainVC ()

@property(nonatomic,strong)UIButton * managerBtn;
@property(nonatomic,strong)ShoppingCartMainView * mainView;
@property(nonatomic,strong)ShoppingCartMainModel * shoppingCartModel;

@end

@implementation ShoppingCartMainVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self  initShoppingListDataFromServer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self initConfig];
}

- (void)setup {
    [self.view addSubview:self.mainView];
    _managerBtn = [self creatRightManagerBtn];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:_managerBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)initConfig {
    self.mainView.backgroundColor = RGB(240, 240, 240);
    self.navigationItem.title = @"购物车";
}

#pragma mark - 创建导航按钮
- (UIButton *)creatRightManagerBtn {
    UIButton * button = [UIButton buttonWithType:0];
    [button setTitle:@"管理" forState:0];
    button.titleLabel.font = [UIFont systemFontOfSize:FONTSIZE_15];
    [button setTitleColor:[UIColor redColor] forState:0];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)btnAction:(UIButton *)button {
    NSLog(@"我被点击了...");
}

#pragma mark - 初始化视图
- (ShoppingCartMainView *)mainView {
    if (!_mainView) {
        _mainView = [[ShoppingCartMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT)];
        _mainView.parentVC = self;
    }
    return _mainView;
}

#pragma mark - 从服务器获取购物车数据
- (void)initShoppingListDataFromServer {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"shoppingCart" ofType:@"json"];
    NSData * responseObject = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    NSDictionary * result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
    NSDictionary * shoppingCartDic = [result objectForKey:@"data"];
    ShoppingCartMainModel * shoppingCartModel = [ShoppingCartMainModel modelWithDictionary:shoppingCartDic];
    _shoppingCartModel = shoppingCartModel;
    self.mainView.shoppingCartModel = _shoppingCartModel;
}



@end
