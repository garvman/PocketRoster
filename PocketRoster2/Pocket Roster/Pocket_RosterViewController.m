//
//  Pocket_RosterViewController.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "Pocket_RosterViewController.h"

@interface Pocket_RosterViewController ()

@end

@implementation Pocket_RosterViewController

-(NSMutableDictionary*) footballTeamRoster{
    
    if(!_footballTeamRoster){
        _footballTeamRoster = [[NSMutableDictionary alloc] init];
    }
    return _footballTeamRoster;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initializeFootballTeamRoster];
         
}

-(void)initializeFootballTeamRoster{
    
    NSArray *images = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:@"FootballRosterPictures"];
    
    for (NSString *imagePath in images) {
        UIImage *anImage = [[UIImage alloc] initWithContentsOfFile:imagePath];
        
        NSArray *componentsOfPath = [imagePath componentsSeparatedByString:@"/"];
        NSString *athleteInfo = [componentsOfPath lastObject];
        NSArray *componentsOfAthleteInfo = [athleteInfo componentsSeparatedByString:@"."];
        
        
        if (![[componentsOfAthleteInfo objectAtIndex:1]isEqualToString:@"jpg"]) {
            NSString *name = [componentsOfAthleteInfo objectAtIndex:0];
            NSString *position = [componentsOfAthleteInfo objectAtIndex:1];
            NSString *number = [componentsOfAthleteInfo objectAtIndex:2];
            NSString *yearOfGraduation = [componentsOfAthleteInfo objectAtIndex:3];
            
            
            
            [self.footballTeamRoster setObject:[NSArray arrayWithObjects:name, position, number, yearOfGraduation, anImage,  nil] forKey:number];
            //NSLog(@"%@", imagePath);
        }
        
        
        //NSLog(@"%@", [self.footballTeamRoster objectForKey:self.number]);
        
        
        
        
        
    }
    
    
    
    NSArray *allKeys = [self.footballTeamRoster allKeys];
    
    
    NSLog(@"%@", allKeys);
    
    
    
    
    for (NSObject *key in allKeys) {
        NSLog(@"%@",  [self.footballTeamRoster objectForKey:key]);
    }
    
    
    for (int i = 0; i<100; i++) {
        
        
        self.key = [[NSString alloc]initWithFormat:@"%d", i];
        
        if ([self.footballTeamRoster objectForKey:self.key]) {
            NSLog(@"%@", [self.footballTeamRoster objectForKey:self.key]);
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
