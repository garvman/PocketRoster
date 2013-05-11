//
//  PersonalAccount.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 5/9/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalAccount : UIViewController


@property NSString *userName;

@property (weak, nonatomic) IBOutlet UILabel *athleteTitle;
@property (weak, nonatomic) IBOutlet UILabel *following;
@property (weak, nonatomic) IBOutlet UIImage *athleteCoverImage;
-(void) addUsersInfo:(NSString *)userName;


@end
