//
//  ShoppingCartMainModel.h
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseModel.h"

@class ShoppingCartShopModel , ShoppingCartProductModel,ShoppingCartMoreProductModel;

@interface ShoppingCartMainModel : BaseModel

@property(nonatomic,copy)NSString * userID;
@property(nonatomic,copy)NSString * desc;
@property(nonatomic,strong)NSArray <ShoppingCartShopModel *> * shoppingCart;
@property(nonatomic,strong)NSArray <ShoppingCartMoreProductModel *> * moreProduct;

@end

@interface ShoppingCartShopModel : BaseModel

@property(nonatomic,copy)NSString * shopName;
@property(nonatomic,copy)NSString * shopID;
@property(nonatomic,copy)NSString * shopURL;
@property(nonatomic,strong)NSArray <ShoppingCartProductModel * > * productList;
@property(nonatomic,assign)NSInteger sectionSelect;

@end

@interface  ShoppingCartProductModel : BaseModel

@property(nonatomic,copy)NSString * productName;
@property(nonatomic,copy)NSString * productID;
@property(nonatomic,copy)NSString * productURL;
@property(nonatomic,copy)NSString * productPrice;
@property(nonatomic,copy)NSString * productBuyNum;
@property(nonatomic,copy)NSString * productTotalCount;
@property(nonatomic,copy)NSString * productDes;
@property(nonatomic,assign)NSInteger  cellSelectStatus;

@end

@interface  ShoppingCartMoreProductModel : BaseModel

@property(nonatomic,copy)NSString * type;
@property(nonatomic,copy)NSString * shopName;
@property(nonatomic,copy)NSString * shopID;
@property(nonatomic,copy)NSString * productName;
@property(nonatomic,copy)NSString * productID;
@property(nonatomic,copy)NSString * productURL;
@property(nonatomic,copy)NSString * productPrice;
@property(nonatomic,copy)NSString * productBuyNum;
@property(nonatomic,copy)NSString * productTotalCount;

@end
