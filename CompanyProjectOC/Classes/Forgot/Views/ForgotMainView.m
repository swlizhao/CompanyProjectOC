//
//  ForgotMainView.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/4.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "ForgotMainView.h"

@interface ForgotMainView ()

@end

@implementation ForgotMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self initConfig];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.phoneView];
    [self addSubview:self.codeView];
    [self addSubview:self.warningLabel];
    [self addSubview:self.nextBtn];
    [self setNeedsUpdateConstraints];
}

- (void)initConfig {
    self.phoneView.textField.placeholder = @"手机号";
    self.phoneView.isWarning = YES;
    
    self.warningLabel.text = @"手机格式有误";
    self.warningLabel.font = [UIFont systemFontOfSize:FONTSIZE_12];
    self.warningLabel.textColor = [UIColor redColor];
    
    self.codeView.textField.placeholder = @"验证码";
    
    self.nextBtn.backgroundColor              = [UIColor orangeColor];
    self.nextBtn.layer.cornerRadius           = 22;
    self.nextBtn.titleLabel.font              = [UIFont systemFontOfSize:FONTSIZE_16];
    [self.nextBtn setTitle:@"下一步" forState:0];
    [self.nextBtn addTarget:self action:@selector(nextBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

#pragma mark - button点击事件
- (void)nextBtnAction:(UIButton *)button {
    if (self.commonBaseViewButtonActionBlock) {
        self.commonBaseViewButtonActionBlock(button);
    }
}

#pragma maek - 懒加载视图
- (LoginChildView *)phoneView {
    if (!_phoneView) {
        _phoneView = [[LoginChildView alloc]init];
    }
    return _phoneView;
}

- (LoginChildView *)codeView {
    if (!_codeView) {
        _codeView = [[LoginChildView alloc]init];
    }
    return _codeView;
}

- (CommonBaseLabel *)warningLabel {
    if (!_warningLabel) {
        _warningLabel = [[CommonBaseLabel alloc]init];
    }
    return _warningLabel;
}

- (CommonBaseButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [[CommonBaseButton alloc]init];
    }
    return _nextBtn;
}

- (void)updateConstraints {
    [super updateConstraints];
    CGFloat leftMargin = 30;
    CGFloat rightMargin = 30;
    CGFloat phoneViewHeight = 44;
    [_phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(50);
        make.left.equalTo(self).offset(leftMargin);
        make.right.equalTo(self).offset(-rightMargin);
        make.height.equalTo(@(phoneViewHeight));
    }];
    [_codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom).offset(30);
        make.left.equalTo(self.phoneView.mas_left).offset(0);
        make.right.equalTo(self.phoneView.mas_right).offset(0);
        make.height.equalTo(self.phoneView.mas_height);
    }];
    [_warningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom).offset(5);
        make.left.equalTo(self.phoneView.mas_left).offset(15);
    }];
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeView.mas_bottom).offset(30);
        make.left.equalTo(self).offset(leftMargin);
        make.right.equalTo(self).offset(-rightMargin);
        make.height.equalTo(@(phoneViewHeight));
    }];
}


@end
