//
//  RosterViewController.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/17/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "RosterViewController.h"
#define NUMBER_OF_ROWS 12;

@interface RosterViewController ()


@end

@implementation RosterViewController


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
/*
typedef enum {
    UITableViewCellStyleDefault,
    UITableViewCellStyleValue1,
    UITableViewCellStyleValue2,
    UITableViewCellStyleSubtitle
} UITableViewCellStyle;
*/
/**
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"womens roster"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"womens roster"]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *womensRoster = (NSDictionary *)[self.content objectAtIndex:indexPath.row];
    cell.textLabel.text = [womensRoster objectForKey:@"first name and last name"];
    cell.detailTextLabel.text = [womensRoster objectForKey:@"year"];
    NSString *path = [[NSBundle mainBundle] pathForResource:[womensRoster objectForKey:@"roster photo"] ofType:@"url"];
    UIImage *theImage = [UIImage imageWithContentsOfFile:path];
    cell.imageView.image = theImage;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row%2 == 0) {
        UIColor *altCellColor = [UIColor colorWithWhite:0.7 alpha:0.1];
        cell.backgroundColor = altCellColor;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    
    UILabel *label;
    
    label = (UILabel *)[cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%d", indexPath.row];
    
    label = (UILabel *)[cell viewWithTag:2];
    label.text = [NSString stringWithFormat:@"%d", NUMBER_OF_ROWS - indexPath.row];
    
    return cell;
}

//http://athletics.bowdoin.edu/images/wswimdive/boyer.JPG?max_width=150&max_height=200
//http://athletics.bowdoin.edu/images/wswimdive/Carter.jpg?max_width=150&max_height=200
//http://athletics.bowdoin.edu/images/wswimdive/chong.JPG?max_width=150&max_height=200

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    
    cell.firstLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    cell.secondLabel.text = [NSString stringWithFormat:@"%d", NUMBER_OF_ROWS - indexPath.row];
    
    return cell;
}
*/
@end
