//
//  ProductCategoryRightCollectionViewCell.h
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "ProductCategoriesModel.h"
static NSString * productCategoryRightCollectionViewCell = @"ProductCategoryRightCollectionViewCell";
@interface ProductCategoryRightCollectionViewCell : BaseCollectionViewCell

@property(nonatomic,strong)ProductChildItemCategoriesModel * model;

@end
