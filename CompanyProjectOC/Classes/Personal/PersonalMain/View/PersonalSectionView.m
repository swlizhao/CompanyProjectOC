//
//  PersonalSectionView.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "PersonalSectionView.h"

@implementation PersonalSectionView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
        [self initConfig];
    }
    return self;
}

- (void)setup {
    [self setNeedsUpdateConstraints];
    [self.baseDetailButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initConfig {
    self.baseTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_16];
    self.baseBottomLineImgView.backgroundColor = RGBA(0, 0, 0, 0.1);
    self.baseTextLabel.text = @"我的订单";
    self.baseArrowImgView.image = [UIImage imageNamed:@"img_arrow_right_16"];
    
    self.baseDetailTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_12];
    self.baseDetailTextLabel.textColor = [UIColor grayColor];
    self.baseDetailTextLabel.text = @"查看更多订单";
}

#pragma mark - 隐藏
- (void)setIsHidden:(BOOL)isHidden {
    _isHidden = isHidden;
    self.baseTextLabel.hidden = _isHidden;
    self.baseDetailTextLabel.hidden = _isHidden;
    self.baseArrowImgView.hidden = _isHidden;
    self.baseBottomLineImgView.hidden = _isHidden;
}


- (void)btnAction:(UIButton *)button {
    if (self.baseTableViewHeaderFooterViewButtonBlock) {
        self.baseTableViewHeaderFooterViewButtonBlock(button);
    }
}

- (void)updateConstraints {
    [self.baseTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    [self.baseArrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.baseTextLabel.mas_centerY);
        make.right.equalTo(self.contentView).offset(-5);
        make.width.height.equalTo(@15);
    }];
    [self.baseDetailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.baseArrowImgView.mas_left).offset(0);
        make.centerY.equalTo(self.baseTextLabel.mas_centerY);
    }];
    [self.baseBottomLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
        make.height.equalTo(@0.5);
    }];
    [self.baseDetailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(0);
        make.centerY.equalTo(self.baseArrowImgView.mas_centerY);
        make.height.equalTo(@30);
        make.left.equalTo(self.baseDetailTextLabel.mas_left).offset(0);
    }];
    [super updateConstraints];
}

@end
