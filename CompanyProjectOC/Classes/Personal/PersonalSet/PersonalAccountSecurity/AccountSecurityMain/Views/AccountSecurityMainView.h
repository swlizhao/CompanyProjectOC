//
//  AccountSecurityMainView.h
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseView.h"
#import "AccountSecurityMainViewCell.h"
@interface AccountSecurityMainView : BaseView <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSources;
@end
