//
//  AddressListMainView.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "AddressListMainView.h"

@implementation AddressListMainView

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
    return _dataSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressListCell * cell = [tableView dequeueReusableCellWithIdentifier:addressListCell];
    if (!cell) {
        cell = [[AddressListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addressListCell];
    }
    if (_dataSources.count > 0){
        WeakSelf(weakSelf)
        AddressListModel * model = _dataSources[indexPath.section];
        cell.model = model;
        cell.baseTableViewCellButtonClickBlock = ^(UIButton *button) {
            if (weakSelf.baseViewTableViewCellBtnAndIndexPathSenderBlock) {
                weakSelf.baseViewTableViewCellBtnAndIndexPathSenderBlock(button ,indexPath);
            }
        };
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressListModel * listModel = _dataSources[indexPath.section];
    return [tableView cellHeightForIndexPath:indexPath model:listModel keyPath:@"model" cellClass:[AddressListCell class] contentViewWidth:SCREEN_WIDTH];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - 初始化视图
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedSectionHeaderHeight = 10;
    }
    return _tableView;
}

@end
