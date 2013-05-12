//
//  NewsFeedViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 5/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "NewsFeedViewController.h"
#import "RSSTVC.h"

@interface NewsFeedViewController ()

@end

@implementation NewsFeedViewController

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
    NSLog(@"inNFWC");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedNews"]) {
        NSLog(@"%@", self.teamName);
        
                
        
        if([segue.destinationViewController isKindOfClass:[RSSTVC class]]){
            RSSTVC *rSSTmp = (RSSTVC *)segue.destinationViewController;
            rSSTmp.teamName = self.teamName;
            NSLog(@"inhere");
            //[segue.destinationViewController setTeamName:self.teamName];
        }
        
    }
}

@end
