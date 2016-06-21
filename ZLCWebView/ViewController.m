//
//  ViewController.m
//  ZLCWebView
//
//  Created by 翟留闯 on 16/6/18.
//  Copyright © 2016年 翟留闯. All rights reserved.
//

#import "ViewController.h"
#import "ZLCWebView.h"

#define isiOS8 __IPHONE_OS_VERSION_MAX_ALLOWED>=__IPHONE_8_0

@interface ViewController ()<ZLCWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ZLCWebView";
    

    
    ZLCWebView *my = [[ZLCWebView alloc]initWithFrame:self.view.bounds];
	[my loadURLString:@"http://www.baidu.com"];
    my.delegate = self;
    [self.view addSubview:my];
    
    

    
}


- (void)zlcwebViewDidStartLoad:(ZLCWebView *)webview
{
    NSLog(@"页面开始加载");
}

- (void)zlcwebView:(ZLCWebView *)webview shouldStartLoadWithURL:(NSURL *)URL
{
    NSLog(@"截取到URL：%@",URL);
}
- (void)zlcwebView:(ZLCWebView *)webview didFinishLoadingURL:(NSURL *)URL
{
    NSLog(@"页面加载完成");
	
}

- (void)zlcwebView:(ZLCWebView *)webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error
{
    NSLog(@"加载出现错误");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
