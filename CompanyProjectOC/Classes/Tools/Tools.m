//
//  Tools.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "Tools.h"
#import <CommonCrypto/CommonDigest.h>
static     SystemSoundID soundID=0;
//#ifdef DEBUGSEVER
//#define MAINURL                 @"http://117.34.110.202"
//#else
#define MAINURL                  @"http://192.168.1.250"
//#endif
//#define MAINURL                  @"http://182.254.150.171"
//#endif
@implementation Tools

static MBProgressHUD *HUD;

id objectFromJSONData(NSData *data, NSError **error) {
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
}

NSString * JSONStringFromObject(id object, NSError ** error) {
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:0 error:error];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

BOOL StringIsValid(NSString *string)
{
    if (![string isKindOfClass:[NSString class]]) {
        return NO;
    }
    if (!string || [string isEqual:[NSNull null]]) {
        return NO;
    }
    if ([string length] == 0) {
        return NO;
    }
    return YES;
}


/**
 * 计算指定时间与当前的时间差
 * @param compareDate   某一指定时间
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
NSString * CompareCurrentTime(NSDate *compareDate)
{
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    int temp = 0;
    NSString *result;
    if (timeInterval < 30) {
        
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if(timeInterval <60){
        temp = timeInterval;
        result = [NSString stringWithFormat:@"%d秒前",temp];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%d分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%d小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%d天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%d月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%d年前",temp];
    }
    
    return  result;
}
+ (CGFloat)getAdapterHeight {
    CGFloat adapterHeight = 0;
    if ([[[UIDevice currentDevice] systemVersion] integerValue] < 7.0) {
        adapterHeight = 44;
    }
    return adapterHeight;
}
//提示窗口
+ (void)MsgBox:(NSString *)msg{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg
                                                   delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil];
    [alert show];
}
//打开一个网址
+ (void) OpenUrl:(NSString *)inUrl{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:inUrl]];
}

//MBProgressHUD 的使用方式，只对外两个方法，可以随时使用(但会有警告！)，其中窗口的 alpha 值 可以在源程序里修改。
+ (void)showHUD:(NSString *)msg{
    
    //HUD = [[MBProgressHUD alloc] initWithView:view];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIWindow *window = delegate.window;
    HUD = [[MBProgressHUD alloc] initWithWindow:window];
    [window addSubview:HUD];
    HUD.labelText = msg;
    [HUD show:YES];
}


+ (void)removeHUD{
    
    [HUD hide:YES];
    [HUD removeFromSuperViewOnHide];
}
//检测网络
+(BOOL) isInNet
{
    BOOL isNetConnect;
    if ([Reachability reachabilityForInternetConnection].currentReachabilityStatus == NotReachable ) {//没有对wifi做判断
        isNetConnect = NO;
    }else{
        isNetConnect = YES;
    }
    if(isNetConnect== NO){
        [Tools MsgBox:NONET];
        return NO;
    }
    return isNetConnect;
}

//判断网络是否可用
+(BOOL)checkNetIsUsed{
    BOOL isNetConnect;
    if ([Reachability reachabilityForInternetConnection].currentReachabilityStatus == NotReachable && [Reachability reachabilityForLocalWiFi].currentReachabilityStatus == NotReachable ) {
        isNetConnect = NO;
    }else{
        isNetConnect = YES;
    }
    
    return isNetConnect;
}
//纯色Image
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+(UIImage*)getGrayImage:(UIImage*)sourceImage
{
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,width,height,8,0,colorSpace,kCGBitmapAlphaInfoMask);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,CGRectMake(0, 0, width, height), sourceImage.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}

//判断输入内容不为空
+(BOOL) isTextViewNotEmpty:(NSString *) text isCue:(BOOL) isCue
{
    BOOL isNotEmpty = YES;
    if (!text)
    {
        isNotEmpty = NO;
        //return isNotEmpty;
    }
    if (text.length == 0)
    {
        isNotEmpty = NO;
    }
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (text.length == 0)
    {
        isNotEmpty = NO;
    }
    if (!isNotEmpty)
    {
        if (isCue)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@""
                                                                message:@"内容为空。"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
    }
    return isNotEmpty;
}
//判断输入内容不含空格

//默认路径
+(NSURL *) defaultNSURL:(NSString *) urlStr
{
    NSURL *url = nil;
    urlStr = [NSString stringWithFormat:@"%@%@",MAINURL,urlStr];
    url = [NSURL URLWithString:urlStr];
    return url;
}

+(NSURL *) imgNSURL:(NSString *) urlStr
{
    urlStr = [NSString stringWithFormat:@"/image/%@",urlStr];
    NSURL *url = nil;
    urlStr = [NSString stringWithFormat:@"%@%@",MAINURL,urlStr];
//    NSLog(@"urlStr = %@",urlStr);
    url = [NSURL URLWithString:urlStr];
    return url;
}

//+(NSString *) defaultURL:(NSString *) urlStr
//{
//    NSString *url = nil;
//    url = [NSString stringWithFormat:@"%@%@",MAINURL,urlStr];
//    return url;
//}
//+ (UIImage *) scaleFromImage: (UIImage *) image
//{
//    CGSize oriSize = image.size;
//    CGSize size = oriSize;
//    float s = SCREENWIDTH/SCREENHEIGHT;
//    float _s = oriSize.width/oriSize.height;
//    if (s > _s)
//    {
//        if (oriSize.height > SCREENHEIGHT)
//        {
//            float s_ = SCREENHEIGHT/oriSize.height;
//            size = CGSizeMake(oriSize.width*s_, SCREENHEIGHT);
//        }
//    }else{
//        if (oriSize.width > SCREENWIDTH)
//        {
//            float s_ = SCREENWIDTH/oriSize.width;
//            size = CGSizeMake(SCREENWIDTH, oriSize.height*s_);
//        }
//    }
//    UIGraphicsBeginImageContext(size);
//    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}

+ (UIImage *) scaleFromImage: (UIImage *) image rect:(CGRect) rect
{
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0.0f);
    [image drawInRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//将所下载的图片保存到本地
+(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath
{
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    } else {
        //ALog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
        //NSLog(@"文件后缀不认识");
    }
}

//读取本地保存的图片
+(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath
{
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, extension]];
    
    return result;
}
static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw,fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}


+ (UIImage *) createRoundedRectImage:(UIImage*)image size:(CGSize)size //由外部释放
{
    // the size of CGContextRef
    int w = size.width;
    int h = size.height;
    
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGBitmapByteOrderMask);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, 5, 5);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIImage *rounedImage = [[UIImage alloc] initWithCGImage:imageMasked];
    CGImageRelease(imageMasked);
    return rounedImage ;
}

/*手机号码验证 MODIFIED BY HELENSONG*/
+(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
//    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSString *phoneRegex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[^4])|(17[0,0-9]))\\d{8}$";
    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}

