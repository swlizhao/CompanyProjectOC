//
//  ShoppingCartMoreCell.h
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "FSPageContentView.h"
#import "LZScrollContentViewController.h"
static NSString * shoppingCartMoreCell = @"ShoppingCartMoreCell";

@interface ShoppingCartMoreCell : BaseTableViewCell

@property(nonatomic,strong)FSPageContentView * pageContentView;
@property(nonatomic,strong)NSMutableArray * viewControllers;
@property(nonatomic,assign)BOOL cellCanScroll; //子视图是否能滑动，YES - 可以 NO - 不可以滑动

@end
