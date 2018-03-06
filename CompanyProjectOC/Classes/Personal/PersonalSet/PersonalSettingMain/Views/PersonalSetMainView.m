//
//  PersonalSetMainView.m
//  CompanyProjectOC
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "PersonalSetMainView.h"

@interface PersonalSetMainView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PersonalSetMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.tableView];
    [self.tableView setTableFooterView:[[UIView alloc]init]];
}

- (void)setSetDatas:(NSMutableArray *)setDatas {
    _setDatas = setDatas;
    [_tableView reloadData];
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _setDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalSetMainCell * cell = [tableView dequeueReusableCellWithIdentifier:personalSetMainCell];
    if (!cell) {
        cell = [[PersonalSetMainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalSetMainCell];
    }
    if (_setDatas.count > 0) {
        PersonalSettingMainModel * model = _setDatas[indexPath.row];
        cell.model = model;
        if (indexPath.row == _setDatas.count - 1){
            cell.baseDetailTextLabel.text = @"V1.0";
            cell.baseDetailTextLabel.hidden = NO;
        }else {
            cell.baseDetailTextLabel.hidden = YES;
        }
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.baseViewTableViewSelectRowSenderBlock) {
        self.baseViewTableViewSelectRowSenderBlock(indexPath);
    }
}

#pragma mark - 初始化视图
- (BaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[BaseTableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
