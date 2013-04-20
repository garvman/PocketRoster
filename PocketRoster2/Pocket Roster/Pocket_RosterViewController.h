//
//  Pocket_RosterViewController.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Pocket_RosterViewController : UIViewController

@property (nonatomic) NSString *key;

/*
@property (nonatomic) NSString *yearOfGraduation;
@property (nonatomic) NSString *number;
@property (nonatomic) NSString *position;
@property (nonatomic) UIImage *athletePicture;
 */
@property (nonatomic) NSMutableDictionary *footballTeamRoster;

-(void)initializeFootballTeamRoster;

@end
