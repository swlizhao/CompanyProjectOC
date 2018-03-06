

#import "LZAdd.h"

@interface LZAdd ()
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIButton * loginButton;
@property(nonatomic,strong)UIImageView * bgImgView;
@end

@implementation LZAdd

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.bgImgView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.loginButton];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textAlignment = 1;
}

- (void)setBgImg:(UIImage *)bgImg {
    _bgImg = bgImg;
    self.bgImgView.image = bgImg;
}

- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
    self.titleLabel.text = _titleString;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.textColor = _titleColor;
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    self.titleLabel.font =_titleFont;
}

- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [[UIImageView alloc]initWithFrame:self.bounds];
    }
    return _bgImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:self.bounds];
    }
    return _titleLabel;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:0];
        _loginButton.frame = self.bounds;
        [_loginButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (void)btnAction:(UIButton *)button {
    if (self.lzAddBtnClickedBlock) {
        self.lzAddBtnClickedBlock(button);
    }
}

@end
