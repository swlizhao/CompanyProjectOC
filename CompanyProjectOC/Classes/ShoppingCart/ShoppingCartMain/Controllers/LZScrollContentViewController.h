//
//  LZScrollContentViewController.h
//  LifeFinanceDemo
//
//  Created by apple on 2017/9/29.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCartMoreCCell.h"

@interface LZScrollContentViewController : UIViewController

@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,assign)BOOL vcCanScroll;
@property(nonatomic,strong)ShoppingCartMainModel * shoppingCartModel; //展示更多数据

@end
