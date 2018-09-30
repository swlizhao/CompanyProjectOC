//
//  ProductCategoryLeftTableViewCell.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "ProductCategoryLeftTableViewCell.h"

@implementation ProductCategoryLeftTableViewCell

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.baseTextLabel.numberOfLines = 0;
    self.baseTextLabel.font = [UIFont systemFontOfSize:FONTSIZE_14];
    self.baseBottomLineImgView.backgroundColor = RGBA(0, 0, 0, 0.1);
}

#pragma mark -管理赋值
- (void)setModel:(ProductParentCategoriesModel *)model {
    if (_model != model) {
        _model = model;
    }
    self.baseTextLabel.text = _model.prodcutCategoryName;
    if (_model.cellSelectStatus == 0) {
        self.baseTextLabel.textColor = [UIColor blackColor];
        self.backgroundColor =RGB(255, 255, 255);
    }else {
        self.baseTextLabel.textColor = [UIColor redColor];
        self.backgroundColor = RGB(240,248,255);
    }

}

- (void)updateConstraints{
    [self.baseTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView).offset(0);
        make.centerY.equalTo(self.contentView).offset(0);
    }];
    [self.baseBottomLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
        make.height.equalTo(@1);
    }];
    [super updateConstraints];
}


@end
