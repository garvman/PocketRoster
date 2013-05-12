//
//  RSSEntry.h
//  RSSFun
//
//  Created by James P. Garvey on 5/9/13.
//  Copyright (c) 2013 edu.bowdoin.cs281.garvey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSEntry : NSObject
    
    
@property (nonatomic) NSString *articleTitle;
@property (nonatomic) NSDate *articleDate;
@property (nonatomic) NSString *articleURL;
@property (nonatomic) NSString *blogTitle;

-(id)initWithBlogTitle:(NSString*)blogTitle articleTitle:(NSString*)articleTitle articleURL:(NSString*) articleURL articleDate:(NSString*)articleDate;



@end
