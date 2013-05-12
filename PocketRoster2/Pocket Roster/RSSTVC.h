//
//  RSSTVC.h
//  RSSFun
//
//  Created by James P. Garvey on 5/9/13.
//  Copyright (c) 2013 edu.bowdoin.cs281.garvey. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WebViewController.h"

@interface RSSTVC : UITableViewController <NSXMLParserDelegate>


@property (nonatomic) NSMutableArray *stories;
@property (nonatomic) NSMutableDictionary * item;
@property (nonatomic) NSMutableString *currentTitle, *currentDate, *currentSummary, *currentLink, *imageURL, *sequeLink;
@property (nonatomic) NSString *currentElement, *teamName;
@property (nonatomic) UIImage *storyImage;



- (void) setTeamName:(NSString *)teamName;



@end
