//
//  ScheduleTVC.h
//  Pocket Roster
//
//  Created by James P. Garvey on 4/24/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleTVC : UITableViewController


//store the data to be displayed and access properties
@property (nonatomic) NSMutableDictionary *scheduleInfo;
@property (nonatomic) NSString *key, *teamName;


-(void)initializeSchedule;

@end
