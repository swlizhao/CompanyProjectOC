//
//  AddressListCell.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "AddressListCell.h"

@implementation AddressListCell

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
    [self layoutIfNeeded];
    [self setupAutoHeightWithBottomView:self.baseWarningLabel bottomMargin:10];
    [self.baseButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.baseEditButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.baseDetailButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    /*
      self.baseTextLabel   名字
      self.baseWarningLabel： 设为默认
      self.baseDetailTextLabel 地址信息
      self.baseOldPriceLabel   删除
      self.baseArrowImgView   删除图片
      self.basePriceLabel     编辑
      self.baseDetailImgView  编辑图片
    */
}

- (void)initConfig {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.baseBottomLineImgView.backgroundColor = RGBA(0, 0, 0, 0.2);
    self.baseDetailTextLabel.numberOfLines = 0;
    self.baseTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_16];
    self.basePhoneLabel.font = [UIFont systemFontOfSize:FONTSIZE_16];
    self.baseDetailTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_13];
    self.baseWarningLabel.font = [UIFont systemFontOfSize:FONTSIZE_13];
    self.baseWarningLabel.text = @"设为默认";
    self.baseButton.tag = 10000;
    self.baseEditButton.tag = 10001;
    self.baseDetailButton.tag = 10002;
    self.baseOldPriceLabel.font = [UIFont systemFontOfSize:FONTSIZE_13];
    self.baseOldPriceLabel.text = @"删除";
    self.baseArrowImgView.image = [UIImage imageNamed:@"img_trash"];
    self.basePriceLabel.font = [UIFont systemFontOfSize:FONTSIZE_13];
    self.basePriceLabel.text = @"编辑";
    self.baseDetailImgView.image = [UIImage imageNamed:@"img_edit"];
}

#pragma mark - 赋值
- (void)setModel:(AddressListModel *)model {
    if (_model != model) {
        _model = model;
    }
    self.baseTextLabel.text = _model.name;
    self.basePhoneLabel.text = _model.phone;
    self.baseDetailTextLabel.text = _model.address;
    if ([_model.defaultStatus isEqualToString:@"0"]) {
        self.baseStatusImgView.image = [UIImage imageNamed:@"img_shoppingCart_noSelect"];
    }else {
        self.baseStatusImgView.image = [UIImage imageNamed:@"img_shoppingCart_select"];
    }
}

- (void)btnAction:(UIButton *)button {
    if (self.baseTableViewCellButtonClickBlock) {
        self.baseTableViewCellButtonClickBlock(button);
    }
}

- (void)updateConstraints {
    [self.baseTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.width.equalTo(@120);
    }];
    [self.basePhoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.baseTextLabel.mas_centerY);
    }];
    [self.baseDetailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseTextLabel.mas_bottom).offset(15);
        make.left.equalTo(self.baseTextLabel.mas_left).offset(0);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    [self.baseBottomLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseDetailTextLabel.mas_bottom).offset(15);
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.height.equalTo(@0.5);
    }];
    [self.baseStatusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.top.equalTo(self.baseBottomLineImgView.mas_bottom).offset(10);
        make.width.height.equalTo(@20);
    }];
    [self.baseWarningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.baseStatusImgView.mas_centerY);
        make.left.equalTo(self.baseStatusImgView.mas_right).offset(5);
    }];
    [self.baseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseStatusImgView.mas_top);
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.baseWarningLabel.mas_centerX).offset(0);
        make.bottom.equalTo(self.baseStatusImgView.mas_bottom).offset(5);
    }];
    
    [self.baseOldPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.baseStatusImgView.mas_centerY);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    [self.baseArrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.baseOldPriceLabel.mas_centerY);
        make.right.equalTo(self.baseOldPriceLabel.mas_left).offset(-2);
        make.width.height.equalTo(@20);
    }];
    [self.basePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.baseStatusImgView.mas_centerY);
        make.right.equalTo(self.baseArrowImgView.mas_left).offset(-15);
    }];
    [self.baseDetailImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.baseOldPriceLabel.mas_centerY);
        make.right.equalTo(self.basePriceLabel.mas_left).offset(-3);
        make.width.height.equalTo(@18);
    }];
    [self.baseDetailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-5);
        make.top.equalTo(self.baseArrowImgView.mas_top);
        make.left.equalTo(self.baseArrowImgView.mas_left).offset(0);
        make.bottom.equalTo(self.baseArrowImgView.mas_bottom).offset(5);
    }];
    [self.baseEditButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.basePriceLabel.mas_right).offset(0);
        make.top.equalTo(self.baseArrowImgView.mas_top);
        make.left.equalTo(self.baseDetailImgView.mas_left).offset(0);
        make.bottom.equalTo(self.baseArrowImgView.mas_bottom).offset(5);
    }];

    [super updateConstraints];
}

@end
