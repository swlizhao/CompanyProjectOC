//
//  ShoppingCartMainView.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "ShoppingCartMainView.h"

@interface ShoppingCartMainView ()

@property(nonatomic,strong)ShoppingCartMoreCell *contentCell;
@end

@implementation ShoppingCartMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self initConfig];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.shoppingTableView];
}

- (void)initConfig {
    [_shoppingTableView registerClass:[ShoppingCartMainCell class] forCellReuseIdentifier:shoppingCartMainCell];
    [_shoppingTableView registerClass:[ShoppingCartMoreCell class] forCellReuseIdentifier:shoppingCartMoreCell];
    self.canScroll = YES; //初始化为YES,tableView是可以滑动状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];
}

- (void)changeScrollStatus {
    self.canScroll = YES;
    self.contentCell.cellCanScroll = NO;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"leaveTop" object:nil];
}

- (void)setShoppingCartModel:(ShoppingCartMainModel *)shoppingCartModel {
    _shoppingCartModel = shoppingCartModel;
    [_shoppingTableView reloadData];
   
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _shoppingCartModel.shoppingCart.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == _shoppingCartModel.shoppingCart.count) {
        return 1; //更多
    }else {
        return  _shoppingCartModel.shoppingCart.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == _shoppingCartModel.shoppingCart.count) {
        ShoppingCartMoreCell * cell = [tableView dequeueReusableCellWithIdentifier:shoppingCartMoreCell forIndexPath:indexPath];
        if (!cell) {
            cell = [[ShoppingCartMoreCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shoppingCartMoreCell ];
        }
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        NSArray * titles = @[@"默认"];
        NSMutableArray * contentVCs = [NSMutableArray array];
        for (int i = 0; i < titles.count; i++) {
            NSString * title = titles[i];
            LZScrollContentViewController * vc = [[LZScrollContentViewController alloc]init];
            vc.title = title;
            vc.shoppingCartModel = _shoppingCartModel;
            [contentVCs addObject:vc];
        }
        cell.viewControllers = contentVCs;
        cell.pageContentView = [[FSPageContentView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 50) childVCs:contentVCs parentVC:_parentVC delegate:self];
        [cell.contentView addSubview:cell.pageContentView];
        cell.contentView.backgroundColor = [UIColor yellowColor];
        _contentCell = cell;
        
        cell.backgroundColor = arc4randomColor;
        return cell;
    }else {
        ShoppingCartMainCell * cell = [tableView  dequeueReusableCellWithIdentifier:shoppingCartMainCell forIndexPath:indexPath];
        if (!cell) {
            cell = [[ShoppingCartMainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shoppingCartMainCell];
        }
        if (_shoppingCartModel.shoppingCart.count > 0) {
            WeakSelf(weakSelf)
            ShoppingCartShopModel * shopModel = _shoppingCartModel.shoppingCart[indexPath.section];
            ShoppingCartProductModel * productModel = shopModel.productList[indexPath.row];
            if (indexPath.row == shopModel.productList.count - 1) {
                cell.baseBottomLineImgView.hidden = YES;
            }else {
                cell.baseBottomLineImgView.hidden = NO;
            }
            cell.productModel = productModel;
            cell.baseTableViewCellButtonClickBlock = ^(UIButton *button) {
              [weakSelf cellBtnActionWithBtn:button indexPath:indexPath];
            };
        
        }
        
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ShoppingCartSectionView * sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:shoppingCartSectionView];
    if (!sectionView) {
        sectionView = [[ShoppingCartSectionView alloc]initWithReuseIdentifier:shoppingCartSectionView];
    }
    
    if (_shoppingCartModel.shoppingCart.count == section) {
        sectionView.isMore = YES;
    }else {
        sectionView.isMore = NO;
        ShoppingCartShopModel * sectionModel = _shoppingCartModel.shoppingCart[section];
        sectionView.shopModel = sectionModel;
        WeakSelf(weakSelf)
        sectionView.baseTableViewHeaderFooterViewButtonBlock = ^(UIButton *button) {
            [weakSelf sectionBtnActionWithBtn:button section:section];
        };
    }
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == _shoppingCartModel.shoppingCart.count) {
        return self.bounds.size.height - 50;
    }
    ShoppingCartShopModel * shopModel = _shoppingCartModel.shoppingCart[indexPath.section];
    ShoppingCartProductModel * productModel = shopModel.productList[indexPath.row];
    return [tableView  cellHeightForIndexPath:indexPath model:productModel keyPath:@"productModel" cellClass:NSClassFromString(@"ShoppingCartMainCell") contentViewWidth:self.bounds.size.width];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == _shoppingCartModel.shoppingCart.count) {
        return nil;
    }else {
        UITableViewRowAction * deleAction1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            NSLog(@"我是左滑删除按钮被点击了...");
        }];
        return @[deleAction1];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRow --->  section:%d -- row:%d",indexPath.section,indexPath.row);
}

#pragma mark - FSPageContentViewDelegate
- (void)FSContentViewWillBeginDragging:(FSPageContentView *)contentView {
    NSLog(@"我将要开始拖拽");
}

