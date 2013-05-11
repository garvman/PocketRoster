//
//  BOWLoginViewController.h
//
//  Created by Andrew Currier on 4/26/13.
//  Copyright (c) 2013 Bowdoin College. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BOWLoginViewControllerDelegate;

@interface BOWLoginViewController : UIViewController <NSURLConnectionDelegate,UITextFieldDelegate>
//@property (strong,nonatomic) AHCRootViewController *rootVC;

@property (weak,nonatomic) id<BOWLoginViewControllerDelegate> delegate;
@end
