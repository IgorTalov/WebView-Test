//
//  ViewController.h
//  WebViewTest
//
//  Created by Игорь Талов on 21.05.16.
//  Copyright © 2016 Игорь Талов. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(weak, nonatomic) IBOutlet UIWebView* webView;
@property(weak, nonatomic) IBOutlet UIActivityIndicatorView* indicator;
@property(weak, nonatomic) IBOutlet UIBarButtonItem* backItem;
@property(weak, nonatomic) IBOutlet UIBarButtonItem* forwardItem;

@property(strong, nonatomic) NSURL* url;

-(IBAction)backAction:(id)sender;
-(IBAction)forwardAction:(id)sender;
-(IBAction)refreshAction:(id)sender;

@end

