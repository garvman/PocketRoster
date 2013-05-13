//
//  ScheduleViewController.m
//  Pocket Roster
//
//  Created by James P. Garvey on 5/12/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleTVC.h"

@interface ScheduleViewController ()

@end

@implementation ScheduleViewController

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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"footballSchedule"]) {
        
        if([segue.destinationViewController isKindOfClass:[ScheduleTVC class]]){
            ScheduleTVC *sTmp = (ScheduleTVC *)segue.destinationViewController;
            sTmp.teamName = @"Football";
            NSLog(@"inhere");
            //[segue.destinationViewController setTeamName:self.teamName];
        }
    
    }
    else if ([segue.identifier isEqualToString:@"mensSwimSchedule"]) {
        
        if([segue.destinationViewController isKindOfClass:[ScheduleTVC class]]){
            ScheduleTVC *sTmp = (ScheduleTVC *)segue.destinationViewController;
            sTmp.teamName = @"Mens Swimming and Diving";
            NSLog(@"inhere");
            //[segue.destinationViewController setTeamName:self.teamName];
        }
        
    }
}

@end
