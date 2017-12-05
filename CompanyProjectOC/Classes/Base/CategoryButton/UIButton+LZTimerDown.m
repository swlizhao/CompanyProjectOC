//
//  UIButton+LZTimerDown.m
//  CompanyProjectOC
//
//  Created by apple on 2017/11/25.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "UIButton+LZTimerDown.h"

static NSString * text;
@implementation UIButton (LZTimerDown)

- (void)startTimeDown:(int)timeCount  withDefaultColor:(UIColor *)defaultColor selectColor:(UIColor *)selectColor timeDownBlock:(void(^)(void))timeDownBlock {
    [self initBtnData];
    [self startTime:timeCount defaultColor:defaultColor selectColor:selectColor];
    if (timeDownBlock) {
        timeDownBlock();
    }
}

- (void)initBtnData {
    text = [NSString stringWithFormat:@"%@",self.titleLabel.text];
}

- (void)startTime:(int)time defaultColor:(UIColor *)defaultColor selectColor:(UIColor *)selectColor {
    __block int timeout = time;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:text forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                self.backgroundColor = defaultColor;
            });
        }else{
            NSString * timeStr = [NSString stringWithFormat:@"%.2d秒后获取",timeout];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:timeStr forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                self.backgroundColor = selectColor;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

@end
