//
//  BaseViewController.h
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"
@interface BaseViewController : UIViewController

@property(nonatomic,copy)void(^baseViewBtnActionBlock)(id object);
@property(nonatomic,strong)LoadingView * loadingView;

@end
