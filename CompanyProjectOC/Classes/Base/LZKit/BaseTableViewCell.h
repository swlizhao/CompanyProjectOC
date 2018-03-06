
/* LIZHAO ---> iOS开发攻城狮
   联系方式:
   QQ:253056998 (欢迎交流)
   email: lizhao1202@163.com
 */

// Abstract:我们不可以直接操作UITableViewCell类，但是可以操作此类
// 如果需要更多功能可自行添加

typedef void(^BaseTableViewCellButtonClick)(UIButton * button);

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

/*
 * @param baseTextLabel: 等价于UITableViewCell 的 textLabel
 */
@property(nonatomic,strong)UILabel * baseTextLabel;

/*
 * @param baseDetailTextLabel: 等价于UITableViewCell 的 detailTextLabel
 */
@property(nonatomic,strong)UILabel * baseDetailTextLabel;

/*
 * @param baseWarningLabel: 提示作用
 */
@property(nonatomic,strong)UILabel * baseWarningLabel;

/*
 * @param baseImgView : 等价于UITableViewCell 的 imageView
 */
@property(nonatomic,strong)UIImageView * baseImgView;

/*
 * @param baseDetailImgView
 */
@property(nonatomic,strong)UIImageView * baseDetailImgView;

/*
 * @param baseStatusImgView cell选中状态
 */
@property(nonatomic,strong)UIImageView * baseStatusImgView;

/*
 * @param baseArrowImgView : 右边箭头
 */
@property(nonatomic,strong)UIImageView * baseArrowImgView;

/*
 * @param baseBottomLineImgView: cell添加底部线
 */
@property(nonatomic,strong)UIImageView * baseBottomLineImgView;

/*
 * @param baseButton: cell里面button
 */
@property(nonatomic,strong)UIButton * baseButton;

/*
 * @param baseDetailButton: cell里面button
 */
@property(nonatomic,strong)UIButton * baseDetailButton;

/*
 * @param baseTableViewCellButtonClickBlock: 回调baseTableViewCell的Button事件
 */
@property(nonatomic,copy)BaseTableViewCellButtonClick baseTableViewCellButtonClickBlock;

/**
 * @param basePriceLabel:用来展示价格
 */
@property(nonatomic,strong)UILabel * basePriceLabel;

/**
 * @param baseOldPriceLabel:展示原来价格
 */
@property(nonatomic,strong)UILabel * baseOldPriceLabel;

/**
 * @param baseBuyCountLabel:商品数量
 */
@property(nonatomic,strong)UILabel * baseBuyCountLabel;


@property(nonatomic,strong)UILabel * basePhoneLabel;

@property(nonatomic,strong)UIButton * baseEditButton;

@end
