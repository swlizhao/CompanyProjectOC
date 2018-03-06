//
//  PersonalMainCell.h
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "PersonalMainModel.h"
static NSString * personalMainCell = @"PersonalMainCell";
@interface PersonalMainCell : BaseTableViewCell

@property(nonatomic,strong)PersonalMainModel * model;

@end