//验证邮箱的合法性
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//截取部分图像
+(UIImage*)getSubImage:(UIImage *) image rect:(CGRect)rect maxSize:(CGSize) maxSize
{
    float width = image.size.width*2;
    float height = image.size.height*2;
    
    if (rect.size.width > width)
    {
        rect.origin.x = 0;
        rect.size.width = width;
    }
    if (rect.size.height > height)
    {
        rect.origin.y = 0;
        rect.size.height = height;
    }
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    UIGraphicsBeginImageContext(smallBounds.size);
    //UIGraphicsBeginImageContextWithOptions(smallBounds.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    return smallImage;
}
//+(UIImage *) scaleImage:(UIImage *) oriImage
//{
//    float s = oriImage.size.height/oriImage.size.width;
//    CGSize size = CGSizeMake(SCREENWIDTH, SCREENWIDTH*s);
//    if (size.width > oriImage.size.width)
//    {
//        return oriImage;
//    }
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
//    // 绘制改变大小的图片
//    [oriImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
//    // 从当前context中创建一个改变大小后的图片
//    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
//    // 使当前的context出堆栈
//    UIGraphicsEndImageContext();
//    // 返回新的改变大小后的图片
//    
//    return scaledImage;
//}

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    //UIGraphicsBeginImageContext(size);
    if (size.width < img.size.width)
    {
        size.height = size.width*img.size.height/img.size.width;
    }
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

