//
//  ShoppingCartMainCell.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "ShoppingCartMainCell.h"

@implementation ShoppingCartMainCell

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
    [self setupAutoHeightWithBottomView:self.baseBottomLineImgView bottomMargin:0.];
}

- (void)initConfig {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.baseTextLabel.numberOfLines = 2;
    self.baseDetailTextLabel.textColor = [UIColor grayColor];
    self.baseBottomLineImgView.backgroundColor = RGBA(0, 0, 0, 0.1);
    self.baseButton.tag = 10000;
    [self.baseButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.baseTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_15 * KWIDTH_SCALE];
    self.baseDetailTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_13];
    self.basePriceLabel.textColor = [UIColor redColor];
    self.basePriceLabel.font = [UIFont systemFontOfSize:FONTSIZE_13];
    self.baseBuyCountLabel.textColor = [UIColor grayColor];
    self.baseBuyCountLabel.font = [UIFont systemFontOfSize:FONTSIZE_13];
}

- (void)setProductModel:(ShoppingCartProductModel *)productModel {
    if (_productModel != productModel) {
        _productModel = productModel;
    }
    [self.baseImgView sd_setImageWithURL:[NSURL URLWithString:_productModel.productURL]];
    self.baseTextLabel.text = _productModel.productName;
    self.baseDetailTextLabel.text = _productModel.productDes;
    self.basePriceLabel.text = [NSString stringWithFormat:@"¥%@",_productModel.productPrice];
    self.baseBuyCountLabel.text = [NSString stringWithFormat:@"x%@",_productModel.productBuyNum];
    if (productModel.cellSelectStatus == 0) {
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
    [self.baseStatusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
        make.width.equalTo(@22);
        make.height.equalTo(@22);
    }];
    [self.baseImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.baseStatusImgView.mas_right).offset(10);
        make.width.equalTo(@80);
        make.height.equalTo(@80);
    }];
    [self.baseTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.baseImgView.mas_right).offset(10);
        make.top.equalTo(self.baseImgView.mas_top).offset(2);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    [self.baseDetailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseTextLabel.mas_bottom).offset(5);
        make.left.equalTo(self.baseTextLabel.mas_left).offset(0);
    }];
    [self.basePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseDetailTextLabel.mas_bottom).offset(5);
        make.left.equalTo(self.baseTextLabel.mas_left).offset(0);
    }];
    [self.baseBuyCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-20);
        make.centerY.equalTo(self.basePriceLabel.mas_centerY);
    }];
    [self.baseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.baseStatusImgView.mas_right).offset(5);
        make.centerY.equalTo(self.baseStatusImgView.mas_centerY).offset(0);
        make.height.equalTo(@30);
    }];
    [self.baseBottomLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseImgView.mas_bottom).offset(10);
        make.left.right.equalTo(self.contentView).offset(0);
        make.height.equalTo(@0.5);
    }];
    [super updateConstraints];
}


@end
