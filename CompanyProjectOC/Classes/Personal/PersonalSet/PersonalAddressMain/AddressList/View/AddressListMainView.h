//
//  AddressListMainView.h
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseView.h"
#import "AddressListCell.h"
@interface AddressListMainView : BaseView <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSources;

@end
