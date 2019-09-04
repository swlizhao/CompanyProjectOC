//
//  UserInfoModel.h
//  CompanyProjectOC
//
//  Created by 李钊 on 2018/12/10.
//  Copyright © 2018 LIZHAO. All rights reserved.
//

#import "CommonBaseModel.h"


@interface UserInfoModel : CommonBaseModel

/**
 * @param UserInfoModel  存放用户所有信息的实体类
 *
 *
 */


/**
 * 用户ID
 *
 */
@property(nonatomic,copy)NSString * userId;

/**
 * 用户名字
 *
 **/
@property(nonatomic,copy)NSString * userName;

/**
 * 用户头像
 *
 **/
@property(nonatomic,copy)NSString * userPhoto;

/**
 * 用户电话
 *
 **/
@property(nonatomic,copy)NSString * userPhone;


/**
 * other...
 *
 **/
//@property(nonatomic,copy)NSString * <#express#>;




@end

