//
//  ShoppingCartMoreCell.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/26.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "ShoppingCartMoreCell.h"

@implementation ShoppingCartMoreCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
        [self initConfig];
    }
    return self;
}

- (void)initUI {
    
}

- (void)initConfig {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setViewControllers:(NSMutableArray *)viewControllers {
    _viewControllers = viewControllers;
}

- (void)setCellCanScroll:(BOOL)cellCanScroll {
    _cellCanScroll = cellCanScroll;
    for (LZScrollContentViewController * vc in _viewControllers) {
        vc.vcCanScroll = _cellCanScroll;
        if (!_cellCanScroll) { //子视图有可能是多个所以让其全部置顶
            vc.collectionView.contentOffset = CGPointZero;
        }
    }
}


@end
