//
//  LZScrollContentViewController.m
//  LifeFinanceDemo
//
//  Created by apple on 2017/9/29.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LZScrollContentViewController.h"

@interface LZScrollContentViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSMutableArray * dataSources;

@end

@implementation LZScrollContentViewController

- (NSMutableArray *)dataSources {
    if (!_dataSources) {
        _dataSources = [NSMutableArray array];
        [_dataSources addObject:@"1"];
        [_dataSources addObject:@"2"];
        [_dataSources addObject:@"3"];
        [_dataSources addObject:@"4"];
        [_dataSources addObject:@"5"];
        [_dataSources addObject:@"6"];
        [_dataSources addObject:@"7"];
        [_dataSources addObject:@"1"];
        [_dataSources addObject:@"2"];
        [_dataSources addObject:@"3"];
        [_dataSources addObject:@"4"];
        [_dataSources addObject:@"5"];
        [_dataSources addObject:@"6"];
        [_dataSources addObject:@"7"];
    }
    return _dataSources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self initConfig];
}

- (void)setup {
   [self.view addSubview:self.collectionView];
}

- (void)initConfig {
    _collectionView.backgroundColor = RGB(242, 242, 242);
    self.view.backgroundColor =[UIColor redColor];
}

#pragma mark - UICollectionViewDataSources,delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _shoppingCartModel.moreProduct.count;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShoppingCartMoreCCell * cell = (ShoppingCartMoreCCell *)[collectionView dequeueReusableCellWithReuseIdentifier:shoppingCartMoreCCell forIndexPath:indexPath];
    ShoppingCartMoreProductModel * moreModel = _shoppingCartModel.moreProduct[indexPath.item];
    cell.moreModel = moreModel;
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(8, 10, 0, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.bounds.size.width - 30)/2,(self.view.bounds.size.width - 30)/2 + 40);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"更多商品--->item--->被点击");

}

#pragma mark ---UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"接触屏幕");
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"离开屏幕");
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"我是子视图开始滚动了...contentOffset.y:%f --self.vcCanScroll：%d",scrollView.contentOffset.y,self.vcCanScroll);
    if (!self.vcCanScroll) {//初始化的时候 处于NO 状态 所以不让子视图进行滑动，进行偏移量固定在CGPointZero，只有等YES的时候才让他进行滑动
        scrollView.contentOffset = CGPointZero;
    }
    if (scrollView.contentOffset.y <= 0) {//下拉回到顶部的时候
        self.vcCanScroll = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"leaveTop" object:nil];
    }
    self.collectionView.showsVerticalScrollIndicator = _vcCanScroll ? YES : NO;
}

#pragma mark - init
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 50 - STATUS_NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:NSClassFromString(@"ShoppingCartMoreCCell") forCellWithReuseIdentifier:@"ShoppingCartMoreCCell"];
    }
       return _collectionView;
}


@end
