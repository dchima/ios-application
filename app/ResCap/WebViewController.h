//
//  WebViewController.h
//  ResCap
//
//  Created by Chima Nnadika [el17cdn] on 06/12/2017.
//  Copyright © 2017 Chima Nnadika [el17cdn]. All rights reserved.
//

#import <UIKit/UIKit.h>

//This class holds the declarations of the Web view controller
@interface WebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *getUrl; //string to hold web url passed via segue to controller

@end
