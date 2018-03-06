//
//  BaseCollectionViewCell.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBaseCollectionViewCell];
        [self initBaseCollectionViewCellConfig];
        
    }
    return self;
}

- (void)setupBaseCollectionViewCell {
    [self.contentView lz_addSubviews:@[self.baseImageView,self.baseDetailImageView,self.baseStatusImgView,self.baseWarningImgView,self.baseArrowImgView,self.baseTextLabel,self.baseDetailTextLabel,self.baseWarningLabel,self.baseButton]];
}

- (void)initBaseCollectionViewCellConfig {
    
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

- (UIImageView *)baseImageView {
    if (!_baseImageView) {
        _baseImageView = [[UIImageView alloc]init];
    }
    return _baseImageView;
}

- (UIImageView *)baseDetailImageView {
    if (!_baseDetailImageView) {
        _baseDetailImageView = [[UIImageView alloc]init];
    }
    return _baseDetailImageView;
}

- (UIImageView *)baseStatusImgView {
    if (!_baseStatusImgView) {
        _baseStatusImgView = [[UIImageView alloc]init];
    }
    return _baseStatusImgView;
}

- (UIImageView *)baseWarningImgView {
    if (!_baseWarningImgView) {
        _baseWarningImgView = [[UIImageView alloc]init];
    }
    return _baseWarningImgView;
}

- (UIImageView *)baseArrowImgView {
    if (!_baseArrowImgView) {
        _baseArrowImgView = [[UIImageView alloc]init];
    }
    return _baseArrowImgView;
}

- (UIButton *)baseButton {
    if (!_baseButton) {
        _baseButton = [UIButton buttonWithType:0];
    }
    return _baseButton;
}

@end
