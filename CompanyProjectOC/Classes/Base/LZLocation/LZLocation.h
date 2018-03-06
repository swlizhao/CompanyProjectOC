//
//  LZLocation.h
//  CompanyProjectOC
//  Created by LIZHAO (QQ: 2530569988)


/*** README
 
 **  封装的获取位置信息（系统自带API ---> CoreLocation 实现）
 
 **  必须在真机上运行
 
 **  @required： 必须在info.plist里面添加如下：
 
 **  1.Privacy - Location When In Use Usage Description（使用时获取位置信息）

 **  2.Privacy - Location Always and When In Use Usage Description（获取位置信息原因的描述，如原因不符合，则提交appStore会被拒绝 ---> Guideline 5.1.5 - Legal - Privacy - Location Services）

 **  优点：
 **  1. 采用系统API获取，占用内存小
 **  2. 两三行代码，完美实现定位功能，重用性强
 **  3. 对现有代码无任何入侵性
 **  4. 我想想...
 **
 ***/

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface LZLocation : NSObject

//类方法
+ (LZLocation *)getLocation;

//初始化配置,第一步必须调用
- (void)lzConfig;

/** 开始进行定位
 *  @parameter Block里面参数 ---> 是获取到定位结果的回调
 *  @parameter isLocation  定位服务是否可用 YES：是 默认：否 如果返回NO，则后面其它参数全为空
 *  @parameter country 国家
 *  @parameter province 省
 *  @parameter city 市
 *  @parameter area 区
 *  @parameter address 街道
 *  @parameter nearlyPlace 最近地方
 **/
- (void)startGetLocationResult:(void(^)(BOOL isLocation,NSString * country ,NSString *province, NSString *city ,NSString * area,NSString * address,NSString * nearlyPlace))locationResultBlock;

/**
 *   停止进行定位
**/
- (void)stopLocation;

/**
 *  类似于dealloc，销毁对象（一般在viewWillDisappear中调用）
 **/
- (void)lzLocationDealloc;
@end

