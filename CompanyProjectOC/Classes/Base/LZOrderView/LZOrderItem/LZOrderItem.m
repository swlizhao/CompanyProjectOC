//
//  LZOrderItem.m
//  LifeFinanceDemo
//
//  Created by apple on 2017/10/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LZOrderItem.h"

@implementation LZOrderItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.iconImageView];
    [self addSubview:self.textLabel];
    [self addSubview:self.badgeLabel];
    [self setNeedsUpdateConstraints];
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
    }
    return _iconImageView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        _textLabel.textAlignment = 1.;
        _textLabel.font = [UIFont systemFontOfSize:FONTSIZE_13];
    }
    return _textLabel;
}

- (UILabel *)badgeLabel {
    if (!_badgeLabel) {
        _badgeLabel = [[UILabel alloc]init];
        _badgeLabel.textAlignment = 1;
        _badgeLabel.layer.cornerRadius = 8.;
        _badgeLabel.layer.masksToBounds = YES;
        _badgeLabel.textColor = [UIColor whiteColor];
        _badgeLabel.backgroundColor = RGBA(255, 0, 0, 1.);
        _badgeLabel.font = [UIFont systemFontOfSize:FONTSIZE_12];
        _badgeLabel.hidden = YES;
    }
    return _badgeLabel;
}

- (void)updateConstraints {
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-10);
//        make.width.equalTo(self).multipliedBy(0.4);
//        make.height.equalTo(self).multipliedBy(0.4);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(10);
        make.centerX.equalTo(self.iconImageView.mas_centerX);
        make.left.equalTo(self).offset(2);
    }];
    [_badgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.iconImageView.mas_right).offset(0);
        make.centerY.equalTo(self.iconImageView.mas_top).offset(0);
        make.width.equalTo(@16);
        make.height.equalTo(@16);
    }];
    [super updateConstraints];
}

@end
