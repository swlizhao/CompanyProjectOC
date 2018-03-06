//
//  PersonalSetMainCell.h
//  CompanyProjectOC
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "PersonalSettingMainModel.h"
static NSString * personalSetMainCell = @"PersonalSetMainCell";
@interface PersonalSetMainCell : BaseTableViewCell

@property(nonatomic,strong)PersonalSettingMainModel * model;

@end
