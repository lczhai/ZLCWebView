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
{
    NSString *_urlStr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ZLCWebView";
    _urlStr = @"http://www.baidu.com";
    
    

    
    ZLCWebView *my = [[ZLCWebView alloc]initWithFrame:self.view.bounds];
    
    
//    //获取本地缓存路径及获取页面缓存的html（慎用）
//    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) objectAtIndex:0];
//    NSString * path = [cachesPath stringByAppendingString:[NSString stringWithFormat:@"/Caches/%u.html",(unsigned)[_urlStr hash]]];
//    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    
//    //判断是否加载过（是否已缓存过）
//    if (!(htmlString ==nil || [htmlString isEqualToString:@""])) {
//        [my loadHTMLString:htmlString];
//    }else{
//        NSURL *url = [NSURL URLWithString:_urlStr];
//        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:2 timeoutInterval:5];
//        [my loadRequest:request];
//        [self writeToCache];
//    }
    
    NSURL *url = [NSURL URLWithString:_urlStr];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:2 timeoutInterval:5];
    [my loadRequest:request];
    
    my.delegate = self;
    [self.view addSubview:my];
	

    
}

/**
 * 网页缓存写入文件
 */
- (void)writeToCache
{
    NSString * htmlResponseStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:_urlStr] encoding:NSUTF8StringEncoding error:Nil];
    //创建文件管理器
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    //获取document路径
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,      NSUserDomainMask, YES) objectAtIndex:0];
    [fileManager createDirectoryAtPath:[cachesPath stringByAppendingString:@"/Caches"] withIntermediateDirectories:YES attributes:nil error:nil];
    //写入路径
    NSString * path = [cachesPath stringByAppendingString:[NSString stringWithFormat:@"/Caches/%u.html",(unsigned)[_urlStr hash]]];
    
    [htmlResponseStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
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
