//
//  PersonalMainCell.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "PersonalMainCell.h"

@implementation PersonalMainCell

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
    self.baseTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_14];
    self.baseBottomLineImgView.backgroundColor = RGBA(0, 0, 0, 0.1);
    self.baseArrowImgView.image = [UIImage imageNamed:@"img_arrow_right_16"];
}

#pragma mark - 管理赋值
- (void)setModel:(PersonalMainModel *)model {
    if (_model != model) {
        _model = model;
    }
    self.baseTextLabel.text = _model.title;
    self.baseImgView.image = [UIImage imageNamed:_model.img];
}

- (void)updateConstraints {
    [self.baseImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
        make.width.height.equalTo(@26);
    }];
    [self.baseTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.baseImgView.mas_right).offset(10);
        make.centerY.equalTo(self.baseImgView.mas_centerY);
    }];
    [self.baseArrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-5);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.height.equalTo(@15);
    }];
    [self.baseBottomLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
        make.height.equalTo(@0.5);
    }];
    [super updateConstraints];
}

@end
