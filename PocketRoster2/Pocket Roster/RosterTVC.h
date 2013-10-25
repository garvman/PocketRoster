//
//  RosterTVC.h
//  Pocket Roster
//
//  Created by James P. Garvey on 4/20/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RosterTVC : UITableViewController


//properties for storing/ accessing the roster
@property (nonatomic) NSString *key;
@property (nonatomic) NSMutableDictionary *footballTeamRoster;

-(void)initializeFootballTeamRoster;
@end
