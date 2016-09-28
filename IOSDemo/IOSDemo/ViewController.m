//
//  ViewController.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/28.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "ViewController.h"
#import "AppWebViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSArray *dataArray;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

static ViewController *viewController;

+(ViewController*)sharedController{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        viewController = [[ViewController alloc]init];
    });
    
    return viewController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  =@"功能列表";
    [self initDataArray];
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [_tableView registerClass:[UITableViewCell class]  forCellReuseIdentifier:@"cell"];
    
}

-(void) initDataArray{
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"functionList" ofType:@"plist"];
    _dataArray = [[NSArray alloc]initWithContentsOfFile:plistPath];
    NSLog(@"%@",_dataArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    if(0 == indexPath.row){
        AppWebViewController *vc = [[AppWebViewController alloc]init];
        [self.navigationController pushViewController:vc animated:NO];
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *value =_dataArray[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = value;
//    cell.selectionStyle  =UITableViewCellSelectionStyleNone;
    cell.accessoryType                         = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.text = @"click";
    return cell;
}
@end
