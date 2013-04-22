//
//  RosterCell.m
//  Pocket Roster
//
//  Created by James P. Garvey on 4/22/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "RosterCell.h"

@implementation RosterCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
