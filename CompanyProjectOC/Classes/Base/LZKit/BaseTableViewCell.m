//
//  BaseTableViewCell.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupBaseTableViewCell];
        [self initBaseTableViewCellConfig];
    }
    return self;
}

- (void)setupBaseTableViewCell{
    NSLog(@"BaseTableViewCell");
    [self.contentView lz_addSubviews:@[self.baseImgView,self.baseDetailImgView,self.baseStatusImgView,self.baseArrowImgView,self.baseBottomLineImgView,self.baseTextLabel,self.baseDetailTextLabel,self.baseWarningLabel,self.basePriceLabel,self.baseOldPriceLabel,self.baseBuyCountLabel,self.basePhoneLabel,self.baseButton,self.baseDetailButton,self.baseEditButton]];
}

- (void)initBaseTableViewCellConfig {

}

- (UILabel *)baseTextLabel {
    if (!_baseTextLabel) {
        _baseTextLabel = [[UILabel alloc]init];
    }
    return _baseTextLabel;
}

- (UILabel *)baseDetailTextLabel {
    if (!_baseDetailTextLabel) {
        _baseDetailTextLabel = [[UILabel alloc]init];
    }
    return _baseDetailTextLabel;
}

- (UILabel *)baseWarningLabel {
    if (!_baseWarningLabel) {
        _baseWarningLabel = [[UILabel alloc]init];
    }
    return _baseWarningLabel;
}

- (UIImageView *)baseImgView {
    if (!_baseImgView) {
        _baseImgView = [[UIImageView alloc]init];
    }
    return _baseImgView;
}

- (UIImageView *)baseDetailImgView {
    if (!_baseDetailImgView) {
        _baseDetailImgView = [[UIImageView alloc]init];
    }
    return _baseDetailImgView;
}

- (UIImageView *)baseStatusImgView {
    if (!_baseStatusImgView) {
        _baseStatusImgView = [[UIImageView alloc]init];
    }
    return _baseStatusImgView;
}

- (UIImageView *)baseArrowImgView {
    if (!_baseArrowImgView) {
        _baseArrowImgView = [[UIImageView alloc]init];
    }
    return _baseArrowImgView;
}

- (UIImageView *)baseBottomLineImgView {
    if (!_baseBottomLineImgView) {
        _baseBottomLineImgView = [[UIImageView alloc]init];
    }
    return _baseBottomLineImgView;
}

- (UIButton *)baseButton {
    if (!_baseButton) {
        _baseButton = [UIButton buttonWithType:0];
    }
    return _baseButton;
}

- (UIButton *)baseDetailButton {
    if (!_baseDetailButton) {
        _baseDetailButton = [UIButton buttonWithType:0];
    }
    return _baseDetailButton;
}

- (UILabel *)basePriceLabel {
    if (!_basePriceLabel) {
        _basePriceLabel = [[UILabel alloc]init];
    }
    return _basePriceLabel;
}

- (UILabel *)baseOldPriceLabel {
    if (!_baseOldPriceLabel) {
        _baseOldPriceLabel = [[UILabel alloc]init];
    }
    return _baseOldPriceLabel;
}

- (UILabel *)baseBuyCountLabel {
    if (!_baseBuyCountLabel) {
        _baseBuyCountLabel = [[UILabel alloc]init];
    }
    return _baseBuyCountLabel;
}

- (UILabel *)basePhoneLabel {
    if (!_basePhoneLabel) {
        _basePhoneLabel = [[UILabel alloc]init];
    }
    return _basePhoneLabel;
}

- (UIButton *)baseEditButton {
    if (!_baseEditButton) {
        _baseEditButton = [UIButton buttonWithType:0];
    }
    return _baseEditButton;
}

@end
