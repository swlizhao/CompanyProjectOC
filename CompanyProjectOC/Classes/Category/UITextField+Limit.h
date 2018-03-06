//
//  UITextField+Limit.h
//  输出限制
//
//  Created by pc-005 on 2018/2/11.
//  Copyright © 2018年 lishuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LimitBlock)(void);

@interface UITextField (Limit)

@property (nonatomic , copy)LimitBlock limitBlock;


- (void)lengthLimit:(void (^)(void))limit;

@end
