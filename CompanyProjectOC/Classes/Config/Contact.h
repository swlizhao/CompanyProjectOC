//
//  Contact.h
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#ifndef Contact_h
#define Contact_h

#define  MAIN_URL          @"https://www.sojson.com"

#define   API              @"/api"

#define  APPSTORE_URL                   @"http://itunes.apple.com/lookup?id="

#define  APPLE_ID          @"1193489212"

#define  STORYBOARD_MAIN   [UIStoryboard  storyboardWithName:@"Main" bundle:nil]

#define  STORYBOARD_PERSONAL   [UIStoryboard   storyboardWithName:@"Personal" bundle:nil]

#define  STORYBOARD_LOGIN   [UIStoryboard  storyboardWithName:@"Login" bundle:nil]

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define WeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;

#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define RGB(r, g, b)        RGBA(r, g, b, 1.0f)

#define arc4randomColor    [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];

#define SYSTEM_VERSION   [[UIDevice currentDevice].systemVersion floatValue]

#define APP_VERSION       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define  FONTSIZE_18   18
#define  FONTSIZE_17   17
#define  FONTSIZE_16   16
#define  FONTSIZE_15   15
#define  FONTSIZE_14   14
#define  FONTSIZE_13   13
#define  FONTSIZE_12   12
#define  FONTSIZE_11   11
#define  FONTSIZE_10   10

#define IS_IOS_11    floorf([[UIDevice currentDevice].systemVersion floatValue]) == 11. ? (YES) : (NO)

#define  STATUS_BAR_HEIGHT     ([[UIApplication sharedApplication]statusBarFrame].size.height)

#define STATUS_NAVIGATION_BAR_HEIGHT (([[UIApplication sharedApplication]statusBarFrame].size.height) + 44.)

#define  TAB_BAR_HEIGHT        ((SCREEN_HEIGHT) < (812.) ? (49) : (83))

#define KWIDTH_SCALE    [UIScreen mainScreen].bounds.size.width/375.0f


#define QQID     @"1106650129"
#define QQKEY    @"jCuN4Lhqc2xR7ZFQ"
#define WXID     @"wxd4fc4d2cb1e0f8bb"
#define WXKEY    @"7a80996bfc52f684972b5d5083ca01e9"
#define RCIM_KEY  @"123456"

#endif /* Contact_h */
