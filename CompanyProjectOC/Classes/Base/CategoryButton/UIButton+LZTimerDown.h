//
//  UIButton+LZTimerDown.h
//  CompanyProjectOC
//
//  Created by apple on 2017/11/25.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LZTimerDown)

- (void)startTimeDown:(int)timeCount  withDefaultColor:(UIColor *)defaultColor selectColor:(UIColor *)selectColor timeDownBlock:(void(^)(void))timeDownBlock;

@end
