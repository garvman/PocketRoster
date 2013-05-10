//
//  BOWLoginViewController.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 5/9/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BOLoginViewControllerDelegate;

@interface BOWLoginViewController: UIViewController <NSURLConnectionDelegate, UITextFieldDelegate>
//@property (strong,nonatomic) AHCRootViewController *rootVC;
@property (weak,nonatomic) id<BOLoginViewControllerDelegate> delegate;
@end
