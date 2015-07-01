//
//  ViewController.m
//  CCDeals
//
//  Created by April on 6/25/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "DPAPI.h"
#import "DPRequest.h"
#import "CCDeal.h"
#import "CCDealsCollectionViewController.h"
#import "CCDealManager.h"

@interface ViewController () <DPRequestDelegate>

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 管理者从网络获得数据
    [CCDealManager sentResquestWithCity:@"深圳" andRegion:@"宝安区" andCategory:@"小吃" andKeyWord:@"包子" andOtherValue:nil];
    self.title = @"美团";
    [self loadHomePage];
}

- (void)loadHomePage
{
    
    
    // 1.准备一个URL@"";
    NSString *urlString = @"http://sz.meituan.com/?utm_campaign=baidu&utm_medium=organic&utm_source=baidu&utm_content=homepage&utm_term=ios%2520%25E6%2580%258E%25E4%25B9%2588%25E8%25AE%25BE%25E7%25BD%25AE%25E5%2588%25A0%25E9%2599%25A4%25E7%25BA%25BF";
    NSURL *webURL = [NSURL URLWithString:urlString];
    // 2.根据url准备一个请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:webURL];
    // 3.发送请求
    NSError *requestError = nil;
    NSData *receivedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&requestError];
    if(!receivedData && requestError)
    {
        NSLog(@"receiveData failed:%@",requestError.userInfo);
    }
    NSLog(@"收到%ld字节数据",receivedData.length);
    
    //    [self.webView loadData:receivedData MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:nil];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
