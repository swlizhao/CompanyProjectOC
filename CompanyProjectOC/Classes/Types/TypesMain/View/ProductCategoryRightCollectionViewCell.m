//
//  ProductCategoryRightCollectionViewCell.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "ProductCategoryRightCollectionViewCell.h"

@implementation ProductCategoryRightCollectionViewCell

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
    self.baseTextLabel.numberOfLines = 2;
    self.baseTextLabel.textAlignment = 1;
    self.baseTextLabel.textColor = [UIColor grayColor];
    self.baseTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_12];
    self.baseImageView.backgroundColor = arc4randomColor;
    self.contentView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 管理赋值
- (void)setModel:(ProductChildItemCategoriesModel *)model {
    if (_model != model) {
        _model = model;
    }
    self.baseTextLabel.text = [NSString stringWithFormat:@"%@",_model.name];
    
}

- (void)updateConstraints {
    [self.baseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(-40);
    }];
    [self.baseTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.baseImageView.mas_left).offset(0);
        make.right.equalTo(self.baseImageView.mas_right).offset(0);
        make.top.equalTo(self.baseImageView.mas_bottom).offset(5);
        make.bottom.equalTo(self.contentView).offset(-5);
    }];
    [super updateConstraints];
}

@end
