//
//  BaseButton.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseButton.h"

@interface BaseButton ()

@property(nonatomic,copy) BaseButtonActionBlock baseButtonTypeBlock;
@end

@implementation BaseButton

+ (BaseButton *)baseButtonWithFrame:(CGRect)frame
                              title:(NSString *)title
                          titleFont:(UIFont *)font
                         titleColor:(UIColor *)titleColor
                    backgroundColor:(UIColor *)backgroundColor
                              image:(UIImage *)image
                    backgroundImage:(UIImage *)backgroundImage {
    BaseButton * button = [BaseButton buttonWithType:0];
    button.frame = frame;
    [button setTitle:title forState:0];
    [button setTitleColor:titleColor forState:0];
    [button setImage:image forState:0];
    [button setBackgroundImage:backgroundImage forState:0];
    button.backgroundColor = backgroundColor;
    button.titleLabel.font = font;
    return button;
}

- (void)baseButtonActionWithBlock:(BaseButtonActionBlock)btnActionBlock {
    _baseButtonTypeBlock = btnActionBlock;
    [self addTarget:self action:@selector(baseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)baseButtonAction:(BaseButton *)button {
    if (self.baseButtonTypeBlock) {
        self.baseButtonTypeBlock(button);
    }
}


@end
