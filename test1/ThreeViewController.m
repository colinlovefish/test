//
//  ThreeViewController.m
//  test1
//
//  Created by yinghu on 16/8/4.
//  Copyright © 2016年 yinghu. All rights reserved.
//

#import "ThreeViewController.h"
#import "ThreeView.h"
#import <WebKit/WebKit.h>


@interface ThreeViewController ()<WKUIDelegate,WKNavigationDelegate>

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ThreeView *three = [[ThreeView alloc] init];
//    three.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
//    [self.view addSubview:three];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    doTheThing(2);
   
    

    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    webView.delegate = self;
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    // Do any additional setup after loading the view.
}

-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%@",navigation);
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    NSLog(@"promot:%@    defaultText:%@",prompt,defaultText);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

void printHello() {
    printf("Hello,world!\n");
}

void printGoodbye() {
    printf("Goodbye,word!\n");
}

void doTheThing(int type) {
    void (*fnc)();
    if (type == 0) {
        fnc = printHello;
    }else {
        fnc = printGoodbye;
    }
    fnc();
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
