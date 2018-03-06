//
//  PersonalMainView.h
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseView.h"
#import "BaseTableView.h"
#import "PersonalOrderCell.h"
#import "PersonalMainCell.h"
#import "PersonalSectionView.h"
#import "PersonalHeadView.h"
@interface PersonalMainView : BaseView

@property(nonatomic,strong)BaseTableView * baseTableView;
@property(nonatomic,strong)NSMutableArray * orderDatas;
@property(nonatomic,strong)NSMutableArray * datas;
@property(nonatomic,copy)void (^scrollViewDidScrollNavColorAlphaBlock)(UIScrollView * scrollView , CGFloat colorAlphaRadio);
@property(nonatomic,copy)void(^headViewBtnType)(UIButton *button);

@end
