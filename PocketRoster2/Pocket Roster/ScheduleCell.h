//
//  ScheduleCell.h
//  Pocket Roster
//
//  Created by James P. Garvey on 4/24/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleCell : UITableViewCell

//properties to display the infor in the cell
@property (weak, nonatomic) IBOutlet UILabel *opponentName;
@property (weak, nonatomic) IBOutlet UILabel *dateOfContest;
@property (weak, nonatomic) IBOutlet UILabel *result;


@end
