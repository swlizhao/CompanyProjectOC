//
//  LoginMainView.h
//  CompanyProjectOC
//
//  Created by apple on 2017/12/4.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseView.h"

@interface LoginMainView : BaseView

@property(nonatomic,strong)BaseImageView                   * bgImageView;
@property(nonatomic,strong)BaseTextField                   * phoneField;
@property(nonatomic,strong)BaseTextField                   * pwdField;
@property(nonatomic,strong)BaseButton                      * loginBtn;
@property(nonatomic,strong)BaseButton                      * forgotBtn;

@end
