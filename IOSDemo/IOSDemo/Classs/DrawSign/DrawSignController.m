//
//  DrawSignController.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/10/20.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "DrawSignController.h"
#import "DrawSignView.h"
@interface DrawSignController ()

@end

@implementation DrawSignController

- (void)viewDidLoad {
    [super viewDidLoad];
    if( ([UIDevice version]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    // Do any additional setup after loading the view.
    self.title = @"签名";
//    self.navigationController.navigationBarHidden = YES;
//    self.navigationController.navigationBar.translucent = NO;
    
    DrawSignView * view = [[DrawSignView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 80)];
    
    [self.view addSubview:view];
//    view.sd_layout.topSpaceToView(self.view,0).leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
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
