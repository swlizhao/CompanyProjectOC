//
//  UIButton+LZButtonSenderStatus.m
//  CompanyProjectOC
//
//  Created by apple on 2017/11/30.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "UIButton+LZButtonSenderStatus.h"
static NSString * originalTextString;
static UIColor * originalBgColor;
static UIColor * originalTitleColor;
@implementation UIButton (LZButtonSenderStatus)

- (void)setupOriginalBtnStatusWithTitleString:(NSString *)title
                                   titleColor:(UIColor *)titleColor
                                      bgColor:(UIColor *)bgColor
                                       enable:(BOOL)enable {
    [self initConfigWithTitle:title titleColor:titleColor bgColor:bgColor enable:enable];
}

- (void)initConfigBtnClickedStatusWithTitleString:(NSString *)title
                                       titleColor:(UIColor *)titleColor
                                          bgColor:(UIColor *)bgColor
                                           enable:(BOOL)enable
                                          timeout:(int)time {
    originalBgColor = self.backgroundColor;
    originalTitleColor = self.titleLabel.textColor;
    originalTextString = self.titleLabel.text;
    [self initConfigWithTitle:title titleColor:titleColor bgColor:bgColor enable:NO];
    if (time == 0) {
        time = 10;
    }
    __block int timeout = time;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self initConfigWithTitle:originalTextString titleColor:originalTitleColor bgColor:originalBgColor enable:YES];
            });
        }else{
         
            dispatch_async(dispatch_get_main_queue(), ^{
               
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void)initConfigWithTitle:(NSString *)title titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor enable:(BOOL)enable {
    [self setTitleColor:titleColor forState:0];
    [self setTitle:title forState:0];
    self.userInteractionEnabled = enable;
    self.enabled = enable;
    self.backgroundColor = bgColor;
}

@end
