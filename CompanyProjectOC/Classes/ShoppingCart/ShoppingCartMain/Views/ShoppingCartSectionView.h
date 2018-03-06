//
//  ShoppingCartSectionView.h
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseTableViewHeaderFooterView.h"
#import "ShoppingCartMainModel.h"

static NSString * shoppingCartSectionView = @"ShoppingCartSectionView";
@interface ShoppingCartSectionView : BaseTableViewHeaderFooterView

@property(nonatomic,strong)ShoppingCartShopModel * shopModel;
@property(nonatomic,assign)BOOL isMore; //判断是否最后一个section
@end
