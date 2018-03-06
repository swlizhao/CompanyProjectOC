//
//  ShoppingCartMainModel.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "ShoppingCartMainModel.h"

@implementation ShoppingCartMainModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"shoppingCart": [ShoppingCartShopModel class],
             @"moreProduct" : [ShoppingCartMoreProductModel class]
             };
}

@end


@implementation ShoppingCartShopModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{@"productList" : [ShoppingCartProductModel class]};
}


@end


@implementation ShoppingCartProductModel

@end


@implementation ShoppingCartMoreProductModel

@end


