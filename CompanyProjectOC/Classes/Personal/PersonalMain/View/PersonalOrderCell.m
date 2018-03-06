//
//  PersonalOrderCell.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "PersonalOrderCell.h"

@implementation PersonalOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
        [self initConfig];
    }
    return self;
}

- (void)initUI {
    [self.contentView addSubview:self.orderView];
    [self setNeedsUpdateConstraints];
}

- (void)initConfig {
    WeakSelf(weakSelf)
    self.orderView.btnClickedBlock = ^(UIButton *button) {
        if (weakSelf.baseTableViewCellButtonClickBlock) {
            weakSelf.baseTableViewCellButtonClickBlock(button);
        }
    };
}

- (void)setOrderdatas:(NSMutableArray *)orderdatas {
    if (_orderdatas != orderdatas) {
        _orderdatas = orderdatas;
    }
    _orderView.itemDatas = _orderdatas;
}

- (LZOrderView *)orderView {
    if (!_orderView) {
        _orderView = [[LZOrderView alloc]init];
        _orderView.itemCount = 5;
    }
    return _orderView;
}

- (void)updateConstraints {
    [_orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [super updateConstraints];
}


@end
