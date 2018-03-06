//
//  AccountSecurityMainViewCell.h
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "AccountSecurityListModel.h"
static NSString * accountSecurityMainViewCell = @"AccountSecurityMainViewCell";
@interface AccountSecurityMainViewCell : BaseTableViewCell

@property(nonatomic,strong)AccountSecurityListModel * model;

@end