//判断是否重新登录
+(BOOL) isMLogin
{
    //    NSDate *seldate = [NSDate date];
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    NSInteger interval = [zone secondsFromGMTForDate: seldate];
    //    NSDate * date = [seldate dateByAddingTimeInterval: interval];
    //
    //    NSString *_string = [UserLocalData UserLastLoginDate];
    //    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    //    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss'Z'"];
    //    NSDate *lastLoginDay = [formatter dateFromString:_string];
    //    if (lastLoginDay)
    //    {
    //        NSTimeInterval shijiancha = [date timeIntervalSinceDate:lastLoginDay];
    //        if (shijiancha < 3600)
    //        {
    //            return YES;
    //        }
    //    }
    return NO;
}

+(NSInteger) ageFromDate:(NSString *) dateStr
{
    //将传入的时间转化成为相应的格式
    NSDateFormatter *formeatter=[[NSDateFormatter alloc] init];
    [formeatter  setDateFormat:@"yyyy-MM-dd"];
    NSDate *fromdate=[formeatter  dateFromString:dateStr];
    NSTimeZone *fromzome=[NSTimeZone  systemTimeZone];
    NSInteger   frominterval=[fromzome secondsFromGMTForDate:fromdate];
    NSDate *fromDate=[fromdate dateByAddingTimeInterval:frominterval];
//    NSLog(@"fromDate is %@",fromDate);
    
    //获取系统当前时间
    NSDate *Newdate=[NSDate  date];
    NSTimeZone *zone=[NSTimeZone  systemTimeZone];
    NSInteger  interval=[zone secondsFromGMTForDate:Newdate];
    NSDate *localeDate=[Newdate  dateByAddingTimeInterval:interval];
    
    //NSLog(@"localeDate is %@",localeDate);
    
    double intervalTime = [localeDate timeIntervalSinceReferenceDate] - [fromDate timeIntervalSinceReferenceDate] ;
    
    long lTime=(long)intervalTime;
    //NSLog(@"lTime is %ld",lTime);
    
    //    NSInteger iSeconds = lTime % 60;
    //    NSInteger iMinutes = (lTime / 60) % 60;
    //    NSInteger iHours = (lTime / 3600);
    //    NSInteger iDays = lTime/60/60/24;
    //    NSInteger iMonth = lTime/60/60/24/12;
    NSInteger iYears = lTime/60/60/24/365;
    
    //NSLog(@"相差%d年%d月 或者 %d日%d时%d分%d秒 ", iYears,iMonth,iDays,iHours,iMinutes,iSeconds);
    //NSLog(@" years  is %d:",iYears);
    return iYears;
}
//+(ErrorCode) errorCodeWithKey:(NSString *) errorCodeKey
//{
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"error" ofType:@"plist"];
//    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
//    ErrorCode errorCode = [[dictionary valueForKey:errorCodeKey] intValue];
//    return errorCode;
//}

static UILabel *lab = nil;
//+(void)showTipSuper:(UIView*)parent title:(NSString*)title{
//    if (!lab) {
//         lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, SCREENWIDTH, 40)];
//    }
//    lab.text = title;
//    lab.numberOfLines = 2;
//    lab.font = [UIFont systemFontOfSize:15.0];
//    lab.textColor = [UIColor lightGrayColor];
//    lab.textAlignment = NSTextAlignmentCenter;
//    [parent addSubview:lab];
//}
+(void)hideTipSuper{
    if (lab) {
        [lab removeFromSuperview];
        lab = nil;
    }
}


+(UIColor*)mostColorWithCGImage:(UIImage *)image{
    
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(50, 50);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
    if (data == NULL) return nil;
    
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            
            int offset = 4*(x*y);
            
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            
            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
            
        }
    }
    CGContextRelease(context);
    
    
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        
        if ( tmpCount > MaxCount ) continue;
        
        
        
        MaxCount=tmpCount;
        
        MaxColor=curColor;
        
        
    }
    
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}


+(UIColor *)returnRandom{
    int red = arc4random_uniform(200);
    int green = arc4random_uniform(200);
    int blue = arc4random_uniform(200);
    
    
    return [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:0.7];
}

