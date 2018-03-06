//
//  ShoppingCartSectionView.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "ShoppingCartSectionView.h"
@interface ShoppingCartSectionView ()

@property(nonatomic,assign)BOOL isHideen; //更多推荐 与 店铺 之间隐藏状态

@end

@implementation ShoppingCartSectionView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier  {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        [self initConfig];
    }
    return self;
}

- (void)setup {
    [self setNeedsUpdateConstraints];
    [self.baseButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initConfig {
    self.baseWarningLabel.hidden = YES;
    self.contentView.backgroundColor = RGB(245, 245, 245);
    self.baseTextLabel.numberOfLines = 1;
    self.baseButton.tag = 10000;
    self.baseWarningLabel.text = @"更多推荐";
    self.baseWarningLabel.textAlignment = 1;
    self.baseImgView.image = [UIImage imageNamed:@"img_shoppingCart_shop"];
    self.baseWarningLabel.font = [UIFont systemFontOfSize:FONTSIZE_15];
    self.baseTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_15];
}

#pragma mark -  section赋值
- (void)setShopModel:(ShoppingCartShopModel *)shopModel {
    if (_shopModel != shopModel) {
        _shopModel = shopModel;
    }
    self.baseTextLabel.text = _shopModel.shopName;
    if (_shopModel.sectionSelect == 0) {
        self.baseStatusImgView.image = [UIImage imageNamed:@"img_shoppingCart_noSelect"];
    }else {
       self.baseStatusImgView.image = [UIImage imageNamed:@"img_shoppingCart_select"];
    }
}

#pragma mark - 更多section 赋值
- (void)setIsMore:(BOOL)isMore {
    _isMore = isMore;
    if (_isMore == YES) {
        //更多推荐
        self.baseWarningLabel.hidden = NO;
        self.isHideen = YES;
    }else {
        self.baseWarningLabel.hidden = YES;
        self.isHideen = NO;
    }
}

- (void)setIsHideen:(BOOL)isHideen {
    _isHideen = isHideen;
    self.baseButton.hidden = _isHideen;
    self.baseStatusImgView.hidden = _isHideen;
    self.baseImgView.hidden = _isHideen;
    self.baseTextLabel.hidden = _isHideen;
}

- (void)btnAction:(UIButton *)button {
    if (self.baseTableViewHeaderFooterViewButtonBlock) {
        self.baseTableViewHeaderFooterViewButtonBlock(button);
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
        make.centerY.equalTo(self.baseStatusImgView.mas_centerY);
        make.left.equalTo(self.baseStatusImgView.mas_right).offset(10);
        make.width.equalTo(@18);
        make.height.equalTo(@18);
    }];
    [self.baseTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.baseImgView.mas_right).offset(10);
        make.centerY.equalTo(self.baseImgView.mas_centerY);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    [self.baseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.top.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.baseImgView.mas_centerX).offset(0);
    }];
    [self.baseWarningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.top.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
    }];
    
    [super updateConstraints];
}


@end
