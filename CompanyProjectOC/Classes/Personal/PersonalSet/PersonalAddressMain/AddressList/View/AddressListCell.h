//
//  AddressListCell.h
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "AddressListModel.h"
static NSString * addressListCell = @"AddressListCell";

@interface AddressListCell : BaseTableViewCell

@property(nonatomic,strong)AddressListModel * model;

@end
