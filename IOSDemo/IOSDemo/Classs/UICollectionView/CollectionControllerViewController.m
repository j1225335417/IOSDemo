//
//  CollectionControllerViewController.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/29.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "CollectionControllerViewController.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshGifHeader.h"
#import "CollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface CollectionControllerViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation CollectionControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UICollectionView";
    UICollectionViewFlowLayout *layout =   [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(85, 80);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing  = 10 ;
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
//    _collectionView.sd_layout.leftSpaceToView(self.view,10).rightSpaceToView(self.view,10).topSpaceToView(self.view,10).heightIs(SCREEN_HEIGHT -10).widthIs(SCREEN_WIDTH - 20);
    [self.view addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView.delegate = self;
    _collectionView.dataSource  =self;
    [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshAction)];
    [_collectionView.mj_header beginRefreshing];
   
    
}

-(void)refreshAction{
    _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    for(int i = 0;i<20;i++){
        _dataArray[i] = @"http://bannerapp.oss-cn-shanghai.aliyuncs.com/n45/level1/jiazheng@3x.png";
    }
    [_collectionView.mj_header endRefreshing];
    [_collectionView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr = @"cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellStr forIndexPath:indexPath];
    if(cell == nil){
        cell  = [[CollectionViewCell alloc]init];
    }
    [cell.imageView sd_setImageWithURL:_dataArray[indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

@end
