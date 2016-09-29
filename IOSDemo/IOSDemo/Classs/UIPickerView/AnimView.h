//
//  AnimView.h
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/29.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimView : UIView
@property(nonatomic,strong)UIPickerView* pickerView;
@property(nonatomic,strong)NSArray *proTimeList;
@property(nonatomic,strong)NSArray *proTitleList;
@property(nonatomic,strong) NSString *proNameStr;
@property(nonatomic,strong) NSString *proTimeStr;

-(void)show;
-(void)hide;
@end
