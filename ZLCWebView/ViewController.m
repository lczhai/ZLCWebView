//
//  ViewController.m
//  ZLCWebView
//
//  Created by 翟留闯 on 16/6/18.
//  Copyright © 2016年 翟留闯. All rights reserved.
//

#import "ViewController.h"
#import "KINWebView.h"
#import "ZLCWebView.h"
@interface ViewController ()<ZLCWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    ZLCWebView *my = [[ZLCWebView alloc]initWithFrame:self.view.bounds];
    [my loadURLString:@"http://www.baidu.com"];
    my.delegate = self;
    [self.view addSubview:my];
    
    

    
}


- (void)zlcwebViewDidStartLoad:(KINWebView *)webview
{
    NSLog(@"页面开始加载");
}

- (void)zlcwebView:(KINWebView *)webview shouldStartLoadWithURL:(NSURL *)URL
{
    NSLog(@"截取到URL：%@",URL);
}
- (void)zlcwebView:(KINWebView *)webview didFinishLoadingURL:(NSURL *)URL
{
    NSLog(@"页面加载完成");
}

- (void)zlcwebView:(KINWebView *)webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error
{
    NSLog(@"加载出现错误");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
