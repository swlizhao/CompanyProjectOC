//
//  AccountSecurityMainViewCell.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "AccountSecurityMainViewCell.h"

@implementation AccountSecurityMainViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
        [self initConfig];
    }
    return self;
}

- (void)initUI {
    [self setNeedsUpdateConstraints];
}

- (void)initConfig {
    self.baseBottomLineImgView.backgroundColor = RGBA(0, 0, 0, 0.2);
    self.baseTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_14];
}

- (void)setModel:(AccountSecurityListModel *)model {
    if (_model != model) {
        _model = model;
    }
    self.baseTextLabel.text = _model.name;
}

- (void)updateConstraints {
    [self.baseTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    [self.baseBottomLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
        make.height.equalTo(@0.5);
    }];
    [super updateConstraints];
}

@end
