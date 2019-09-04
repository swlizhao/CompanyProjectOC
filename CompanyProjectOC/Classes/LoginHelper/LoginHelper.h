//
//  LoginHelper.h
//  CompanyProjectOC
//
//  Created by 李钊 on 2018/12/10.
//  Copyright © 2018 LIZHAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginHelper : NSObject

/**
 * userInfoModel: 用户信息
 *
 */
@property(nonatomic,strong)UserInfoModel * userInfoModel;


/*
 * 是否登录
 * @return YES:已登录 NO:未登录
 */
- (BOOL)isLogin;


@end

NS_ASSUME_NONNULL_END
