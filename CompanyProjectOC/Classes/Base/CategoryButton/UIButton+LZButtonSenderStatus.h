//
//  UIButton+LZButtonSenderStatus.h
//  CompanyProjectOC
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LZButtonSenderStatus)

//button原来状态
- (void)setupOriginalBtnStatusWithTitleString:(NSString *)title
                                        titleColor:(UIColor *)titleColor
                                           bgColor:(UIColor *)bgColor
                                            enable:(BOOL)enable;


//buttton点击后
- (void)initConfigBtnClickedStatusWithTitleString:(NSString *)title
                                       titleColor:(UIColor *)titleColor
                                          bgColor:(UIColor *)bgColor
                                           enable:(BOOL)enable
                                          timeout:(int)time;

@end
