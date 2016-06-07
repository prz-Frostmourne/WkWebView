//
//  ViewController.m
//  WkWebView
//
//  Created by 贤田科技 on 16/5/13.
//  Copyright © 2016年 贤田科技. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController ()<WKScriptMessageHandler>
@property (nonatomic,strong) WKWebView *mainView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(myBackAction)];
    
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    
    
    [config.userContentController addScriptMessageHandler:self name:@"abc"];
    [config.userContentController addScriptMessageHandler:self name:@"qwe"];
    
    
    
    self.mainView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) configuration:config];
    [self.view addSubview:self.mainView];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.mainView loadRequest:request];
    
//    [self.mainView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://haoban2.xiantian.mobi/app/activity/published?userId=8ec2c9e73165435e96a00b17d96f62e4&sign=0CAF4E30282E10E40E3FA9349E2C9C6F"]]];
    //网页加载过程(开始返回内容,完成,失败) 是否跳转(发送请求前,)   的delegate
//    self.mainView.navigationDelegate = self;
    //网页各种UI框的代理
//    self.mainView.UIDelegate = self;
    //内置前景后退手势
//    self.mainView.allowsBackForwardNavigationGestures = YES;
 
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
    NSLog(@"点击了");
    
    NSLog(@"%@", message.name );
    NSLog(@"%@",message.body);
}

- (void)myBackAction{
    if ([self.mainView canGoBack]) {
        [self.mainView goBack];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
