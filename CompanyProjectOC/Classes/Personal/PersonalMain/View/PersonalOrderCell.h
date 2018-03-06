//
//  PersonalOrderCell.h
//  CompanyProjectOC
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "LZOrderView.h"
static NSString * personalOrderCell = @"PersonalOrderCell";
@interface PersonalOrderCell : BaseTableViewCell

@property(nonatomic,strong)LZOrderView * orderView;
@property(nonatomic,strong)NSMutableArray * orderdatas;
@end
