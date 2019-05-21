//
//  WebViewController.m
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 06/12/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

//synthesize getter/setter method for input text field properties
@synthesize webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    //get url text and load request
    NSURL *Url = [NSURL URLWithString:self.getUrl];
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:Url];
    [webView loadRequest:requestUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
