//
//  ShoppingCartMoreCCell.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "ShoppingCartMoreCCell.h"

@implementation ShoppingCartMoreCCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self initConfig];
    }
    return self;
}

- (void)setup {
    [self setNeedsUpdateConstraints];
}

- (void)initConfig {
    self.baseImageView.backgroundColor = arc4randomColor;
    self.baseTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_12];
    self.baseDetailTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_12];
    self.baseDetailTextLabel.textColor = [UIColor redColor];
}

- (void)setMoreModel:(ShoppingCartMoreProductModel *)moreModel {
    if (_moreModel != moreModel) {
        _moreModel = moreModel;
    }
    self.baseTextLabel.text = _moreModel.productName;
    self.baseDetailTextLabel.text = [NSString stringWithFormat:@"¥%@",_moreModel.productPrice];
}

- (void)updateConstraints {
    [self.baseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(-40);
    }];
    [self.baseTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseImageView.mas_bottom).offset(5);
        make.left.equalTo(self.baseImageView.mas_left).offset(0);
    }];
    [self.baseDetailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseTextLabel.mas_bottom).offset(5);
        make.left.equalTo(self.baseImageView.mas_left).offset(0);
    }];
    [super updateConstraints];
}


@end
