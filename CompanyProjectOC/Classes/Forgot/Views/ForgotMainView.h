//
//  ForgotMainView.h
//  CompanyProjectOC
//
//  Created by apple on 2017/12/4.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "CommonBaseView.h"
#import "LoginChildView.h"
@interface ForgotMainView : CommonBaseView
@property(nonatomic,strong)LoginChildView * phoneView;
@property(nonatomic,strong)LoginChildView * codeView;
@property(nonatomic,strong)CommonBaseLabel * warningLabel;
@property(nonatomic,strong)CommonBaseButton * nextBtn;
@end
