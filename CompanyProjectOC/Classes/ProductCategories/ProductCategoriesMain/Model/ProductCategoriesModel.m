//
//  ProductCategoriesModel.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "ProductCategoriesModel.h"

@implementation ProductCategoriesModel

@end

@implementation ProductParentCategoriesModel

@end

@implementation ProductChildSectionCategoriesModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"category":[ProductChildItemCategoriesModel class]
        };
}


@end

@implementation ProductChildItemCategoriesModel

@end
