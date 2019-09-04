//
//  ApiResultModel.h
//  CompanyProjectOC
//
//  Created by 李钊 on 2019/5/30.
//  Copyright © 2019 LIZHAO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ApiResultModel : NSObject

/**
 *
 */
@property(nonatomic,copy)NSString * message;


/**
 * 服务器返回状态码
 */
@property(nonatomic,copy)NSString * code;


/**
 *  返回的数据
 *
 **/
@property(nonatomic,strong)NSDictionary * resultDataDict;



@end

NS_ASSUME_NONNULL_END
