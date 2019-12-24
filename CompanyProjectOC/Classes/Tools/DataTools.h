//
//  DataTools.h
//  CompanyProjectOC
//
//  Created by 李钊 on 2019/10/26.
//  Copyright © 2019 LIZHAO. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataTools : NSObject

/*
 字典转Json字符串
 
 @param infoDict 字典数据
 @return Json字符串
 */
+ (NSString *)convertToJSONData:(id)infoDict;

/**
 JSON字符串转化为字典
 
 @param jsonString Json字符串
 @return 字典数据
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;



@end


