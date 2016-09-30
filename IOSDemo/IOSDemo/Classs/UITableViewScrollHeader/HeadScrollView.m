//
//  HeadScrollView.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/30.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "HeadScrollView.h"
#import "SDCycleScrollView.h"
#import "UIColor+APPColor.h"
@interface HeadScrollView()<SDCycleScrollViewDelegate>{

}

@property(nonatomic,strong) SDCycleScrollView *adView;
@end

@implementation HeadScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self initData];
        self.adView = [[SDCycleScrollView alloc]initWithFrame:self.bounds];
//        self.adView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imageURLStringsGroup:_datas];
        self.adView = [[SDCycleScrollView alloc]initWithFrame:self.bounds];
        self.adView.showPageControl        = YES;
        self.adView.infiniteLoop           = YES;
        self.adView.delegate               = self;
        self.adView.pageControlStyle       = SDCycleScrollViewPageContolStyleClassic;
        self.adView.autoScrollTimeInterval = 4.0;
        self.adView.pageDotColor           = [UIColor whiteColor];
        self.adView.currentPageDotColor    = [UIColor themeGreenColor];
        
        self.adView.infiniteLoop           = NO;
        self.adView.autoScroll = NO;
        
        [self addSubview:_adView];
         [self initData];
    }
    return self;
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"点击了%ld",index);
}

-(void)initData{
    _datas = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i<10; i++) {
        _datas[i] = @"http://bannerapp.oss-cn-shanghai.aliyuncs.com/n45/level_0/banner_v46_01.png";
    }
//    _datas[0] = @"http://bannerapp.oss-cn-shanghai.aliyuncs.com/n45/level_0/banner_v46_01.png";
//    _datas[1] = @"http://bannerapp.oss-cn-shanghai.aliyuncs.com/img/xiyi_product/xiyi-huodong-home.png";
    _adView.imageURLStringsGroup = _datas;
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
    NSLog(@"%ld",index);
}


@end
