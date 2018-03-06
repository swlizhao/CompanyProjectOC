/*  LIZHAO  iOS开发攻城狮
 *  联系方式：
 *  QQ: 2530569988  email: lizhao1202@163.com
 *  Abstract: UICollectionViewCell里面子类控件单一，在此类添加一些子控件供使用，省去每次都去创建控件的麻烦
 *  warning: 可根据需要自行添加功能
 *
 *
 */

#import <UIKit/UIKit.h>

@interface BaseCollectionViewCell : UICollectionViewCell

/**
 * @param baseTextLabel  类似UITableViewCell 的 textLabel
 *
 */
@property(nonatomic,strong)UILabel * baseTextLabel;


/**
 * @param baseDetailTextLabel  类似UITableViewCell 的 detailTextLabel
 *
 */
@property(nonatomic,strong)UILabel * baseDetailTextLabel;

/**
 * @param  baseWarningLabel 提示作用
 *
 */
@property(nonatomic,strong)UILabel * baseWarningLabel;

/**
 * @param baseImageView  可以是商品图片...
 */
@property(nonatomic,strong)UIImageView * baseImageView;

/**
 * @param baseDetailImageView  可以是店铺图片也可以是其它...
 */
@property(nonatomic,strong)UIImageView * baseDetailImageView;

/**
 * @param baseWarningImgView  提示图片
 */
@property(nonatomic,strong)UIImageView * baseWarningImgView;

/**
 * @param baseArrowImgView:  可以用作右边箭头
 */
@property(nonatomic,strong)UIImageView * baseArrowImgView;

/**
 * @param baseStatusImgView  example: shoppingCart selectImg
 */
@property(nonatomic,strong)UIImageView * baseStatusImgView;

/**
 * @param baseButton  example: shoppingCart select
 */
@property(nonatomic,strong)UIButton * baseButton;

/**
 * @param baseCollectionViewCellButtonBlock: button事件传递出去
 */
typedef void(^BaseCollectionViewCellButtonBlk)(UIButton * button);

@property(nonatomic,copy)BaseCollectionViewCellButtonBlk  baseCollectionViewCellButtonBlock;

@end
