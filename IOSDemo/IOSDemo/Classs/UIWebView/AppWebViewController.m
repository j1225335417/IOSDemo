//
//  AppWebViewController.m
//  IOSDemo
//
//  Created by niuhome_vip on 16/9/28.
//  Copyright © 2016年 niuhome_vip. All rights reserved.
//

#import "AppWebViewController.h"
#import "NJKWebViewProgress.h"
#import "WebViewJavascriptBridge.h"
#import "Tools.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface AppWebViewController ()<UIWebViewDelegate,NJKWebViewProgressDelegate>
@property(nonatomic,strong)UIWebView *webView;
@property (nonatomic       ) NJKWebViewProgress     * progressProxy;
@property (strong, nonatomic) WebViewJavascriptBridge *javascriptBridge;
@end

@implementation AppWebViewController
@synthesize javascriptBridge = _bridge;
- (void)viewDidLoad {
    [super viewDidLoad];
//    [Tools setNavigationBar:self.navigationItem withImage:@"navBackBtn" withIsLeft:YES withTarget:self withSel:@selector(goBack) ];
//    [Tools setNavigationBarWithValue:self.navigationItem withImage:@"navBackBtn" withIsLeft:YES withTarget:self withSel:@selector(goBack) value:self.navigationItem.leftBarButtonItem.title];
//    [Tools setNavigationBar:self.navigationItem withImage:@"navBackBtn" withTitle:self.navigationItem.leftBarButtonItem.title withIsLeft:YES withTarget:self withSel:@selector(goBack)];
    
    self.title = @"正在加载...";
//    _url = @"http://api.nmw.niuhome.com/common/v1/commweb/jzywlistindex?menu_type=0&source=ios&versionCode=436&city_id=1";
    _url = @"https://www.baidu.com/";
    _webView  = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_webView];
    NSURL * nsUrl = [[NSURL alloc]initWithString:_url];
    [_webView loadRequest:[NSURLRequest requestWithURL:nsUrl]];
//    NSString *locationPath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
//     NSURL * locationNsUrl = [[NSURL alloc]initFileURLWithPath:locationPath];
//    [_webView loadRequest:[NSURLRequest requestWithURL:locationNsUrl]];
    _webView.backgroundColor = [UIColor redColor];
    _webView.scalesPageToFit = NO;
    _webView.scrollView.zoomScale = 1.0;
    _webView.scrollView.bounces=NO;  //静止上下弹
//    _webView.scrollView.showsVerticalScrollIndicator = NO;
    _webView.delegate = self.progressProxy;
}


//实现webView的代理方法

-(NJKWebViewProgress*)progressProxy{
    if (!_progressProxy) {
        _progressProxy = [[NJKWebViewProgress alloc] init];
        _progressProxy.webViewProxyDelegate = (id)self;
        _progressProxy.progressDelegate = (id)self;
    }
    return _progressProxy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    NSString *theTitle=[_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if (theTitle.length > 10) {
        theTitle = [[theTitle substringToIndex:10] stringByAppendingString:@"…"];
    }
        self.title = theTitle;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    [WebViewJavascriptBridge enableLogging];
    _bridge = [WebViewJavascriptBridge bridgeForWebView:_webView handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"JS 调 原声");
    }];
     WS(ws);
    [_bridge setWebTitleCallback:^(NSString *strTitle) {
            ws.title = strTitle;
    }];
    return YES;
}

-(void)goBack{
    if([_webView canGoBack]){
        [_webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.webView stopLoading];
    self.webView.delegate = nil;
}
-(void)dealloc{
    self.webView.delegate = nil;
    
}
@end
