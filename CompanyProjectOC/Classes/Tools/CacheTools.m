//
//  CacheTools.m
//  CompanyProjectOC
//
//  Created by 李钊 on 2018/12/10.
//  Copyright © 2018 LIZHAO. All rights reserved.
//

#import "CacheTools.h"

@implementation CacheTools

/**
 *   @param keyName 键值
 *   @param dictObj 字典数据
 */
+ (void)saveDictionaryToUserDefaultsWithKeyName:(NSString *)keyName dictObj:(NSDictionary *)dictObj {
    if (dictObj != nil && [dictObj count]>0) {
        
    }
    
}



/**
 * @param keyName 键值
 * @return 字典数据
 **/
+ (NSDictionary *)readDictionaryFromUserDefaultsWithKeyName:(NSString *)keyName {
    return @{};
}


/**
 UserDefaults数据保存
 
 @param keyName 键值
 @param dataObj 对象数据
 */
+ (void)saveUserDefaults:(NSString *)keyName dataObj:(id)dataObj {
    //转换为NSData
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:dataObj forKey:keyName];
    [archiver finishEncoding];
    
    //本地保存NSData数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:keyName];
    [defaults setObject:data forKey:keyName];
    [defaults synchronize];
}

 #pragma mark - plist 文件数据存储

 /**
  * Plist数据保存
  * @param plistName Plist文件名称
  * @param dataObj 对象数据（NSMutableDictionary、NSArray）
  * @return YES:成功 NO:失败
  **/
+ (BOOL)savePlist:(NSString *)plistName dataObj:(NSObject *)dataObj {
    return YES;
}


/**
 * Plist数据读取
 * @param  plistName  plist文件名称
 * @param  dataClass 数据类型
 * @return  对象数据
 **/
+ (id)readPlistDataWithPlistName:(NSString *)plistName
                       dataClass:(Class)dataClass {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [path stringByAppendingPathComponent:plistName];
    if ([dataClass isSubclassOfClass:[NSMutableDictionary class]]) {
        return [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    } else if ([dataClass isSubclassOfClass:[NSArray class]]) {
        return [NSMutableArray arrayWithContentsOfFile:plistPath];
    }else {
        return nil;
    }
}


/**
 * Plist 文件删除
 * @param plistName Plist文件名称
 * @return YES:成功 NO:失败
 **/
+ (BOOL)removePlist:(NSString *)plistName {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [path stringByAppendingPathComponent:plistName];
    NSFileManager * manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:plistPath]) {
        [manager removeItemAtPath:plistPath error:nil];
    }
    return YES;
}


/**
 *  读取Info.plist里面的值
 *  @param keyName  键值
 *  @return  键值对应的值
 **/

+ (NSString *)getKeyValueWithInfoPlist:(NSString *)keyName {
    NSDictionary * dict = [[NSBundle mainBundle]infoDictionary];
    return [dict objectForKey:keyName];
    
}

@end
