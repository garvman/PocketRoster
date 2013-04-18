//
//  FlickrPhotoTableViewController.h
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FlickrPhotoTableViewController : UITableViewController <UISplitViewControllerDelegate>

@property (nonatomic, strong) NSArray *photos; // of NSDictionary

@property (nonatomic, strong) NSArray *content;
@end

//I need 
//Skima of the database
//Somewhere to place PHP script
