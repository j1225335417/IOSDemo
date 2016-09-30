//
//  TableViewScrollHeader.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/30.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "TableViewScrollHeader.h"
#import "HeadScrollView.h"
#import "UIScrollView+HeaderScaleImage.h"
#import "MJRefreshAutoNormalFooter.h"
#import "MJRefreshGifHeader.h"
@interface TableViewScrollHeader ()<UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)HeadScrollView *headView;
@end

@implementation TableViewScrollHeader

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TableViewScrollHeader";
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    self.tableView.yz_headerScaleImage = [UIImage imageNamed:@"header"];
    _headView = [[HeadScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/2)];
    _headView.backgroundColor = [UIColor clearColor];
    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/2)];
    
    [_tableView setTableHeaderView:_headView];
    _tableView.yz_headerScaleImageHeight = SCREEN_WIDTH/2;
    
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMore];
    }];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.dataSource = self;
    [self initData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr forIndexPath:indexPath];
    if(cell ==nil  ){
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellStr];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

-(void) initData{
    _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i =0; i<20; i++) {
        _dataArray[i] =[ NSString stringWithFormat:@"%d",i];
    }
    [_tableView reloadData];
}

-(void) loadMore{
    int ii =[[NSString stringWithFormat:@"%lu",_dataArray.count] intValue];;
    
    for (int i = ii  ; i<ii + 5; i++) {
        _dataArray[i] = [NSString stringWithFormat:@"%d",i];
    }
    [_tableView.mj_footer endRefreshing];
    [_tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
