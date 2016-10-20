//
//  LocationController.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/10/12.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "LocationController.h"
#import "LocationHandler.h"

@interface LocationController ()<LocationHandlerDelegate>
//@property(nonatomic,strong)LocationHandler *locationHandler;
@property(nonatomic,strong)UILabel *label1;
@property(nonatomic,strong)UILabel *label2;
@property(nonatomic,strong)UILabel *label3;

@end
int count;
@implementation LocationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"定位";
    _label1 = [UILabel new];
    _label1.frame = CGRectMake(10, 10, 300, 30);
    [self.view addSubview:_label1];
    _label2 = [UILabel new];
    _label2.frame  = CGRectMake(10, 50, 300, 30);
    [self.view addSubview:_label2];
    
    
    _label3 = [UILabel new];
    _label3.frame  = CGRectMake(10, 90, 300, 30);
    [self.view addSubview:_label3];
    
    
    [[LocationHandler getSharedInstance] setDelegate:self];
    [[LocationHandler getSharedInstance] startUpdating];
    
    
    
    
    
}
-(void) didUpdateToLocation:(CLLocation*)newLocation
               fromLocation:(CLLocation*)oldLocation{
    
    [_label1 setText:[NSString stringWithFormat:
                            @"Latitude: %f",newLocation.coordinate.latitude]];
    [_label2 setText:[NSString stringWithFormat:
                             @"Longitude: %f",newLocation.coordinate.longitude]];
    NSLog(@"定位了===");
    count ++;
    _label3.text = [NSString stringWithFormat:@"%d",count];
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
