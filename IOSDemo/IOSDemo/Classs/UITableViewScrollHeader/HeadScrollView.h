//
//  HeadScrollView.h
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/30.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadScrollView : UIView

@property(nonatomic,strong)void(^ImageOnclick)(NSString* imageUrl);
@property(nonatomic,strong)NSMutableArray* datas;
@end
