//
//  LoginCustomView.m
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/24.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "LoginChildView.h"

@implementation LoginChildView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
        [self _initConfig];
    }
    return self;
}

- (void)_setup {
    [self addSubview:self.textField];
    [self addSubview:self.lineImgView];
    [self addSubview:self.button];
    [self setNeedsUpdateConstraints];
}

- (void)_initConfig {
   self.layer.borderWidth = 0.5;
   self.layer.cornerRadius = 22;
   self.layer.borderColor = RGBA(0,0,0, 0.3).CGColor;
   self.textField.font = [UIFont systemFontOfSize:FONTSIZE_14];
}

- (void)setIsWarning:(BOOL)isWarning {
    _isWarning = isWarning;
    if (_isWarning == YES) {
         self.layer.borderColor = [UIColor redColor].CGColor;
    }else {
         self.layer.borderColor = RGBA(0,0,0, 0.3).CGColor;
    }
    
}

#pragma mark - 懒加载视图
- (CommonBaseTextField *)textField {
    if (!_textField) {
        _textField = [[CommonBaseTextField alloc]init];
    }
    return _textField;
}

- (CommonBaseButton *)button {
    if (!_button) {
        _button = [CommonBaseButton buttonWithType:0];
    }
    return _button;
}

- (CommonBaseImageView *)lineImgView {
    if (!_lineImgView) {
        _lineImgView = [[CommonBaseImageView alloc]init];
    }
    return _lineImgView;
}

#pragma mark - 添加约束
- (void)updateConstraints {
    [super updateConstraints];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.centerY.equalTo(self).offset(0);
        make.height.equalTo(@30);
    }];
}

@end
