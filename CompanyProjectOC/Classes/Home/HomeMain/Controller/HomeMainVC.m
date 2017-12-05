//
//  HomeMainVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "HomeMainVC.h"

@interface HomeMainVC ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation HomeMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)btnAction:(UIButton *)sender {
    UIViewController * vc = [STORYBOARD_MAIN instantiateViewControllerWithIdentifier:@"HomeDetailViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
