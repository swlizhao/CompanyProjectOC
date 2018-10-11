//
//  BRDatePickerView.m
//  BRPickerViewDemo
//
//  Created by 任波 on 2017/8/11.
//  Copyright © 2017年 renb. All rights reserved.
//
//  最新代码下载地址：https://github.com/91renb/BRPickerView

#import "BRDatePickerView.h"

@interface BRDatePickerView ()
{
    UIDatePickerMode _datePickerMode;
    NSString *_title;
    NSString *_minDateStr;
    NSString *_maxDateStr;
    BRDateResultBlock _resultBlock;
    BRDateCancelBlock _cancelBlock;
    NSString *_selectValue;
    BOOL _isAutoSelect;  // 是否开启自动选择
    UIColor *_themeColor;
}
// 时间选择器(默认大小: 320px × 200px)
@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation BRDatePickerView

#pragma mark - 1.显示时间选择器
+ (void)showDatePickerWithTitle:(NSString *)title
                       dateType:(UIDatePickerMode)type
                defaultSelValue:(NSString *)defaultSelValue
                    resultBlock:(BRDateResultBlock)resultBlock {
    [self showDatePickerWithTitle:title dateType:type defaultSelValue:defaultSelValue minDateStr:nil maxDateStr:nil isAutoSelect:NO themeColor:nil resultBlock:resultBlock cancelBlock:nil];
}

#pragma mark - 2.显示时间选择器（支持 设置自动选择 和 自定义主题颜色）
+ (void)showDatePickerWithTitle:(NSString *)title
                       dateType:(UIDatePickerMode)type
                defaultSelValue:(NSString *)defaultSelValue
                     minDateStr:(NSString *)minDateStr
                     maxDateStr:(NSString *)maxDateStr
                   isAutoSelect:(BOOL)isAutoSelect
                     themeColor:(UIColor *)themeColor
                    resultBlock:(BRDateResultBlock)resultBlock {
    [self showDatePickerWithTitle:title dateType:type defaultSelValue:defaultSelValue minDateStr:minDateStr maxDateStr:maxDateStr isAutoSelect:isAutoSelect themeColor:themeColor resultBlock:resultBlock cancelBlock:nil];
}

#pragma mark - 3.显示时间选择器（支持 设置自动选择、自定义主题颜色、取消选择的回调）
+ (void)showDatePickerWithTitle:(NSString *)title
                       dateType:(UIDatePickerMode)type
                defaultSelValue:(NSString *)defaultSelValue
                     minDateStr:(NSString *)minDateStr
                     maxDateStr:(NSString *)maxDateStr
                   isAutoSelect:(BOOL)isAutoSelect
                     themeColor:(UIColor *)themeColor
                    resultBlock:(BRDateResultBlock)resultBlock
                    cancelBlock:(BRDateCancelBlock)cancelBlock {
    BRDatePickerView *datePickerView = [[BRDatePickerView alloc]initWithTitle:title dateType:type defaultSelValue:defaultSelValue minDateStr:minDateStr maxDateStr:maxDateStr isAutoSelect:isAutoSelect themeColor:themeColor resultBlock:resultBlock cancelBlock:cancelBlock];
    [datePickerView showWithAnimation:YES];
}

#pragma mark - 初始化时间选择器
- (instancetype)initWithTitle:(NSString *)title
                     dateType:(UIDatePickerMode)type
              defaultSelValue:(NSString *)defaultSelValue
                   minDateStr:(NSString *)minDateStr
                   maxDateStr:(NSString *)maxDateStr
                 isAutoSelect:(BOOL)isAutoSelect
                   themeColor:(UIColor *)themeColor
                  resultBlock:(BRDateResultBlock)resultBlock
                  cancelBlock:(BRDateCancelBlock)cancelBlock {
    if (self = [super init]) {
        _datePickerMode = type;
        _title = title;
        _minDateStr = minDateStr;
        _maxDateStr = maxDateStr;
        _isAutoSelect = isAutoSelect;
        _themeColor = themeColor;
        _resultBlock = resultBlock;
        _cancelBlock = cancelBlock;
        
        if (defaultSelValue.length > 0) {
            _selectValue = defaultSelValue;
        } else {
            // 不设置默认日期，就默认选中今天的日期
            _selectValue = [self toStringWithDate:[NSDate date]];
        }
        
        [self initUI];
        
        NSDate *selectedDate = [self toDateWithDateString:_selectValue];
        if (!selectedDate) {
            selectedDate = [NSDate date];
        }
        // 滚动到默认选择的时间
        [self.datePicker setDate:selectedDate animated:YES];
    }
    return self;
}

