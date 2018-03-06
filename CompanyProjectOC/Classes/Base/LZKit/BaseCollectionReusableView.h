//
//  BaseCollectionReusableView.h
//  CompanyProjectOC
//
//  Created by apple on 2018/2/28.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionReusableView : UICollectionReusableView

@property(nonatomic,strong)UIImageView * baseImgView;
@property(nonatomic,strong)UIImageView * baseDetailImgView;
@property(nonatomic,strong)UIImageView * baseArrowImgView;
@property(nonatomic,strong)UILabel * baseTextLabel;
@property(nonatomic,strong)UILabel * baseDetailTextLabel;
@property(nonatomic,strong)UIButton * baseButton;
@property(nonatomic,strong)UIButton * baseDetailButton;


typedef void(^BaseCollectionReusableViewButtonBlk)(UIButton * button);
@property(nonatomic,copy)BaseCollectionReusableViewButtonBlk baseCollectionReusableViewButtonBlock;

@end
