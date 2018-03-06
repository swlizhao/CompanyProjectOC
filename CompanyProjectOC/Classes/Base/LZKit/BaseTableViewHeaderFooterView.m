//
//  BaseTableViewHeaderFooterView.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseTableViewHeaderFooterView.h"

@implementation BaseTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupBaseTableViewHeaderFooterView];
        [self initBaseTableViewHeaderFooterViewConfig];
    }
    return self;
}

- (void)setupBaseTableViewHeaderFooterView {
    [self.contentView lz_addSubviews:@[self.baseImgView,self.baseDetailImgView,self.baseStatusImgView,self.baseArrowImgView,self.baseBottomLineImgView,self.baseTextLabel,self.baseDetailTextLabel,self.baseWarningLabel,self.baseButton,self.baseDetailButton]];
}

- (void)initBaseTableViewHeaderFooterViewConfig {
    
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

@end
