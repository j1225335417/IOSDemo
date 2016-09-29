//
//  CollectionViewCell.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/29.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 85, 80)];
        _imageView.sd_layout.centerXEqualToView(self);
        [self addSubview:_imageView];
        
    }
    return self;
}

@end
