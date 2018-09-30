//
//  LoginCustomView.h
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/24.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "CommonBaseView.h"

@interface LoginChildView : CommonBaseView

@property(nonatomic,strong)CommonBaseTextField * textField;
@property(nonatomic,strong)CommonBaseButton * button;
@property(nonatomic,strong)CommonBaseImageView * lineImgView;
@property(nonatomic,assign)BOOL isWarning;
@end
