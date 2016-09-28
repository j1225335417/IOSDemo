//
//  AppWebViewController.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/28.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "AppWebViewController.h"

@interface AppWebViewController ()
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation AppWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"webView";
    _url = @"http://h5static.niuhome.com/niuhomeAppH5/more/user-terms.html";
    _webView  = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_webView];
    NSURL * nsUrl = [[NSURL alloc]initWithString:_url];
    [_webView loadRequest:[NSURLRequest requestWithURL:nsUrl]];
    _webView.backgroundColor = [UIColor redColor];
    _webView.scalesPageToFit = NO;
    _webView.scrollView.zoomScale = 1.0;
    _webView.scrollView.bounces=NO;  //静止上下弹
//    _webView.scrollView.showsVerticalScrollIndicator = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
