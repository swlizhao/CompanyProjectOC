//
//  PersonalSetMainView.h
//  CompanyProjectOC
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseView.h"
#import "PersonalSetMainCell.h"
@interface PersonalSetMainView : BaseView

@property(nonatomic,strong)BaseTableView * tableView;

@property(nonatomic,strong)NSMutableArray * setDatas;

@end
