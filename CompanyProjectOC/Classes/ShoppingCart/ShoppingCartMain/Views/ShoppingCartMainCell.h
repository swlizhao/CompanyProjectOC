//
//  ShoppingCartMainCell.h
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "ShoppingCartMainModel.h"
static NSString * shoppingCartMainCell = @"ShoppingCartMainCell";
@interface ShoppingCartMainCell : BaseTableViewCell

/**
 *  @param productModel: Cell界面赋值  返回cell高度key使用此值
 */
@property(nonatomic,strong)ShoppingCartProductModel * productModel;

@end
