//
//  DataTools.m
//  CompanyProjectOC
//
//  Created by 李钊 on 2019/10/26.
//  Copyright © 2019 LIZHAO. All rights reserved.
//

#import "DataTools.h"

@implementation DataTools

/**
 字典转Json字符串
 
 @param infoDict 字典数据
 @return Json字符串
 */
+ (NSString *)convertToJSONData:(id)infoDict {
    NSError * error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:infoDict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = @"";
    if (jsonData) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//去除掉首尾的空白字符和换行字符
    [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return jsonString;
}

/**
 JSON字符串转化为字典
 
 @param jsonString Json字符串
 @return 字典数据
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
          return nil;
      }
      NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
      NSError *error;
      NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                          options:NSJSONReadingMutableContainers
                                                            error:&error];
      if(error) {
          return nil;
      }
      return dict;
}

@end
