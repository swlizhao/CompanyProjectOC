//
//  BaseButton.h
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseButton;
typedef void(^BaseButtonActionBlock)(UIButton * button);

@interface BaseButton : UIButton

+ (BaseButton *)baseButtonWithFrame:(CGRect )frame
                              title:(NSString *)title
                          titleFont:(UIFont *)font
                         titleColor:(UIColor *)titleColor
                    backgroundColor:(UIColor *)backgroundColor
                              image:(UIImage *)image
                    backgroundImage:(UIImage *)backgroundImage;

- (void)baseButtonActionWithBlock:(BaseButtonActionBlock)btnActionBlock;


@end
