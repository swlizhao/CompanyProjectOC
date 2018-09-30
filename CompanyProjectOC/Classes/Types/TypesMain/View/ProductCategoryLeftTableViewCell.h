//
//  ProductCategoryLeftTableViewCell.h
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "ProductCategoriesModel.h"
static NSString * productCategoryLeftTableViewCell = @"ProductCategoryLeftTableViewCell";
@interface ProductCategoryLeftTableViewCell : BaseTableViewCell

@property(nonatomic,strong)ProductParentCategoriesModel * model;

@end
