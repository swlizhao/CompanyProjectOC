//
//  LZNavView.m
//  CompanyProjectOC
//
//  Created by apple on 2018/1/3.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "LZNavView.h"

@interface LZNavView ()

@property(nonatomic,strong)UIView * bgView;
@property(nonatomic,strong)UIView * navView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIButton * setBtn;
@property(nonatomic,strong)UIButton * backBtn;

@end

@implementation LZNavView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self initConfigFrame];
        [self initConfig];
    }
    return self;
}

- (void)initConfig {
    self.backgroundColor = [UIColor clearColor];
   _titleFont = [UIFont boldSystemFontOfSize:17];
   _titleLabel.font = _titleFont;
   _titleLabel.textColor = [UIColor whiteColor];
   _bgColor = [UIColor whiteColor];
    _bgView.backgroundColor = [UIColor clearColor];
}

- (void)setColorAlpha:(CGFloat)colorAlpha {
    _colorAlpha = colorAlpha;
    if (_colorAlpha < 1.) {
         _titleLabel.textColor = self.titleColor;
        [_backBtn setImage:[UIImage imageNamed:self.leftImgString] forState:0];
        [_setBtn setImage:[UIImage imageNamed:self.rightImgString] forState:0];
        if (self.bgColor) {
            self.bgView.backgroundColor = [_bgColor colorWithAlphaComponent:_colorAlpha];
        }else {
            self.bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:_colorAlpha];
        }
    }else {
        if (self.highTitleColor) {
            _titleLabel.textColor = self.highTitleColor;
        }else {
             _titleLabel.textColor = self.titleColor;
        }
       
        [_backBtn setImage:[UIImage imageNamed:self.highLeftImgString] forState:0];
        [_setBtn setImage:[UIImage imageNamed:self.highRightImgString] forState:0];
        if (self.bgColor) {
             self.bgView.backgroundColor = [_bgColor colorWithAlphaComponent:_colorAlpha];
        }else {
              self.bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:_colorAlpha];
        }
      
    }
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    _bgView.backgroundColor = [_bgColor colorWithAlphaComponent:0.];
}

- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
    _titleString = titleString;
    _titleLabel.text = _titleString;
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    _titleLabel.font = _titleFont;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    _titleLabel.textColor = _titleColor;
}

- (void)setLeftImgString:(NSString *)leftImgString {
    _leftImgString = leftImgString;
    [_backBtn setImage:[UIImage imageNamed:_leftImgString] forState:UIControlStateNormal];
}

- (void)setRightImgString:(NSString *)rightImgString {
    _rightImgString = rightImgString;
    [_setBtn setImage:[UIImage imageNamed:_rightImgString] forState:UIControlStateNormal];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:self.bounds];
    }
    return _bgView;
}

- (UIView *)navView {
    if (!_navView) {
        _navView = [[UIView alloc]init];
    }
    return _navView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = 1;
    }
    return _titleLabel;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:0];
        _backBtn.tag = 100000;
        [_backBtn addTarget:self action:@selector(lzNavBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _backBtn;
}

- (UIButton *)setBtn {
    if (!_setBtn) {
        _setBtn = [UIButton buttonWithType:0];
        _setBtn.tag = 100001;
        [_setBtn addTarget:self action:@selector(lzNavBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _setBtn;
}

- (void)lzNavBtnAction:(UIButton *)button {
    if (self.btnTypeBlock) {
        self.btnTypeBlock(button);
    }
}

- (void)setup {
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.navView];
    [self.navView addSubview:self.backBtn];
    [self.navView addSubview:self.setBtn];
    [self.navView addSubview:self.titleLabel];
}

- (void)initConfigFrame {
    _bgView.frame = self.bounds;
    _navView.frame = CGRectMake(0, CGRectGetHeight(self.bgView.frame) - 44,CGRectGetWidth(self.bgView.frame),44);
    CGFloat btnW = 24.;
    CGFloat btnH = 24.;
    CGFloat margin = 10.;
    _backBtn.frame = CGRectMake(margin, (CGRectGetHeight(self.navView.frame)- btnH)/2, btnW, btnH);
    _setBtn.frame = CGRectMake(CGRectGetWidth(self.navView.frame) - btnW - margin,(CGRectGetHeight(self.navView.frame)- btnH)/2 ,btnW, btnH);
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(self.backBtn.frame), 0, CGRectGetWidth(self.navView.frame)- 2*(btnW + margin), 44);
}



@end