+(UIColor*) getPixelColorAtLocation:(CGPoint)point  image:(UIImage *)image{
    UIColor* color = nil;
    CGImageRef inImage = image.CGImage;
    // Create off screen bitmap context to draw the image into. Format ARGB is 4 bytes for each pixel: Alpa, Red, Green, Blue
    CGContextRef cgctx = [self createARGBBitmapContextFromImage:inImage];
    if (cgctx == NULL) { return nil; /* error */ }
    
    size_t w = CGImageGetWidth(inImage);
    size_t h = CGImageGetHeight(inImage);
    CGRect rect = {{0,0},{w,h}};
    
    // Draw the image to the bitmap context. Once we draw, the memory
    // allocated for the context for rendering will then contain the
    // raw image data in the specified color space.
    CGContextDrawImage(cgctx, rect, inImage);
    
    
    unsigned char* data = CGBitmapContextGetData (cgctx);
    if (data != NULL) {
        //offset locates the pixel in the data from x,y.
        //4 for 4 bytes of data per pixel, w is width of one row of data.
        int offset = 4*((w*round(point.y))+round(point.x));
        int alpha =  data[offset];
        int red = data[offset+1];
        int green = data[offset+2];
        int blue = data[offset+3];
        NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
        color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
    }
    
    // When finished, release the context
    CGContextRelease(cgctx);
    // Free image data memory for the context
    if (data) { free(data); }
    
    return color;
}



+ (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage {
    
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
    
    // Get image width, height. We'll use the entire image.
    size_t pixelsWide = CGImageGetWidth(inImage);
    size_t pixelsHigh = CGImageGetHeight(inImage);
    
    // Declare the number of bytes per row. Each pixel in the bitmap in this
    // example is represented by 4 bytes; 8 bits each of red, green, blue, and
    // alpha.
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    // Use the generic RGB color space.
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color spacen");
        return NULL;
    }
    
    // Allocate memory for image data. This is the destination in memory
    // where any drawing to the bitmap context will be rendered.
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits
    // per component. Regardless of what the source image format is
    // (CMYK, Grayscale, and so on) it will be converted over to the format
    // specified here by CGBitmapContextCreate.
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }
    // Make sure and release colorspace before returning
    CGColorSpaceRelease( colorSpace );
    
    return context;
}



+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


+(BOOL)judgePassWordLegal:(NSString *)pass{
    BOOL result = false;
    if ([pass length] >= 6){
        // 判断长度大于8位后再接着判断是否同时包含数字和字符
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,25}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:pass];
    }
    return result;
}


+ (UIImage *)handleImage:(UIImage *)originalImage withSize:(CGSize)size
{
    CGSize originalsize = [originalImage size];
//    NSLog(@"改变前图片的宽度为%f,图片的高度为%f",originalsize.width,originalsize.height);
    
    //原图长宽均小于标准长宽的，不作处理返回原图
    if (originalsize.width<size.width && originalsize.height<size.height)
    {
        return originalImage;
    }
    
    //原图长宽均大于标准长宽的，按比例缩小至最大适应值
    else if(originalsize.width>size.width && originalsize.height>size.height)
    {
        CGFloat rate = 1.0;
        CGFloat widthRate = originalsize.width/size.width;
        CGFloat heightRate = originalsize.height/size.height;
        
        rate = widthRate>heightRate?heightRate:widthRate;
        
        CGImageRef imageRef = nil;
        
        if (heightRate>widthRate)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(0, originalsize.height/2-size.height*rate/2, originalsize.width, size.height*rate));//获取图片整体部分
        }
        else
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(originalsize.width/2-size.width*rate/2, 0, size.width*rate, originalsize.height));//获取图片整体部分
        }
        UIGraphicsBeginImageContext(size);//指定要绘画图片的大小
        CGContextRef con = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(con, 0.0, size.height);
        CGContextScaleCTM(con, 1.0, -1.0);
        
        CGContextDrawImage(con, CGRectMake(0, 0, size.width, size.height), imageRef);
        
        UIImage *standardImage = UIGraphicsGetImageFromCurrentImageContext();
