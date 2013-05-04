//
//  RosterCell.h
//  Pocket Roster
//
//  Created by James P. Garvey on 4/22/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RosterCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *athleteImage;
@property (weak, nonatomic) IBOutlet UILabel *athleteName;
@property (weak, nonatomic) IBOutlet UILabel *athleteDetails;



@end
