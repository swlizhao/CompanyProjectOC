//
//  ForgotNextMainView.h
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/24.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "CommonBaseView.h"
#import "LoginChildView.h"
@interface ForgotNextMainView : CommonBaseView
@property(nonatomic,strong)LoginChildView * pwdView;
@property(nonatomic,strong)LoginChildView * nextPwdView;
@property(nonatomic,strong)CommonBaseButton * commitBtn;
@end
