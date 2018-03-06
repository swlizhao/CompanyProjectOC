//
//  LZOrderView.h
//  LifeFinanceDemo
//
//  Created by apple on 2017/10/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZOrderItem.h"
#import "LZOrderModel.h"
@interface LZOrderView : UIView

@property(nonatomic,assign)NSInteger itemCount;
@property(nonatomic,strong)NSMutableArray<LZOrderModel*> * itemDatas;
@property(nonatomic,copy)void(^btnClickedBlock)(UIButton * button);
@end
