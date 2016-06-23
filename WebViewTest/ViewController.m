//
//  ViewController.m
//  WebViewTest
//
//  Created by Игорь Талов on 21.05.16.
//  Copyright © 2016 Игорь Талов. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSURLRequest* request = [NSURLRequest requestWithURL:self.url];
    
    [self.webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"shouldStartLoadWithRequest %@", [request debugDescription]);
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webViewDidStartLoad");
    [self.indicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad");
    [self.indicator stopAnimating];
    
    self.backItem.enabled = [self.webView canGoBack];
    self.forwardItem.enabled = [self.webView canGoForward];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    NSLog(@"didFailLoadWithError");
    [self.indicator stopAnimating];
}

#pragma mark - Actions 

-(IBAction)backAction:(id)sender{
    if ([self.webView canGoBack]) {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}
-(IBAction)forwardAction:(id)sender{
    if ([self.webView canGoForward]) {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}
-(IBAction)refreshAction:(id)sender{
    [self.webView reload];
}

@end
