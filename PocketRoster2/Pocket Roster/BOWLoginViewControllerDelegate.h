//
//  BOWLoginViewControllerDelegate.h
//  BowdoinLogin
//
//  Created by Dev on 4/26/13.
//  Copyright (c) 2013 Bowdoin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BOWLoginViewControllerDelegate <NSObject>

- (void)loginDidSucceedWithInfo:(NSString *)loginInfo;
- (void)loginDidFail;

@end
