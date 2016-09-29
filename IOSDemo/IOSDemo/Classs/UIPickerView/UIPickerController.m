//
//  UIPickerController.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/29.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "UIPickerController.h"
#import "LHDefines.h"
#import "AnimView.h"

@interface UIPickerController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UIPickerView* pickerView;
@property(nonatomic,strong)NSArray *proTimeList;
@property(nonatomic,strong)NSArray *proTitleList;
@property(nonatomic,strong) NSString *proNameStr;
@property(nonatomic,strong) NSString *proTimeStr;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
@end

@implementation UIPickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIPickerView";
    
    
    
     _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , 250)];
    [self.view addSubview:_pickerView];
    _pickerView.backgroundColor = [UIColor blueColor];
    _pickerView.showsSelectionIndicator = YES;
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    _proTimeList = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    _proTitleList = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];

    _btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btn1 setTitle:@"UP" forState:UIControlStateNormal];
    [self.view addSubview:_btn1];
    _btn1.sd_layout.heightIs(50).topSpaceToView(_pickerView,20).centerXEqualToView(self.view).widthIs(50);
    [_btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btn2 setTitle:@"DOWN" forState:UIControlStateNormal];
    [self.view addSubview:_btn2];
    [_btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    _btn2.sd_layout.heightIs(50).topSpaceToView(_btn1,20).centerXEqualToView(self.view).widthIs(50);
}

-(void)btnAction:(UIButton *)btn{
    if(btn == _btn1){
        NSLog(@"1");
    }else if(btn == _btn2){
        NSLog(@"2");
        AnimView * view = [[AnimView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        [view show];
        
    }
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
