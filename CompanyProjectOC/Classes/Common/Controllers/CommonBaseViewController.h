//
//  CommonBaseViewController.h
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/17.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationBar.h"
@interface CommonBaseViewController : UIViewController
/**
 * navBar  自定义导航栏
 *
 **/
@property(nonatomic,strong)CustomNavigationBar * navBar;

@end