- (void)FSContentViewDidScroll:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress {
    NSLog(@"开始滑动");
}

- (void)FSContenViewDidEndDecelerating:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    NSLog(@"结束滑动");
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat bottomSectionOffset = [_shoppingTableView rectForSection:2].origin.y;
    CGFloat bottomCellOffset = bottomSectionOffset + 50;
    //    NSLog(@"我是主视图我滚动了--offsetY:%f --bottomSectionOffset：%f - bottomCellOffset:%f",offsetY,bottomSectionOffset,bottomCellOffset);
    if (offsetY >= bottomSectionOffset) { //滑动的主视图滑动的位置大于或等于期望值的偏移量
        scrollView.contentOffset = CGPointMake(0, bottomSectionOffset);//此处相当于把UITableView固定在一个地方，视觉上是不再滑动 （此处选择固定section头部，也可以选择固定在cell偏移量处）
        if (self.canScroll) { //固定之后就 tableView假性固定，因为偏移量写死
            self.canScroll = NO;//此处更新状态 tableView处于一个固定值偏移量上
            self.contentCell.cellCanScroll = YES; //子视图的滑动视图可以滑动了,更新状态
        }
    }else {
        //第一种情况：tableView头部固定的时候，可以通过下拉头部返回，不用做任何处理
        //第二种情况：只能通过下拉子视图返回
        //为了更好的UI体验建议选择第二种
        if (!self.canScroll) {//通过子视图下拉返回的时候
            scrollView.contentOffset = CGPointMake(0, bottomSectionOffset);
        }
    }
    self.shoppingTableView.showsVerticalScrollIndicator = self.canScroll ? YES : NO;
}


#pragma mark - 初始化视图
- (BaseTableView *)shoppingTableView {
    if (!_shoppingTableView) {
        _shoppingTableView = [[BaseTableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _shoppingTableView.delegate = self;
        _shoppingTableView.dataSource = self;
        _shoppingTableView.backgroundColor = [UIColor clearColor];
    }
    return _shoppingTableView;
}

#pragma mark - tableViewSection上面按钮点击事件
- (void)sectionBtnActionWithBtn:(UIButton *)button section:(NSInteger)section {
    if (button.tag == 10000) {
        [self sectionSelectStatusWithSectionBtn:button section:section];
    }
}

#pragma mark - section选中与未选中点击事件
- (void)sectionSelectStatusWithSectionBtn:(UIButton *)button section:(NSInteger)section{
    //获取当前section
     ShoppingCartShopModel * currentShopModel = _shoppingCartModel.shoppingCart[section];
   //如果是未选中改为选中，反之
    if (currentShopModel.sectionSelect == 0) {
        currentShopModel.sectionSelect = 1;
        //使该分区所有cell全部处于选中状态，即：cellSelectStatus = 1
        for (ShoppingCartProductModel * productModel in currentShopModel.productList) {
            productModel.cellSelectStatus = 1;
        }
    }else {
        currentShopModel.sectionSelect = 0;
        for (ShoppingCartProductModel * productModel in currentShopModel.productList) {
            productModel.cellSelectStatus = 0;
        }
    }
    [_shoppingTableView reloadData];
}

#pragma mark - tableViewCell上面按钮点击事件
- (void)cellBtnActionWithBtn:(UIButton *)button indexPath:(NSIndexPath *)indexPath {
    NSLog(@"btnTag:%ld--- section:%ld --- row:%ld",button.tag,indexPath.section,indexPath.row);
    if (button.tag == 10000) {
        [self cellSelectStatusWithSelectBtn:button indexPath:indexPath];
    }
}

#pragma mark - cell选中与未选中的点击事件
- (void)cellSelectStatusWithSelectBtn:(UIButton *)button indexPath:(NSIndexPath *)indexPath {
    NSMutableArray * cellSelectArray = [NSMutableArray array];
    ShoppingCartShopModel * shopModel = _shoppingCartModel.shoppingCart[indexPath.section];
    ShoppingCartProductModel * currentProductModel = shopModel.productList[indexPath.row];
    //判断当前的cellSelect状态，是0改为1，1改为0
    if (currentProductModel.cellSelectStatus == 0) {
        currentProductModel.cellSelectStatus = 1;
    }else {
        currentProductModel.cellSelectStatus = 0;
    }
    //判断当前cell所在的分区所有cell选中状态，选中（cellSelectStatus=1）的cell模型添加到 cellSelectArray数组中去
    for (int i = 0; i < shopModel.productList.count; i++) {
        ShoppingCartProductModel * productModel = shopModel.productList[i];
        if (productModel.cellSelectStatus == 1) {
            [cellSelectArray addObject:productModel];
        }
    }
    //判断选中cell的数组个数与分区cell个数是否相等，是当前分区全部选中，改为1 否改为0
    if (cellSelectArray.count == shopModel.productList.count) {
        shopModel.sectionSelect = 1;
    }else {
        shopModel.sectionSelect = 0;
    }
    //刷新视图
    [_shoppingTableView reloadData];
}

@end
