//
//  RosterTVC.h
//  Pocket Roster
//
//  Created by James P. Garvey on 4/20/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RosterTVC : UITableViewController



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
