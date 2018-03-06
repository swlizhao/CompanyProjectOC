//
//  AddressListModel.h
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseModel.h"

@interface AddressListModel : BaseModel

@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * phone;
@property(nonatomic,copy)NSString * address;
@property(nonatomic,copy)NSString * userID;
@property(nonatomic,copy)NSString * addressID;
@property(nonatomic,copy)NSString * defaultStatus;
@end
