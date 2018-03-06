//
//  ProductCategoriesMainView.h
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseView.h"
#import "ProductCategoryLeftTableViewCell.h"
#import "ProductCategoryRightCollectionViewCell.h"
#import "ProductChildHeaderView.h"
@interface ProductCategoriesMainView : BaseView <UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UITableView * leftTableView;
@property(nonatomic,strong)BaseCollectionView * rightCollectionView;

@property(nonatomic,strong)NSMutableArray * parentCategoryDatas;

@property(nonatomic,strong)NSMutableArray * childSectionCategotyDatas;

@end
