//
//  PersonalMainView.h
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableView.h"
#import "PersonalMainCell.h"
typedef void(^CellSelectBlk)(NSIndexPath * indexPath);

@interface PersonalMainView : UIView <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)BaseTableView * tableView;
@property(nonatomic,copy)CellSelectBlk handleCellSelectBlk;

@end