//        NSLog(@"改变后图片的宽度为%f,图片的高度为%f",[standardImage size].width,[standardImage size].height);
        
        UIGraphicsEndImageContext();
        CGImageRelease(imageRef);
        
        return standardImage;
    }
    
    //原图长宽有一项大于标准长宽的，对大于标准的那一项进行裁剪，另一项保持不变
    else if(originalsize.height>size.height || originalsize.width>size.width)
    {
        CGImageRef imageRef = nil;
        
        if(originalsize.height>size.height)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(0, originalsize.height/2-size.height/2, originalsize.width, size.height));//获取图片整体部分
        }
        else if (originalsize.width>size.width)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(originalsize.width/2-size.width/2, 0, size.width, originalsize.height));//获取图片整体部分
        }
        
        UIGraphicsBeginImageContext(size);//指定要绘画图片的大小
        CGContextRef con = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(con, 0.0, size.height);
        CGContextScaleCTM(con, 1.0, -1.0);
        
        CGContextDrawImage(con, CGRectMake(0, 0, size.width, size.height), imageRef);
        
        UIImage *standardImage = UIGraphicsGetImageFromCurrentImageContext();
//        NSLog(@"改变后图片的宽度为%f,图片的高度为%f",[standardImage size].width,[standardImage size].height);
        
        UIGraphicsEndImageContext();
        CGImageRelease(imageRef);
        
        return standardImage;
    }
    
    //原图为标准长宽的，不做处理
    else
    {
        return originalImage;
    }
}

//计算字符串宽度跟高度
+(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize string:(NSString *)string
{
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
+(NSString *)md5_32String:(NSString *)sourceString{
    if(!sourceString){
        return nil;//判断sourceString如果为空则直接返回nil。
    }
    //MD5加密都是通过C级别的函数来计算，所以需要将加密的字符串转换为C语言的字符串
    const char *cString = sourceString.UTF8String;
    //创建一个C语言的字符数组，用来接收加密结束之后的字符
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    //MD5计算（也就是加密）
    //第一个参数：需要加密的字符串
    //第二个参数：需要加密的字符串的长度
    //第三个参数：加密完成之后的字符串存储的地方
    CC_MD5(cString, (CC_LONG)strlen(cString), result);
    //将加密完成的字符拼接起来使用（16进制的）。
    //声明一个可变字符串类型，用来拼接转换好的字符
    NSMutableString *resultString = [[NSMutableString alloc]init];
    //遍历所有的result数组，取出所有的字符来拼接
    for (int i = 0;i < CC_MD5_DIGEST_LENGTH; i++) {
        [resultString  appendFormat:@"%02x",result[i]];
        //%02x：x 表示以十六进制形式输出，02 表示不足两位，前面补0输出；超出两位，不影响。当x小写的时候，返回的密文中的字母就是小写的，当X大写的时候返回的密文中的字母是大写的。
    }
    //打印最终需要的字符
    NSLog(@"resultString === %@",resultString);
    return resultString;
}
//图片转字符串
+(NSString *)UIImageToBase64Str:(UIImage *)image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}

//字符串转图片
+(UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr
{
    NSData *_decodedImageData   = [[NSData alloc] initWithBase64Encoding:_encodedImageStr];
    UIImage *_decodedImage      = [UIImage imageWithData:_decodedImageData];
    return _decodedImage;
}
+(NSString *)getDeviceUUID {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * UUID = [defaults objectForKey:@"UUID"];
    return UUID;
}
+(NSString *)getUserId {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * user_id        = [defaults objectForKey:@"userId"];
    return user_id;
}
+(BOOL)removeUserIdAndUUID
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * userId =[defaults objectForKey:@"userId"];
    NSString *UUID =[defaults objectForKey:@"UUID"];
    NSLog(@"------tools 删除之前-------%@----uuid---%@",userId,UUID);
    [defaults removeObjectForKey:@"userId"];
    [defaults removeObjectForKey:@"UUID"];
    [defaults synchronize];
    
    NSString * user_id =[defaults     objectForKey:@"userId"];
    NSString * dele_UUID =[defaults   objectForKey:@"UUID"];
    NSLog(@"------tools 删除之后-------%@----uuid---%@",user_id,dele_UUID);
    BOOL remove;
    if (!user_id) {
        remove =YES;
    }else{
        remove =NO;
    }
    return remove;
}
//+(NSString *)getPhone
//{
//    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
//    NSString * phone = [defaults objectForKey:@"phone"];
//   
//    return phone;
//}

+(NSString *)exchangeTimeDateWithString:(NSString *)timeDateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [dateFormatter dateFromString:timeDateString];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSString * currentDateStr = [dateFormatter stringFromDate:date];
    return currentDateStr;
}
+(NSString *)timeStampExchangeTimeString:(NSString *)timeStamp
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStamp intValue]];
    NSString*confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimesp==我是时间戳转化为时间的:%@",confromTimespStr);
    return confromTimespStr;
}
+(NSString *)timeStringWithTimeString:(NSString *)timeStamp
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStamp intValue]];
    NSString*confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimesp==我是时间戳转化为时间的:%@",confromTimespStr);
    return confromTimespStr;

}
+(NSString *)timeStringWithStampTimeString:(NSString *)timeStamp
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStamp intValue]];
    NSString*confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimesp==我是时间戳转化为时间的yyyy-MM-dd:%@",confromTimespStr);
    return confromTimespStr;
}


