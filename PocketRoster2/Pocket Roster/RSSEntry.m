//
//  RSSEntry.m
//  RSSFun
//
//  Created by James P. Garvey on 5/9/13.
//  Copyright (c) 2013 edu.bowdoin.cs281.garvey. All rights reserved.
//

#import "RSSEntry.h"

@implementation RSSEntry


-(id)initWithBlogTitle:(NSString*)blogTitle articleTitle:(NSString*)articleTitle articleURL:(NSString*) articleURL articleDate:(NSDate*)articleDate{
    
    if (self = [super init]) {
        _articleDate = articleDate;
        _articleTitle = articleTitle;
        _articleURL = articleURL;
        _blogTitle = blogTitle;
    }
    return self;
}
    
    
    
    




@end
