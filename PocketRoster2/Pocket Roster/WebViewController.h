//
//  WebViewController.h
//  RSSFun
//
//  Created by James P. Garvey on 5/9/13.
//  Copyright (c) 2013 edu.bowdoin.cs281.garvey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (nonatomic) NSString *inputURL;
@property (weak, nonatomic) IBOutlet UIWebView *webPage;

@end
