//
//  WebViewController.m
//  RSSFun
//
//  Created by James P. Garvey on 5/9/13.
//  Copyright (c) 2013 edu.bowdoin.cs281.garvey. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
     
    //NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", self.inputURL]];
    NSString *articleURL = [self.inputURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //NSLog(@"%@", articleURL);
    NSURL *url = [NSURL URLWithString:articleURL];
    //NSLog(@"%@", url);
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //NSLog(@"%@", requestObj);
    [_webPage loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
