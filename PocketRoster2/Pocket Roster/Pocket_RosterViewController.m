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

-(NSMutableDictionary*) footballTeam{    
    if(!_footballTeam){
        _footballTeam = [[NSMutableDictionary alloc] init];
            }
    return _footballTeam;
}

-(NSMutableDictionary*) swimTeamMens{
    if(!_swimTeamMens){
        _swimTeamMens = [[NSMutableDictionary alloc] init];
    }
    return _swimTeamMens;
}

-(NSMutableDictionary*) swimTeamWomens{
    if(!_swimTeamWomens){
        _swimTeamWomens = [[NSMutableDictionary alloc] init];
    }
    return _swimTeamWomens;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *images = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:@"FootballRosterPictures"];
    
    for (NSString* imagePath in images) {
        UIImage* anImage = [[UIImage alloc] initWithContentsOfFile:imagePath];
        NSArray* getName = [imagePath componentsSeparatedByString:@"/"];
        NSString* info = [getName lastObject];
        NSArray* piecesOfInfo = [info componentsSeparatedByString:@"."];
        
        self.name = [piecesOfInfo objectAtIndex:0];
        self.position = [piecesOfInfo objectAtIndex:1];
        //self.number = [piecesOfInfo objectAtIndex:2];
        //self.yearOfGraduation = [piecesOfInfo objectAtIndex:3];
        self.athletePic = anImage;
        
        [self.footballTeam setObject:[NSArray arrayWithObjects:self.name, self.yearOfGraduation, self.position, self.number, nil] forKey:self.name];
        
        NSLog(@"%@", imagePath);
        NSLog(@"%@", [self.footballTeam objectForKey:self.name]);
        
    }
    
	// Do any additional setup after loading the view, typically from a nib.
    self.name = @"Jimmy Garvey";
    self.position = @"PK";
    self.number = @"#1";
    self.yearOfGraduation = @"2014";
    
    [self.footballTeam setObject:[NSArray arrayWithObjects:self.name, self.yearOfGraduation, self.position, self.number, nil] forKey:@"Jimmy Garvey"];
    NSLog(@"%@", [self.footballTeam objectForKey:@"Jimmy Garvey"]);
    
    self.name = @"Joey Cleary";
    self.position = @"LB";
    self.number = @"#2";
    self.yearOfGraduation = @"2014";
    
    [self.footballTeam setObject:[NSArray arrayWithObjects:self.name, self.yearOfGraduation, self.position, self.number, nil] forKey:@"Joey Cleary"];
    NSLog(@"%@", [self.footballTeam objectForKey:@"Joey Cleary"]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
