
//  Copyright © 2017年 LIZHAO. All rights reserved.











/*
 *  waring:
 * ***
 *  @param colorAlpha：必须是在其它属性配置完之后再调用，否则会出问题
 * ***
 */


#import <UIKit/UIKit.h>

typedef void(^LZNavBtnType)(UIButton * button);

@interface LZNavView : UIView

/*
 *  @param bgColor 背景颜色
 */
@property(nonatomic,strong)UIColor * bgColor;

/*
 * @param titleString  导航栏标题
 */
@property(nonatomic,copy)NSString * titleString;

/*
 * @param leftImgString 左边图像字符串
 */
@property(nonatomic,copy)NSString * leftImgString;

/*
 * @param highLeftImgString 左边高亮图像字符串
 */
@property(nonatomic,copy)NSString * highLeftImgString;

/*
 * @param rightImgString 右边图像字符串
 */
@property(nonatomic,copy)NSString * rightImgString;

/*
 * @param highRightImgString 右边高亮图像字符串
 */
@property(nonatomic,copy)NSString * highRightImgString;

/*
 * @param  titleColor  字体颜色，默认白色
 */
@property(nonatomic,strong)UIColor * titleColor;

/*
 * @param  highTitleColor  高亮字体颜色
 */
@property(nonatomic,strong)UIColor * highTitleColor;

/*
 * @param titleFont 字体大小，默认16
 */
@property(nonatomic,strong)UIFont * titleFont;

/*
 * @param colorAlpha 渐变参数
 */
@property(nonatomic,assign)CGFloat colorAlpha; //0 ~ 0.1

/*
 * @param  btnTypeBlock 按钮点击事件
 */
@property(nonatomic,copy)LZNavBtnType  btnTypeBlock;


@end
