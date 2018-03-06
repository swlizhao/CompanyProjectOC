//
//  ProductCategoriesMainVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "ProductCategoriesMainVC.h"
#import "ProductCategoriesMainView.h"
@interface ProductCategoriesMainVC ()

@property(nonatomic,strong)ProductCategoriesMainView * mainView;
@property(nonatomic,strong)NSMutableArray * parentCategoryArray;
@property(nonatomic,strong)NSMutableArray * childCategoryArray;

@end

@implementation ProductCategoriesMainVC

- (NSMutableArray *)parentCategoryArray {
    if (!_parentCategoryArray) {
        _parentCategoryArray = [NSMutableArray array];
    }
    return _parentCategoryArray;
}

- (NSMutableArray *)childCategoryArray {
    if (!_childCategoryArray) {
        _childCategoryArray = [NSMutableArray array];
    }
    return _childCategoryArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self initConfig];
    [self initParentCategotyDataFromServer];
    [self initChildCategoryDataFromServer];
}


- (void)setup {
    [self.view addSubview:self.mainView];
}

- (void)initConfig {
    self.navigationItem.title = @"分类";
    self.mainView.backgroundColor = RGB(245, 245, 245);
    WeakSelf(weakSelf)
    self.mainView.baseViewTableViewSelectRowSenderBlock = ^(NSIndexPath *indexPath) {
        [weakSelf leftTableViewDidSelectRowWithIndexPath:indexPath];
    };
    self.mainView.baseViewCollectionViewSectionBtnAndIndexPathBlock = ^(UIButton *button, NSIndexPath *indexPath) {
        [weakSelf collectionViewSectionBtnActionWithButton:button indexPath:indexPath];
    };
    self.mainView.baseViewCollectionViewDidSelectItemSenderBlock = ^(NSIndexPath *indexPath) {
        [weakSelf collectionViewItemSelectWithIndexPath:indexPath];
    };
}

#pragma mark - 左边视图点击cell
- (void)leftTableViewDidSelectRowWithIndexPath:(NSIndexPath *)indexPath {
    ProductParentCategoriesModel * currentParentModel = _parentCategoryArray[indexPath.row];
    if (currentParentModel.cellSelectStatus == 0) {
        currentParentModel.cellSelectStatus = 1;
        for (int i = 0; i < self.parentCategoryArray.count; i++) {
            ProductParentCategoriesModel * parentModel = _parentCategoryArray[i];
            if (parentModel != currentParentModel) {
                parentModel.cellSelectStatus = 0;
            }
        }
        self.mainView.parentCategoryDatas = self.parentCategoryArray;
        [self.childCategoryArray removeAllObjects];
        self.mainView.childSectionCategotyDatas = self.childCategoryArray;
        [SVProgressHUD showWithStatus:@"加载中..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
           [self initChildCategoryDataFromServer];
        });
        
    }
   
}

#pragma mark - collectionView Section Button 点击事件
- (void)collectionViewSectionBtnActionWithButton:(UIButton *)button indexPath:(NSIndexPath *)indexPath {
    [Tools MsgBox:[NSString stringWithFormat:@"分区%ld",indexPath.section]];
}

#pragma mark - collectionView Item Select
- (void)collectionViewItemSelectWithIndexPath:(NSIndexPath *)indexPath {
    [Tools MsgBox:[NSString stringWithFormat:@"section：%ld  item:%ld",indexPath.section ,indexPath.row]];
}

#pragma mark - 初始化视图
- (ProductCategoriesMainView *)mainView {
    if (!_mainView) {
        _mainView = [[ProductCategoriesMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT)];
    }
    return _mainView;
}

#pragma mark - 获取服务器数据
- (void)initParentCategotyDataFromServer {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"ParentCategory" ofType:@"json"];
    NSData * responseObject = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    NSDictionary * result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
    NSArray * array = result[@"data"];
    for (int i = 0; i < array.count; i++) {
        NSDictionary * dict =  [array objectAtIndex:i];
        ProductParentCategoriesModel * model = [ProductParentCategoriesModel modelWithDictionary:dict];
        if (i == 0) {
            model.cellSelectStatus = 1;
        }
        [self.parentCategoryArray addObject:model];
    }
    self.mainView.parentCategoryDatas = self.parentCategoryArray;
}

- (void)initChildCategoryDataFromServer {
    NSString * jsonPath = [[NSBundle mainBundle] pathForResource:@"ChildCategory" ofType:@"json"];
    NSData * responseObject = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    NSDictionary * result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
    NSArray * array = result[@"data"];
    if (self.childCategoryArray.count != 0) {
        [self.childCategoryArray removeAllObjects];
    }
    for (int i = 0; i <array.count ; i++) {
        NSDictionary * dict =  [array objectAtIndex:i];
        ProductChildSectionCategoriesModel * sectionModel = [ProductChildSectionCategoriesModel modelWithDictionary:dict];
        [self.childCategoryArray addObject:sectionModel];
    }
    self.mainView.childSectionCategotyDatas = self.childCategoryArray;
}


@end
