//
//  LZOrderView.m
//  LifeFinanceDemo
//
//  Created by apple on 2017/10/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LZOrderView.h"

@interface LZOrderView ()

@property(nonatomic,strong)NSMutableArray * itemsArray;

@end


@implementation LZOrderView


- (void)setItemCount:(NSInteger)itemCount {
    _itemCount = itemCount;
    [self setupLZOrderView];
}

- (void)setupLZOrderView {
    if (self.subviews.count > 0) {
      [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    if (_itemCount == 0) {
        NSLog(@"需要创建控件个数为0");
        return;
    }
    _itemsArray = [NSMutableArray array];
    for (int i = 0.; i <_itemCount; i++) {
        LZOrderItem * item = [[LZOrderItem alloc]init];
        item.tag = 100 + i;
        [item addTarget:self action:@selector(itemDidSelect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:item];
        [_itemsArray addObject:item];
    }
    [self setNeedsUpdateConstraints];
}

- (void)setItemDatas:(NSMutableArray<LZOrderModel *> *)itemDatas {
    _itemDatas = itemDatas;
    [self initItemsData];

}

- (void)initItemsData {
    for (int i = 0; i < _itemDatas.count; i++) {
    LZOrderModel * model = [_itemDatas objectAtIndex:i];
    LZOrderItem * item = [_itemsArray objectAtIndex:i];
    item.textLabel.text = model.title;
    item.iconImageView.image = [UIImage imageNamed:model.imageName];
    if (model.badge&&![model.badge isEqualToString:@""]&&![model.badge isEqualToString:@"0"]) {
        item.badgeLabel.text = model.badge;
        item.badgeLabel.hidden = NO;
    }else {
         item.badgeLabel.hidden = YES;
    }

  }
}

- (void)updateConstraints {
    LZOrderItem * lastItem = nil;
    CGFloat widthRadio = 1. / _itemsArray.count;
    for (int i = 0; i < _itemsArray.count; i++) {
        LZOrderItem * item = [_itemsArray objectAtIndex:i];
        if (i == 0) {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self).offset(0);
                make.left.equalTo(self).offset(0);
                make.bottom.equalTo(self).offset(0);
                make.width.equalTo(self).multipliedBy(widthRadio);
            }];
        }else {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lastItem.mas_top).offset(0);
                make.left.equalTo(lastItem.mas_right).offset(0);
                make.height.equalTo(lastItem.mas_height).offset(0);
                make.width.equalTo(lastItem.mas_width);
            }];
        }
        lastItem = item;
    }
    [super updateConstraints];
}

- (void)itemDidSelect:(UIButton *)button {
    if (self.btnClickedBlock) {
        self.btnClickedBlock(button);
    }
}

@end
