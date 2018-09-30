//
//  ProductChildHeaderView.h
//  CompanyProjectOC
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseCollectionReusableView.h"
#import "ProductCategoriesModel.h"
static NSString * productChildHeaderView = @"ProductChildHeaderView";
@interface ProductChildHeaderView : BaseCollectionReusableView
@property(nonatomic,strong)ProductChildSectionCategoriesModel * sectionModel;

@end
