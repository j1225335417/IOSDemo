//
//  KitsController.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/10/10.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "KitsController.h"

@interface KitsController ()

@end

@implementation KitsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"kits";
    UIButton*btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 10, 100, 30);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn.titleLabel setShadowOffset:CGSizeMake(0, -3)];
    [btn.titleLabel setShadowColor:[UIColor redColor]];
    
}

-(void)click:(UIButton*)btn{
    btn.showsTouchWhenHighlighted = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
