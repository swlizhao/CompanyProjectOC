//
//  Tools.h
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "AppDelegate.h"


#define NONET @"似乎断开了网络连接。"
#define USERORPASSWORDNULL @"用户名或密码不能为空！"
#define PASSWORDNOTSAME @"密码不一致！"
#define TEXTCONTENTNULL @"请输入消息内容！"
#define LIMITTEXTCOUNT @"消息字数超过180上限！"
#define NOLOGIN @"未登录"
#define MsgBox(msg) [self MsgBox:msg]

@interface Tools : NSObject

id objectFromJSONData(NSData *data, NSError **error);

NSString * JSONStringFromObject(id object, NSError ** error);

BOOL StringIsValid(NSString *string);
NSString * CompareCurrentTime(NSDate *compareDate);
+ (CGFloat)getAdapterHeight;
+ (void)MsgBox:(NSString *)msg;
+ (void)showHUD:(NSString *)msg;
+ (void)removeHUD;
+(BOOL) isInNet;
+ (void) OpenUrl:(NSString *)inUrl;
+ (UIImage *)createImageWithColor:(UIColor *)color;
+(UIImage*)getGrayImage:(UIImage*)sourceImage;
+(BOOL) isTextViewNotEmpty:(NSString *) text isCue:(BOOL) isCue;
+(NSURL *) defaultNSURL:(NSString *) urlStr;
+(NSURL *) imgNSURL:(NSString *) urlStr;
+(NSString *) defaultURL:(NSString *) urlStr;
+ (UIImage *) scaleFromImage: (UIImage *) image;
+ (UIImage *) scaleFromImage: (UIImage *) image rect:(CGRect) rect;
+(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath;
+(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath;

+ (UIImage *) createRoundedRectImage:(UIImage*)image size:(CGSize)size;
+(BOOL) isValidateMobile:(NSString *)mobile;
//验证邮箱的合法性
+(BOOL)isValidateEmail:(NSString *)email;
+(UIImage*)getSubImage:(UIImage *) image rect:(CGRect) rect maxSize:(CGSize) maxSize;
+ (UIImage *) scaleImage:(UIImage *) oriImage;
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
+(BOOL) isMLogin;
+(NSInteger) ageFromDate:(NSString *) dateStr;
//+(ErrorCode) errorCodeWithKey:(NSString *) errorCodeKey;
//
+(void)showTipSuper:(UIView*)parent title:(NSString*)title;
+(void)hideTipSuper;
//返回图片多数的颜色
+(UIColor*)mostColorWithCGImage:(UIImage *)image;
//返回图片的某点某区域颜色
+(UIColor*) getPixelColorAtLocation:(CGPoint)point  image:(UIImage *)image;
//返回随机颜色
+(UIColor *)returnRandom;
//HEXcolor转化
+ (UIColor *) colorWithHexString: (NSString *)color;
//判断网络是否可用
+(BOOL)checkNetIsUsed;
+(BOOL)judgePassWordLegal:(NSString *)pass;
//裁剪图片
+ (UIImage *)handleImage:(UIImage *)originalImage withSize:(CGSize)size;
//获取拼音首字母
+ (NSString *)firstCharactor:(NSString *)aString;
+(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize string:(NSString *)string;
+(NSString *)UIImageToBase64Str:(UIImage *)image;
+(UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr;
+(NSString *)getDeviceUUID;
+(NSString *)getUserId;
//+(NSString *)getPhone;
+(NSString *)md5_32String:(NSString *)sourceString;
+(NSString *)exchangeTimeDateWithString:(NSString *)timeDateString;
+(NSString *)timeStampExchangeTimeString:(NSString *)timeStamp;
+(NSString *)timeStringWithTimeString:(NSString *)timeStamp;
+(NSString *)timeStringWithStampTimeString:(NSString *)timeStamp;
+(NSString *)getCurrentTimestamp;//获取当前时间戳
+(NSString *)getCurrentVersion;//获取当前版本信息
+(BOOL)removeUserIdAndUUID;
#pragma mark - 富文本
+(NSMutableAttributedString *)setupAttributeString:(NSString *)text highlightText:(NSString *)highlightText fontSize:(CGFloat)fontSize highlightColor:(UIColor *)color;
+ (NSMutableAttributedString *)setupAttributeDeleLineString:(NSString *)deleText fontSize:(CGFloat)fontSize  lineColor:(UIColor *)color;
@end
