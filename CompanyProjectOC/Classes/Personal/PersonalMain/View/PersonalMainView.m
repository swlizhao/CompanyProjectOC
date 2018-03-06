//
//  PersonalMainView.m
//  CompanyProjectOC
//
//  Created by apple on 2017/12/2.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "PersonalMainView.h"

@interface PersonalMainView () <UITableViewDataSource,UITableViewDelegate> {
    CGFloat imgRadio;
    CGRect  originalFrame; //初始frame
    CGFloat headeHeight;
}

@property(nonatomic,strong)UIImageView * headImg;

@end

@implementation PersonalMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)_setup {
    imgRadio = 0.5;
    headeHeight = SCREEN_WIDTH * imgRadio;
    _headImg = [[UIImageView alloc]init];
    _headImg.frame = CGRectMake(0, 0, SCREEN_WIDTH, headeHeight);
    _headImg.image = [UIImage imageNamed:@"哈士奇"];
    originalFrame = _headImg.frame;
    [self addSubview:_headImg];
    WeakSelf(weakSelf)
    self.baseTableView = [self creatBaseTableView];
    [self addSubview:self.baseTableView];
    PersonalHeadView * headView = [[PersonalHeadView  alloc]init];
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, headeHeight);
    headView.backgroundColor = [UIColor clearColor];
    [self.baseTableView setTableHeaderView:headView];
    headView.baseViewBtnSenderBlcok = ^(UIButton *button) {
        if (weakSelf.headViewBtnType) {
            weakSelf.headViewBtnType(button);
        }
    };

}

#pragma mark - 管理赋值
- (void)setOrderDatas:(NSMutableArray *)orderDatas {
    _orderDatas = orderDatas;
    [_baseTableView reloadSection:0 withRowAnimation:UITableViewRowAnimationFade];
}

- (void)setDatas:(NSMutableArray *)datas {
    _datas = datas;
    [_baseTableView reloadSection:1 withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PersonalOrderCell * cell = [tableView dequeueReusableCellWithIdentifier:personalOrderCell];
        if (!cell) {
            cell = [[PersonalOrderCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalOrderCell];
        }
        if (_orderDatas.count > 0) {
            WeakSelf(weakSelf)
            cell.orderdatas = _orderDatas;
            cell.baseTableViewCellButtonClickBlock = ^(UIButton *button) {
                if (weakSelf.baseViewButtonSenderBlock) {
                    weakSelf.baseViewButtonSenderBlock(button);
                }
          
            };
        }
        return cell;
    }
    
    PersonalMainCell * cell = [tableView dequeueReusableCellWithIdentifier:personalMainCell];
    if (!cell) {
        cell = [[PersonalMainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalMainCell];
    }
    if (_datas.count > 0){
        PersonalMainModel * model = _datas[indexPath.row];
        cell.model = model;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 50;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    }
    return 50;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PersonalSectionView * sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:personalSectionView];
    if (!sectionView) {
        sectionView = [[PersonalSectionView  alloc]initWithReuseIdentifier:personalSectionView];
    }
    if (section == 0) {
        sectionView.contentView.backgroundColor = [UIColor whiteColor];
        sectionView.isHidden = NO;
    }else {
        sectionView.contentView.backgroundColor = RGB(245, 245, 245);
        sectionView.isHidden = YES;
    }
    WeakSelf(weakSelf)
    sectionView.baseTableViewHeaderFooterViewButtonBlock = ^(UIButton *button) {
        if (weakSelf.baseViewTableViewSectionViewBtnAndSectionBlock) {
            weakSelf.baseViewTableViewSectionViewBtnAndSectionBlock(button, section);
        }
    };
    return sectionView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        
    }else {
        if (self.baseViewTableViewSelectRowSenderBlock) {
            self.baseViewTableViewSelectRowSenderBlock(indexPath);
        }
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offSetY = scrollView.contentOffset.y;
    NSLog(@"偏移量offSetY:%f",offSetY);
    if (offSetY < headeHeight) { //未超过指定位置
       CGFloat colorAlphaRadio = offSetY/headeHeight;
    }else {
       //超过指定位置
    }
    CGFloat colorRadio = offSetY/headeHeight;
    if (self.scrollViewDidScrollNavColorAlphaBlock) {
        self.scrollViewDidScrollNavColorAlphaBlock(scrollView, colorRadio);
    }
    if (offSetY > 0) { //相对于初始位置，往上移动
        CGFloat originY = originalFrame.origin.y - offSetY;
        _headImg.frame = CGRectMake(0, originY, originalFrame.size.width,originalFrame.size.height);
    }else { //相对初始位置，往下移动
        //复合语句
        _headImg.frame = ({
            CGRect frame = originalFrame;
            frame.size.height = originalFrame.size.height - offSetY;
            frame.size.width = frame.size.height/imgRadio;
            frame.origin.x = originalFrame.origin.x - (frame.size.width - originalFrame.size.width)/2;
            frame;
        });
    }
   
}

- (BaseTableView *)creatBaseTableView {
    _baseTableView = [[BaseTableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    _baseTableView.showsVerticalScrollIndicator = YES;
    _baseTableView.dataSource = self;
    _baseTableView.delegate = self;
    _baseTableView.backgroundColor = [UIColor clearColor];
    return _baseTableView;
}

@end
