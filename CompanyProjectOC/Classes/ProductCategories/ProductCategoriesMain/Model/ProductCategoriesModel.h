//
//  ProductCategoriesModel.h
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseModel.h"

@interface ProductCategoriesModel : BaseModel

@end

@interface ProductParentCategoriesModel : BaseModel

@property(nonatomic,copy)NSString * prodcutCategoryName;
@property(nonatomic,copy)NSString * prodcutCategoryID;
@property(nonatomic,assign)NSInteger  cellSelectStatus;

@end

@interface ProductChildSectionCategoriesModel : BaseModel

@property(nonatomic,copy)NSString * url;
@property(nonatomic,copy)NSString * typeName;
@property(nonatomic,copy)NSString * typeNameID;
@property(nonatomic,copy)NSString * typeStatus;
@property(nonatomic,strong)NSArray * category;

@end

@interface ProductChildItemCategoriesModel : BaseModel

@property(nonatomic,copy)NSString * url;
@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * classID;


@end


