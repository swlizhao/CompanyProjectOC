//
//  BaseView.h
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BaseViewButtonType)(UIButton * button);
typedef void(^BaseViewButtonActionType)(UIButton * button);

typedef void(^BaseViewGestureRecognizer)(UIGestureRecognizer * gesture);
typedef void(^BaseViewTapGestureRecognizer)(UITapGestureRecognizer * tapGestureRecognizer);
typedef void(^BaseViewPanGestureRecognizer)(UIPanGestureRecognizer * panGestureRecognizer);




typedef void(^BaseViewTableViewSectionViewBtnAndSection)(UIButton * button , NSInteger section);
typedef void(^BaseViewTableViewDidSelectRowIndexPath)(NSIndexPath * indexPath);
typedef void(^BaseViewTableViewCellBtnAndIndexPath)(UIButton * button , NSIndexPath * indexPath);


typedef void(^BaseViewCollectionViewSectionBtnAndIndexPath)(UIButton * button ,NSIndexPath * indexPath);
typedef void(^BaseViewCollectionViewCellBtnAndIndexPath)(UIButton * button ,NSIndexPath * indexPath);
typedef void(^BaseViewCollectionViewDidSelectItemIndexPath)(NSIndexPath * indexPath);


@interface BaseView : UIView

@property(nonatomic,copy)BaseViewButtonType  baseViewButtonSenderBlock;
@property(nonatomic,copy)BaseViewTapGestureRecognizer baseViewTapSenderBlock;
@property(nonatomic,copy)BaseViewPanGestureRecognizer  baseViewPanSenderBlock;
@property(nonatomic,copy)BaseViewButtonActionType baseViewBtnSenderBlcok;
@property(nonatomic,copy)BaseViewTableViewDidSelectRowIndexPath baseViewTableViewSelectRowSenderBlock;
@property(nonatomic,copy)BaseViewCollectionViewDidSelectItemIndexPath baseViewCollectionViewDidSelectItemSenderBlock;
@property(nonatomic,copy)BaseViewGestureRecognizer  baseViewGestureRecognizerSenderBlock;
@property(nonatomic,copy)BaseViewTableViewCellBtnAndIndexPath baseViewTableViewCellBtnAndIndexPathSenderBlock;
@property(nonatomic,copy)BaseViewCollectionViewCellBtnAndIndexPath baseViewCollectionViewCellBtnAndIndexPathBlock;
@property(nonatomic,copy)BaseViewCollectionViewSectionBtnAndIndexPath baseViewCollectionViewSectionBtnAndIndexPathBlock;
@property(nonatomic,copy)BaseViewTableViewSectionViewBtnAndSection baseViewTableViewSectionViewBtnAndSectionBlock;

@end
