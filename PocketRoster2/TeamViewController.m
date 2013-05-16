//
//  TeamViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 5/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//
/*
 *
 *  This class is used to control which team's data is presented in all of the team
 *  fields. The name of the team which was selected in the prevoius view (a collection
 *  of teams for a given season) is set as the team name. This is then passed to
 *  view controllers down the line to display the correct Roster, News Feed, etc.
 *  In the future this class will be generic and be applied to every team as opposed
 *  to the implementation which just supports football and swimming now
 *
 *
 */

#import "TeamViewController.h"
#import "NewsFeedViewController.h"
#import "FlickrPracticeViewController.h"

@interface TeamViewController ()

@end

@implementation TeamViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//set the team name according to which button was pressed in the view
//will only have one for each button when the system is generalized. 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"teamNews"]) {
        self.teamName = @"Football";
        NSLog(@"%@", self.teamName);
        
        if ([segue.destinationViewController isKindOfClass:[NewsFeedViewController class]]) {
            NewsFeedViewController *nFVC = (NewsFeedViewController *)segue.destinationViewController;
            nFVC.teamName = self.teamName;
        }
        
        //[segue.destinationViewController setTeamName:self.teamName];
        
    }
    else if ([segue.identifier isEqualToString:@"sTeamNews"]){
        self.teamName = @"Mens Swimming and Diving";
        
        
        if ([segue.destinationViewController isKindOfClass:[NewsFeedViewController class]]) {
            NewsFeedViewController *nFVC = (NewsFeedViewController *)segue.destinationViewController;
            nFVC.teamName = self.teamName;
        }
    }
    else if([segue.identifier isEqualToString:@"footballPhotos"]){
        self.teamName = @"Football";
        
        
        if ([segue.identifier isKindOfClass:[FlickrPracticeViewController class]]) {
            FlickrPracticeViewController *fVC = (FlickrPracticeViewController *)segue.destinationViewController;
            fVC.teamName = self.teamName;
            NSLog(@"%@", fVC.teamName);
        }
    }
    else if ([segue.identifier isEqualToString:@"swimmingPhotos"]){
        self.teamName = @"Swimming";
        
        if ([segue.destinationViewController isKindOfClass:[FlickrPracticeViewController class]]) {
            FlickrPracticeViewController *fVC = (FlickrPracticeViewController *)segue.destinationViewController;
            fVC.teamName = self.teamName;
        }
    }
    
}

@end
