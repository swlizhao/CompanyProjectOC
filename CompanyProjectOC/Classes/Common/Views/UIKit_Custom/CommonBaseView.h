//
//  CommonBaseView.h
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/17.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CommonBaseViewButtonActionType)(UIButton * button);

@interface CommonBaseView : UIView

@property (nonatomic,copy)CommonBaseViewButtonActionType commonBaseViewButtonActionBlock;

- (void)show;
- (void)hidden;

@end