#pragma mark - 初始化子视图
- (void)initUI {
    [super initUI];
    self.titleLabel.text = _title;
    // 添加时间选择器
    [self.alertView addSubview:self.datePicker];
    if (_themeColor && [_themeColor isKindOfClass:[UIColor class]]) {
        [self setupThemeColor:_themeColor];
    }
}

#pragma mark - 时间选择器
- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, kTopViewHeight + 0.5, SCREEN_WIDTH, kDatePicHeight)];
        _datePicker.backgroundColor = [UIColor whiteColor];
        _datePicker.datePickerMode = _datePickerMode;
        // 设置该UIDatePicker的国际化Locale，以简体中文习惯显示日期，UIDatePicker控件默认使用iOS系统的国际化Locale
        _datePicker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CHS_CN"];
        // textColor 隐藏属性，使用KVC赋值
        // [_datePicker setValue:[UIColor blackColor] forKey:@"textColor"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        // 设置时间范围
        if (_minDateStr != nil && _minDateStr.length > 0) {
            NSDate *minDate = [formatter dateFromString:_minDateStr];
            _datePicker.minimumDate = minDate;
        }
        if (_maxDateStr != nil && _maxDateStr.length > 0) {
            NSDate *maxDate = [formatter dateFromString:_maxDateStr];
            _datePicker.maximumDate = maxDate;
        }
        // 滚动改变值的响应事件
        [_datePicker addTarget:self action:@selector(didSelectValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePicker;
}

#pragma mark - 背景视图的点击事件
- (void)didTapBackgroundView:(UITapGestureRecognizer *)sender {
    [self dismissWithAnimation:NO];
    if (_cancelBlock) {
        _cancelBlock();
    }
}

#pragma mark - 弹出视图方法
- (void)showWithAnimation:(BOOL)animation {
    //1. 获取当前应用的主窗口
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:self];
    if (animation) {
        // 动画前初始位置
        CGRect rect = self.alertView.frame;
        rect.origin.y = SCREEN_HEIGHT;
        self.alertView.frame = rect;
        
        // 浮现动画
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.alertView.frame;
            rect.origin.y -= kDatePicHeight + kTopViewHeight;
            self.alertView.frame = rect;
        }];
    }
}

#pragma mark - 关闭视图方法
- (void)dismissWithAnimation:(BOOL)animation {
    // 关闭动画
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = self.alertView.frame;
        rect.origin.y += kDatePicHeight + kTopViewHeight;
        self.alertView.frame = rect;
        
        self.backgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.leftBtn removeFromSuperview];
        [self.rightBtn removeFromSuperview];
        [self.titleLabel removeFromSuperview];
        [self.lineView removeFromSuperview];
        [self.topView removeFromSuperview];
        [self.datePicker removeFromSuperview];
        [self.alertView removeFromSuperview];
        [self.backgroundView removeFromSuperview];
        [self removeFromSuperview];
        
        self.leftBtn = nil;
        self.rightBtn = nil;
        self.titleLabel = nil;
        self.lineView = nil;
        self.topView = nil;
        self.datePicker = nil;
        self.alertView = nil;
        self.backgroundView = nil;
    }];
}

#pragma mark - 时间选择器的滚动响应事件
- (void)didSelectValueChanged:(UIDatePicker *)sender {
    // 读取日期：datePicker.date
    _selectValue = [self toStringWithDate:sender.date];
    // 设置是否开启自动回调
    if (_isAutoSelect) {
        // 滚动完成后，执行block回调
        if (_resultBlock) {
            _resultBlock(_selectValue);
        }
    }
}

#pragma mark - 取消按钮的点击事件
- (void)clickLeftBtn {
    [self dismissWithAnimation:YES];
    if (_cancelBlock) {
        _cancelBlock();
    }
}

#pragma mark - 确定按钮的点击事件
- (void)clickRightBtn {
    // 点击确定按钮后，执行block回调
    [self dismissWithAnimation:YES];
    if (_resultBlock) {
        _resultBlock(_selectValue);
    }
}

#pragma mark - 格式转换：NSDate --> NSString
- (NSString *)toStringWithDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (_datePickerMode) {
        case UIDatePickerModeTime:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        case UIDatePickerModeDate:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case UIDatePickerModeDateAndTime:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        case UIDatePickerModeCountDownTimer:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        default:
            break;
    }
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

#pragma mark - 格式转换：NSDate <-- NSString
- (NSDate *)toDateWithDateString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (_datePickerMode) {
        case UIDatePickerModeTime:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        case UIDatePickerModeDate:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case UIDatePickerModeDateAndTime:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        case UIDatePickerModeCountDownTimer:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        default:
            break;
    }
    NSDate *destDate = [dateFormatter dateFromString:dateString];
    
    return destDate;
}

@end
