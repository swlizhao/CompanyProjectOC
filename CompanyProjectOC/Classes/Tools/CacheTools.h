//
//  CacheTools.h
//  CompanyProjectOC
//
//  Created by 李钊 on 2018/12/10.
//  Copyright © 2018 LIZHAO. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CacheTools : NSObject

#pragma mark - NSUserDefaults 存储

/**
 *   @param keyName 键值
 *   @param dictObj 字典数据
 */
+ (void)saveDictionaryToUserDefaultsWithKeyName:(NSString *)keyName dictObj:(NSDictionary *)dictObj;


/**
 * @param keyName 键值
 * @return 字典数据
 **/
+ (NSDictionary *)readDictionaryFromUserDefaultsWithKeyName:(NSString *)keyName;

#pragma mark - plist 文件数据存储

/**
 * Plist数据保存
 * @param plistName Plist文件名称
 * @param dataObj 对象数据（NSMutableDictionary、NSArray）
 * @return YES:成功 NO:失败
 **/
+ (BOOL)savePlist:(NSString *)plistName dataObj:(NSObject *)dataObj;


/**
 * Plist数据读取
 * @param  plistName  plist文件名称
 * @param  dataClass 数据类型
 * @return  对象数据
 **/
+ (id)readPlistDataWithPlistName:(NSString *)plistName
                   dataClass:(Class)dataClass;

/**
 * Plist 文件删除
 * @param plistName Plist文件名称
 * @return YES:成功 NO:失败
 **/
+ (BOOL)removePlist:(NSString *)plistName;


/**
 *  读取Info.plist里面的值
 *  @param keyName  键值
 *  @return  键值对应的值
 **/

+ (NSString *)getKeyValueWithInfoPlist:(NSString *)keyName;

@end


