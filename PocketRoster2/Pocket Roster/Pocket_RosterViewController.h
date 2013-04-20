//
//  Pocket_RosterViewController.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Pocket_RosterViewController : UIViewController

@property (nonatomic) BOOL male;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *position;
@property (nonatomic) NSString *number;
@property (nonatomic) NSString *yearOfGraduation;
@property (nonatomic) UIImage *athletePic;
@property (nonatomic, strong) NSMutableDictionary *footballTeam;
@property (nonatomic, strong) NSMutableDictionary *swimTeamMens;
@property (nonatomic, strong) NSMutableDictionary *swimTeamWomens;





@end
