//
//  BRDatePickerView.h
//  BRPickerViewDemo
//
//  Created by 任波 on 2017/8/11.
//  Copyright © 2017年 renb. All rights reserved.
//
//  最新代码下载地址：https://github.com/91renb/BRPickerView

#import "BRBaseView.h"

typedef void(^BRDateResultBlock)(NSString *selectValue);
typedef void(^BRDateCancelBlock)(void);

@interface BRDatePickerView : BRBaseView

/**
 *  1.显示时间选择器
 *
 *  @param title            标题
 *  @param type             显示类型（枚举类型：UIDatePickerModeTime、UIDatePickerModeDate、UIDatePickerModeDateAndTime、UIDatePickerModeCountDownTimer）
 *  @param defaultSelValue  默认选中的时间（值为空/值格式错误时，就默认选中现在的时间。注意默认值的格式要与显示类型对应）
 *  @param resultBlock      选择结果的回调
 *
 */
+ (void)showDatePickerWithTitle:(NSString *)title
                       dateType:(UIDatePickerMode)type
                defaultSelValue:(NSString *)defaultSelValue
                    resultBlock:(BRDateResultBlock)resultBlock;

/**
 *  2.显示时间选择器（支持 设置自动选择 和 自定义主题颜色）
 *
 *  @param title            标题
 *  @param type             显示类型（枚举类型：UIDatePickerModeTime、UIDatePickerModeDate、UIDatePickerModeDateAndTime、UIDatePickerModeCountDownTimer）
 *  @param defaultSelValue  默认选中的时间（值为空/值格式错误时，就默认选中现在的时间。注意默认值的格式要与显示类型对应）
 *  @param minDateStr       最小时间（如：2015-08-28 00:00:00），可为空
 *  @param maxDateStr       最大时间（如：2018-05-05 00:00:00），可为空
 *  @param isAutoSelect     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param themeColor       自定义主题颜色
 *  @param resultBlock      选择结果的回调
 *
 */
+ (void)showDatePickerWithTitle:(NSString *)title
                       dateType:(UIDatePickerMode)type
                defaultSelValue:(NSString *)defaultSelValue
                     minDateStr:(NSString *)minDateStr
                     maxDateStr:(NSString *)maxDateStr
                   isAutoSelect:(BOOL)isAutoSelect
                     themeColor:(UIColor *)themeColor
                    resultBlock:(BRDateResultBlock)resultBlock;

/**
 *  3.显示时间选择器（支持 设置自动选择、自定义主题颜色、取消选择的回调）
 *
 *  @param title            标题
 *  @param type             显示类型（枚举类型：UIDatePickerModeTime、UIDatePickerModeDate、UIDatePickerModeDateAndTime、UIDatePickerModeCountDownTimer）
 *  @param defaultSelValue  默认选中的时间（值为空/值格式错误时，就默认选中现在的时间。注意默认值的格式要与显示类型对应）
 *  @param minDateStr       最小时间（如：2015-08-28 00:00:00），可为空
 *  @param maxDateStr       最大时间（如：2018-05-05 00:00:00），可为空
 *  @param isAutoSelect     是否自动选择，即选择完(滚动完)执行结果回调，传选择的结果值
 *  @param themeColor       自定义主题颜色
 *  @param resultBlock      选择结果的回调
 *  @param cancelBlock      取消选择的回调
 *
 */
+ (void)showDatePickerWithTitle:(NSString *)title
                       dateType:(UIDatePickerMode)type
                defaultSelValue:(NSString *)defaultSelValue
                     minDateStr:(NSString *)minDateStr
                     maxDateStr:(NSString *)maxDateStr
                   isAutoSelect:(BOOL)isAutoSelect
                     themeColor:(UIColor *)themeColor
                    resultBlock:(BRDateResultBlock)resultBlock
                    cancelBlock:(BRDateCancelBlock)cancelBlock;

@end
