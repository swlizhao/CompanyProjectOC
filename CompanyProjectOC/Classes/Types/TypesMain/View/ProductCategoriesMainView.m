//
//  ProductCategoriesMainView.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "ProductCategoriesMainView.h"

@implementation ProductCategoriesMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self initConfig];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.leftTableView];
    [self addSubview:self.rightCollectionView];
}

- (void)initConfig {
    [_leftTableView registerClass:NSClassFromString(@"ProductCategoryLeftTableViewCell") forCellReuseIdentifier:@"ProductCategoryLeftTableViewCell"];
    [_rightCollectionView registerClass:NSClassFromString(@"ProductCategoryRightCollectionViewCell") forCellWithReuseIdentifier:@"ProductCategoryRightCollectionViewCell"];
      [_rightCollectionView registerClass:NSClassFromString(@"ProductChildHeaderView") forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ProductChildHeaderView"];
}

#pragma mark - 左边视图赋值
- (void)setParentCategoryDatas:(NSMutableArray *)parentCategoryDatas {
    _parentCategoryDatas = parentCategoryDatas;
    [_leftTableView reloadData];
}

#pragma  mark - 右边视图赋值
- (void)setChildSectionCategotyDatas:(NSMutableArray *)childSectionCategotyDatas {
    _childSectionCategotyDatas = childSectionCategotyDatas;
    [_rightCollectionView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _parentCategoryDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductCategoryLeftTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:productCategoryLeftTableViewCell forIndexPath:indexPath];
    if (!cell) {
        cell = [[ProductCategoryLeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:productCategoryLeftTableViewCell];
    }
    if (_parentCategoryDatas.count > 0) {
        ProductParentCategoriesModel * parentModel = _parentCategoryDatas[indexPath.row];
        cell.model = parentModel;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 46;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.baseViewTableViewSelectRowSenderBlock) {
        self.baseViewTableViewSelectRowSenderBlock(indexPath);
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _childSectionCategotyDatas.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
     ProductChildSectionCategoriesModel * sectionModel = _childSectionCategotyDatas[section];
    return sectionModel.category.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader ) {
        ProductChildHeaderView * sectionView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:productChildHeaderView forIndexPath:indexPath];
        ProductChildSectionCategoriesModel * sectionModel = _childSectionCategotyDatas[indexPath.section];
        sectionView.sectionModel = sectionModel;
        WeakSelf(weakSelf)
        sectionView.baseCollectionReusableViewButtonBlock = ^(UIButton *button) {
            if (weakSelf.baseViewCollectionViewSectionBtnAndIndexPathBlock) {
                weakSelf.baseViewCollectionViewSectionBtnAndIndexPathBlock(button, indexPath);
            }
        };
        
        return sectionView;
    }
    return nil;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCategoryRightCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:productCategoryRightCollectionViewCell forIndexPath:indexPath];
    if (_childSectionCategotyDatas.count > 0) {
        ProductChildSectionCategoriesModel * sectionModel = _childSectionCategotyDatas[indexPath.section];
        ProductChildItemCategoriesModel * itemModel = sectionModel.category[indexPath.item];
        cell.model = itemModel;
    }
    return cell;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.baseViewCollectionViewDidSelectItemSenderBlock) {
        self.baseViewCollectionViewDidSelectItemSenderBlock(indexPath);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.rightCollectionView.frame.size.width - 15)/3, (self.rightCollectionView.frame.size.width - 15)/3 + 40);
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    return 0;
//}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 0;
//}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.rightCollectionView.size.width, 40);
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    return CGSizeMake(200, 150);
//}



#pragma mark - 初始化leftTableView视图
- (UITableView *)leftTableView {
    if (!_leftTableView) {
        _leftTableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, 80, self.bounds.size.height) style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
    }
    return _leftTableView;
}

#pragma mark - 初始化rightCollectionView
- (CommonBaseCollectionView *)rightCollectionView {
    if (!_rightCollectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 5);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _rightCollectionView = [[CommonBaseCollectionView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftTableView.frame) + 5, 0, self.bounds.size.width - CGRectGetMaxX(_leftTableView.frame) - 5, self.bounds.size.height) collectionViewLayout:layout];
        _rightCollectionView.backgroundColor = [UIColor clearColor];
        _rightCollectionView.delegate = self;
        _rightCollectionView.dataSource = self;
//        _rightCollectionView.contentInset = UIEdgeInsetsMake(-120, 0, 0, 0);
        
    }
    return _rightCollectionView;
}

@end
