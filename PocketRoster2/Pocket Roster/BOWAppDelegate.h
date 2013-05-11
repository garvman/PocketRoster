//
//  BOWAppDelegate.h
//  BowdoinLogin
//
//  Created by Dev on 4/26/13.
//  Copyright (c) 2013 Bowdoin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BOWLoginViewController;

@interface BOWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BOWLoginViewController *loginViewController;

@end
