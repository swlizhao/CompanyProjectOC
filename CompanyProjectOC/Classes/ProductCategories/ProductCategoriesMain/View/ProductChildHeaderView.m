//
//  ProductChildHeaderView.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "ProductChildHeaderView.h"

@implementation ProductChildHeaderView

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
    [self.baseButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initConfig {
    self.baseTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_12];
    self.backgroundColor = RGB(245, 245, 245);
    self.baseArrowImgView.image = [UIImage imageNamed:@"img_arrow_right_16"];
    self.baseDetailTextLabel.text = @"排行榜";
    self.baseDetailTextLabel.textColor = [UIColor grayColor];
    self.baseDetailTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_12];
    self.baseButton.tag = 10000;
}

#pragma mark - 管理赋值
- (void)setSectionModel:(ProductChildSectionCategoriesModel *)sectionModel {
    if (_sectionModel != sectionModel) {
        _sectionModel = sectionModel;
    }
    self.baseTextLabel.text = _sectionModel.typeName;
    if ([sectionModel.typeStatus isEqualToString:@"0"]) {
        self.baseArrowImgView.hidden = YES;
        self.baseDetailTextLabel.hidden = YES;
        self.baseButton.hidden = YES;
    }else {
        self.baseArrowImgView.hidden = NO;
        self.baseDetailTextLabel.hidden = NO;
        self.baseButton.hidden = NO;
    }
}

- (void)btnAction:(UIButton *)button {
    if (self.baseCollectionReusableViewButtonBlock) {
        self.baseCollectionReusableViewButtonBlock(button);
    }
}

- (void)updateConstraints {
    [self.baseTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.centerY.equalTo(self.mas_centerY).offset(0);
    }];
    [self.baseArrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-5);
        make.centerY.equalTo(self.baseTextLabel.mas_centerY);
        make.width.height.equalTo(@16);
    }];
    [self.baseDetailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.baseArrowImgView.mas_left).offset(0);
        make.centerY.equalTo(self.baseTextLabel.mas_centerY);
    }];
    [self.baseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.baseDetailTextLabel.mas_left).offset(0);
        make.centerY.equalTo(self.baseTextLabel.mas_centerY);
        make.right.equalTo(self).offset(0);
        make.height.equalTo(@30);
    }];
    
    [super updateConstraints];
}

@end
