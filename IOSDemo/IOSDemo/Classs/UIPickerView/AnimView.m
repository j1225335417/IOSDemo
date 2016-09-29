//
//  AnimView.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/29.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "AnimView.h"

@interface AnimView ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,strong)UIView *view;
@end

@implementation AnimView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         [self setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4]];
        _view = [[UIView alloc]initWithFrame:CGRectMake(0, self.height,self.width , 250)];
        
        
        
        [self addSubview:_view];
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0,self.width , 220)];
        [_view addSubview:_pickerView];
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.showsSelectionIndicator = YES;
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
        _proTimeList = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
        _proTitleList = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
        UIButton *btn =  [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"完成" forState:UIControlStateNormal];
        [_view addSubview:btn];
        btn.sd_layout.heightIs(30).leftEqualToView(self).rightEqualToView(self).topSpaceToView(_pickerView,0);
        [btn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}
-(void)hide{
    NSLog(@"关闭");
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        
        _view.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 250);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    
}
-(void)show{
    UIWindow *window = [[UIApplication sharedApplication]keyWindow];
    [window addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        _view.frame = CGRectMake(0, self.height-250, SCREEN_WIDTH, 250);
        self.alpha = 0.5;
    }];
    
}



// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}
// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [_proTitleList count];
    }else if (component == 1){
        return [_proTimeList count];
    }
    return 0;
}
// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    
    return SCREEN_WIDTH/2;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _proNameStr = [_proTitleList objectAtIndex:row];
    } else {
        _proTimeStr = [_proTimeList objectAtIndex:row];
    }
    
}

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [_proTitleList objectAtIndex:row];
    } else {
        return [_proTimeList objectAtIndex:row];
    }
}

@end