+(NSString*)getCurrentTimestamp{
    
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    return timeString;
    
}
+ (NSString *)firstCharactor:(NSString *)aString
{

    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}
+(NSString *)getCurrentVersion
{
    NSDictionary * infoDic =[[NSBundle mainBundle]infoDictionary];
    NSString * currentVersion =infoDic[@"CFBundleShortVersionString"];
  //  NSLog(@"获取系统相关信息==有当前app版本号=======%@",infoDic);
    NSLog(@"Tools--->当前app版本号:%@",currentVersion);
    
    return currentVersion;

}

+ (NSMutableAttributedString *)setupAttributeString:(NSString *)text highlightText:(NSString *)highlightText fontSize:(CGFloat)fontSize highlightColor:(UIColor *)color; {
    NSRange hightlightTextRange = [text rangeOfString:highlightText];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:text];
    UIFont * font;
    if (fontSize != 0) {
         font = [UIFont boldSystemFontOfSize:fontSize];
    }else {
        font = [UIFont boldSystemFontOfSize:FONTSIZE_14];
    }                                  
    if (hightlightTextRange.length > 0) {
        [attributeStr addAttribute:NSForegroundColorAttributeName
                             value:[UIColor redColor]
                             range:hightlightTextRange];
        [attributeStr addAttribute:NSFontAttributeName value:font range:hightlightTextRange];
        return attributeStr;
    }else {
        return [highlightText copy];
    }
}
+ (NSMutableAttributedString *)setupAttributeDeleLineString:(NSString *)deleText fontSize:(CGFloat)fontSize  lineColor:(UIColor *)color{
    UIFont * font;
    if (fontSize == 0) {
        font = [UIFont systemFontOfSize:FONTSIZE_14];
    }else {
        font = [UIFont systemFontOfSize:fontSize];
    }
    if (!color) {
         color = [UIColor grayColor];
    }
    NSRange deleTextRange = [deleText rangeOfString:deleText];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:deleText];
    if (deleTextRange.length > 0) {
        [attributeStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:deleTextRange];
        [attributeStr addAttribute:NSStrikethroughColorAttributeName value:color range:deleTextRange];
        [attributeStr addAttribute:NSFontAttributeName value:font range:deleTextRange];
        return attributeStr;
    }else {
      return [deleText copy];
    }
}

+ (void)playSound
{
    static NSURL *mp3URL            = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        mp3URL                  = [[NSBundle mainBundle] URLForResource:@"AddShopAudio.mp3" withExtension:nil];
        mp3URL = [NSURL URLWithString:[[NSBundle mainBundle]pathForResource:@"AddShopAudio" ofType:@"mp3"]];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(mp3URL), &soundID);
    });
      AudioServicesPlaySystemSound(soundID);
    //    AudioServicesPlayAlertSound(soundID);
//    if (CURRENT_USER.isSound)
//    {
//        AudioServicesPlaySystemSound(soundID);
//    }
    
    
    
}

@end
