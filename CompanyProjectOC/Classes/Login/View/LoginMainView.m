//
//  LoginMainView.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/4.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "LoginMainView.h"

@interface LoginMainView ()

@property(nonatomic,strong)BaseView                 * phoneView;
@property(nonatomic,strong)BaseView                 * pwdView;
@property(nonatomic,strong)UIImageView              * imgLine;

@end

@implementation LoginMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self initConfig];
    }
    return self;
}

- (void)setup {
    [self                            addSubview:self.bgImageView];
    [self                            addSubview:self.phoneView];
    [self                            addSubview:self.pwdView];
    [self.phoneView                  addSubview:self.phoneField];
    [self.pwdView                    addSubview:self.imgLine];
    [self.pwdView                    addSubview:self.forgotBtn];
    [self.pwdView                    addSubview:self.pwdField];
    [self                            addSubview:self.loginBtn];
    [self                            setNeedsUpdateConstraints];
}

- (void)initConfig {
    self.phoneField.placeholder                = @"手机号";
    self.pwdField.placeholder                  = @"密码";
    self.phoneView.layer.cornerRadius          = 22;
    self.phoneView.layer.borderWidth           = 0.5;
    self.phoneView.layer.borderColor           = [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:0.3].CGColor;
    self.phoneView.backgroundColor             = [UIColor whiteColor];
    
    self.pwdView.layer.cornerRadius            = 22;
    self.pwdView.layer.borderWidth             = 0.5;
    self.pwdView.layer.borderColor             = [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:0.3].CGColor;
    self.pwdView.backgroundColor               = [UIColor whiteColor];
    
    self.phoneField.font                       = [UIFont systemFontOfSize:14];
    self.pwdField.font                         = [UIFont systemFontOfSize:14];
    self.backgroundColor                       = [UIColor  colorWithRed:252./255. green:252./255. blue:252./255. alpha:1.];
    
    self.loginBtn.backgroundColor              = [UIColor orangeColor];
    self.loginBtn.layer.cornerRadius           = 22;
    self.loginBtn.titleLabel.font              = [UIFont systemFontOfSize:14];
    [self.loginBtn setTitle:@"点击登录" forState:0];

    [self.forgotBtn setTitleColor:[UIColor blackColor] forState:0];
    [self.forgotBtn setTitle:@"找回密码" forState:0];
    self.forgotBtn.titleLabel.font = [UIFont systemFontOfSize:FONTSIZE_14];
    self.imgLine.backgroundColor = RGBA(0, 0, 0 ,0.5);
    
}

- (BaseImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[BaseImageView alloc]init];
    }
    return _bgImageView;
}

- (BaseView *)phoneView {
    if (!_phoneView) {
        _phoneView = [[BaseView alloc]init];
    }
    return _phoneView;
}

- (BaseView *)pwdView {
    if (!_pwdView) {
        _pwdView = [[BaseView alloc]init];
    }
    return _pwdView;
}

- (BaseTextField *)phoneField {
    if (!_phoneField) {
        _phoneField = [[BaseTextField alloc]init];
    }
    return _phoneField;
}

- (BaseTextField *)pwdField {
    if (!_pwdField) {
        _pwdField = [[BaseTextField alloc]init];
    }
    return _pwdField;
}

- (BaseButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [[BaseButton alloc]init];
    }
    return _loginBtn;
}

- (BaseButton *)forgotBtn {
    if (!_forgotBtn) {
        _forgotBtn = [BaseButton buttonWithType:0];

    }
    return _forgotBtn;
}

- (UIImageView *)imgLine {
    if (!_imgLine) {
        _imgLine = [[UIImageView alloc]init];
    }
    return _imgLine;
}

- (void)updateConstraints {
    CGFloat leftMargin     = 30;
    CGFloat phoneHeight    = 44;
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(50);
        make.leading.equalTo(self).offset(leftMargin);
        make.trailing.equalTo(self).offset(-leftMargin);
        make.height.equalTo(@(phoneHeight));
    }];
    [_pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom).offset(20);
        make.leftMargin.equalTo(self).offset(leftMargin);
        make.rightMargin.equalTo(self).offset(-leftMargin);
        make.height.equalTo(@(phoneHeight));
    }];
    [_phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView).offset(10);
        make.centerY.equalTo(self.phoneView).offset(0);
        make.left.equalTo(self.phoneView).offset(15);
        make.right.equalTo(self.phoneView).offset(-10);
    }];
    [_forgotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdView).offset(0);
        make.right.equalTo(self.pwdView).offset(-10);
        make.bottom.equalTo(self.pwdView).offset(0);
        make.width.equalTo(@70);
    }];
    [_imgLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.forgotBtn.mas_centerY).offset(0);
        make.top.equalTo(self.pwdView).offset(12);
        make.right.equalTo(self.forgotBtn.mas_left).offset(-5);
        make.width.equalTo(@0.5);
    }];
    [_pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdView).offset(10);
        make.centerY.equalTo(self.pwdView);
        make.left.equalTo(self.pwdView).offset(15);
        make.right.equalTo(self.imgLine.mas_right).offset(-20);
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdView.mas_bottom).offset(30);
        make.left.equalTo(self).offset(leftMargin);
        make.right.equalTo(self).offset(-leftMargin);
        make.height.equalTo(@(phoneHeight));
    }];
    [super updateConstraints];
}

@end
