//
//  BaseCollectionReusableView.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "BaseCollectionReusableView.h"

@implementation BaseCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBaseCollectionReusableView];
        [self initBaseCollectionReusableViewConfig];
    }
    return self;
}

- (void)setupBaseCollectionReusableView {
    [self lz_addSubviews:@[self.baseImgView,self.baseDetailImgView,self.baseArrowImgView,self.baseTextLabel,self.baseDetailTextLabel,self.baseButton,self.baseDetailButton]];
}

- (void)initBaseCollectionReusableViewConfig {
    
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

- (UIImageView *)baseArrowImgView {
    if (!_baseArrowImgView) {
        _baseArrowImgView = [[UIImageView alloc]init];
    }
    return _baseArrowImgView;
}

- (UILabel *)baseTextLabel {
    if (!_baseTextLabel) {
        _baseTextLabel = [[UILabel alloc]init];
    }
    return _baseTextLabel;
}

- (UILabel *)baseDetailTextLabel {
    if (!_baseDetailTextLabel) {
        _baseDetailTextLabel = [[UILabel alloc] init];
    }
    return _baseDetailTextLabel;
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
