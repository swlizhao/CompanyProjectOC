//
//  BaseTableViewHeaderFooterView.h
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BaseTableViewHeaderFooterViewButtonBlk)(UIButton * button);
@interface BaseTableViewHeaderFooterView : UITableViewHeaderFooterView

@property(nonatomic,strong)UILabel * baseTextLabel;
@property(nonatomic,strong)UILabel * baseDetailTextLabel;
@property(nonatomic,strong)UILabel * baseWarningLabel;
@property(nonatomic,strong)UIImageView * baseImgView;
@property(nonatomic,strong)UIImageView * baseDetailImgView;
@property(nonatomic,strong)UIImageView * baseStatusImgView;
@property(nonatomic,strong)UIImageView * baseArrowImgView;
@property(nonatomic,strong)UIImageView * baseBottomLineImgView;
@property(nonatomic,strong)UIButton * baseButton;
@property(nonatomic,strong)UIButton * baseDetailButton;
@property(nonatomic,copy)BaseTableViewHeaderFooterViewButtonBlk baseTableViewHeaderFooterViewButtonBlock;
@end
