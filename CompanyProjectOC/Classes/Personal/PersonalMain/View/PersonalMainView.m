//
//  PersonalMainView.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "PersonalMainView.h"

@interface PersonalMainView () <UITableViewDelegate,UITableViewDelegate>

@end

@implementation PersonalMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)_setup {
    self.baseTableView = [self creatBaseTableView];
    [self addSubview:self.baseTableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"个人中心--->section:%ld--->row:%ld",indexPath.section,indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (BaseTableView *)creatBaseTableView {
    self.baseTableView = [[BaseTableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    return _baseTableView;
}

@end
