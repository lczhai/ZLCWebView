[TOC]
#      ZLCWebView     github:  https://github.com/lczhai/ZLCWebView  
-----    

###  将UIWebVIew和WKWebView封装到一起，当系统版本大于8.0时候选择WKWebView降低性能消耗，当小于8.0时候使用UIWebView进行加载
 
 
 
 

##### 1、将项目中的根目录中的“ZLCWebView源文件”中的ZLCWebView.h及m拖入工程（或直接在项目中拖出）
 
##### 2、在项目Targets ->build Phases  ->link Binary With Libraries 中添加WebKit.framework（否则Deployment Target调整成7.0时,运行程序就会报错）

##### 3、在自己的目标视图加载即可

 
 ```objectivec
 //在目标视图内初始化ZLCWebView 
 ZLCWebView *my = [[ZLCWebView alloc]initWithFrame:self.view.bounds];
	[my loadURLString:@"http://www.baidu.com"];
 my.delegate = self;
 [self.view addSubview:my];
 ```
 
 //让视图遵守ZLCWebView的delegate并实现ZLCWebView的delegate
 
 ```objectivec
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
 
 ```
 
 
 
 
 
 
