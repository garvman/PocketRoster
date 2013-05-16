//
//  News Story View Controller.m
//  Pocket Roster
//
//  Created by James P. Garvey on 5/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "News Story View Controller.h"
#import "NewsFeedViewController.h"
#import "WebViewController.h"


/*
 *  Dummy class which is used to allow the TVC to be stored in a container view
 *  This is the view controller for the container view. it passes the info required for
 *  the table view display from the previous table view controller to the web view displaying
 *  the story.
 *
 */

@interface News_Story_View_Controller ()


@end

@implementation News_Story_View_Controller

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
    if ([segue.identifier isEqualToString:@"embedStory"]) {
        //NSLog(@"%@", self.teamName);       
        
        if([segue.destinationViewController isKindOfClass:[WebViewController class]]){
            WebViewController *wVCTmp = (WebViewController *)segue.destinationViewController;
            wVCTmp.inputURL = self.newsURL;
            NSLog(@"inhere");
            //[segue.destinationViewController setTeamName:self.teamName];
        }        
    }
    //resets the team name when back pressed so the news feel isnt fetching a null URL
    else if ([segue.identifier isEqualToString:@"back"]){
        NSLog(@"back");
        if ([segue.destinationViewController isKindOfClass:[NewsFeedViewController class]]) {
            NewsFeedViewController *nFVC = (NewsFeedViewController *)segue.destinationViewController;
            nFVC.teamName = self.team;
            NSLog(@"NSVC%@",self.team);
        }
        
    }
}

@end
