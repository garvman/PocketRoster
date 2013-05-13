//
//  TeamViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 5/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

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
