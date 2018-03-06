//
//  TestViewController.m
//  CompanyProjectOC
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "TestViewController.h"
#import "Test1ViewController.h"
#import "BasePageViewController.h"
@interface TestViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (nonatomic, strong) NSArray *pageContentArray;
@end

@implementation TestViewController

- (NSArray *)pageContentArray {
    if (!_pageContentArray) {
        NSMutableArray *arrayM = [[NSMutableArray alloc] init];
        for (int i = 1; i < 10; i++) {
            NSString *contentString = [[NSString alloc] initWithFormat:@"This is the page %d of content displayed using UIPageViewController", i];
            [arrayM addObject:contentString];
        }
        _pageContentArray = [[NSArray alloc] initWithArray:arrayM];
        
    }
    return _pageContentArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPageVC];
    self.title = @"TEST";
}

- (void)initPageVC {
    NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey : @(20)};
    BasePageViewController * pageVC = [[BasePageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal  options:options];
    pageVC.delegate = self;
    pageVC.dataSource = self;
    Test1ViewController * vcs = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:vcs];
    [pageVC setViewControllers:viewControllers
                                  direction:UIPageViewControllerNavigationDirectionReverse
                                   animated:NO
                                 completion:nil];
    pageVC.view.frame = self.view.bounds;
    [self addChildViewController:pageVC];
    [self.view addSubview:pageVC.view];
    
}

- (Test1ViewController *)viewControllerAtIndex:(NSInteger)index {
    if (([self.pageContentArray count] == 0) || (index >= [self.pageContentArray count])) {
        return nil;
    }
    // 创建一个新的控制器类，并且分配给相应的数据
    Test1ViewController *contentVC = [[Test1ViewController alloc] init];
     contentVC.content = [self.pageContentArray objectAtIndex:index];
    return contentVC;
}

#pragma mark - 数组元素值，得到下标值
- (NSUInteger)indexOfViewController:(Test1ViewController *)viewController {
    return [self.pageContentArray indexOfObject:viewController.content];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:(Test1ViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:(Test1ViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [self.pageContentArray count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}


@end
