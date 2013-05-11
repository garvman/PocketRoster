//
//  PersonalAccount.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 5/9/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

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


- (void) addUsersInfo:(NSString *)username {
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
