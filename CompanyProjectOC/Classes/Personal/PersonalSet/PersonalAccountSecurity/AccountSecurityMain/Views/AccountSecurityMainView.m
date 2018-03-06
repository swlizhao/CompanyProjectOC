//
//  AccountSecurityMainView.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "AccountSecurityMainView.h"

@implementation AccountSecurityMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.tableView];
}

- (void)setDataSources:(NSMutableArray *)dataSources {
    _dataSources = dataSources;
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AccountSecurityMainViewCell * cell = [tableView dequeueReusableCellWithIdentifier:accountSecurityMainViewCell];
    if (!cell) {
        cell = [[AccountSecurityMainViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:accountSecurityMainViewCell];
    }
    if (_dataSources.count > 0) {
        AccountSecurityListModel * model = _dataSources[indexPath.row];
        cell.model = model;
        if (indexPath.row == _dataSources.count - 1) {
            cell.baseBottomLineImgView.hidden = YES;
        }else {
            cell.baseBottomLineImgView.hidden = NO;
        }
    }
  
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return <#param#>;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 初始化视图
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


@end
