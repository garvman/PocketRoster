//
//  PersonalAccount.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 5/9/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//
/**
 *************************************************
 *                                               *
 *                Personal Account               *
 *                                               *
 *************************************************
 *
 * This is a new aspect of the site I began but have not had time 
 * to get up to speed, although it was getting close 
 *
 * This code takes in the Bowdoin Log in username (Log info provided by 
 * Andrew Currier) and based on that I created a test txt file that would 
 * take it and pull if you were an athlete if so you name, grade, event, photo, and 
 * other variables like who your following whos following you etc. 
 * Its the big thing I will work on next year getting that to work will be my goal and 
 * The final piece to this project before app store
 *
 */
#import "PersonalAccount.h"

@interface PersonalAccount ()

@end

@implementation PersonalAccount

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
    /**
     [self drawLayoutForTier:self.tier level:self.level];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *************************************************
 *                                               *
 *                  Add User Info                *
 *                                               *
 *************************************************
 *
 * This is where I go through the text file and pull the information I need 
 */

- (void) addUsersInfo:(NSString *)username
{
 NSString *filePath = [[NSBundle mainBundle] pathForResource:@"POCKETROSTERTEXTFILE" ofType:@"txt"];
 NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
 
 NSScanner *scanner = [NSScanner scannerWithString:fileContents];
 
 
 NSString *userLoad = [NSString stringWithFormat:@"Username %d", username];
 [scanner scanUpToString:userLoad intoString:NULL];
 
 //NSLog(@"Usernaem: %@", username);
 
 NSString *athleteSport;
 [scanner scanUpToString:@"AthleteName" intoString:&athleteSport];
 NSLog(@" %@", athleteSport);
    [self.athleteTitle setText:athleteSport];
    
    NSString *gradeYear = @"GradeYear";
  [scanner scanUpToString:gradeYear intoString:NULL];
    [scanner scanUpToString:@"Events" intoString:&gradeYear];
    NSLog(@" %@", gradeYear);
    [self.athleteTitle setText:athleteSport];
    
    NSString *athleteEvents = @"Events";
    [scanner scanUpToString:athleteEvents intoString:NULL];
    [scanner scanUpToString:@"Events" intoString:&athleteEvents];
    NSLog(@" %@", athleteEvents);
}


@end
