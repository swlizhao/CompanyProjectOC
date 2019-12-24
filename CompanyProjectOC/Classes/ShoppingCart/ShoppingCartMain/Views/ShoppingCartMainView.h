//
//  ShoppingCartMainView.h
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseView.h"
#import "ShoppingCartSectionView.h"
#import "ShoppingCartMainCell.h"
#import "ShoppingCartMoreCell.h"
#import "BaseTableView.h"
@class ShoppingCartMainVC;
@interface ShoppingCartMainView : BaseView <UITableViewDelegate ,UITableViewDataSource,FSPageContentViewDelegate>

@property(nonatomic,strong)BaseTableView * shoppingTableView;
@property(nonatomic,strong)ShoppingCartMainVC * parentVC;
@property(nonatomic,strong)ShoppingCartMainModel * shoppingCartModel;
@property (nonatomic,assign)BOOL canScroll;



@end
