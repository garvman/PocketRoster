//
//  FlickrPhotoCell.m
//  Flickr Search
//
//  Created by Brandon Trebitowski on 7/11/12.
//  Copyright (c) 2012 Brandon Trebitowski. All rights reserved.
//

#import "FlickrPhotoCell.h"
#import "FlickrPhoto.h"
#import "Flickr.h"

@implementation FlickrPhotoCell

/**
 *************************************************
 *                                               *
 *                Set Frame                      *
 *                                               *
 *************************************************
 *
 * A lot of code was offered in the to tutorial at key 
 * to setting up the a cell in the the collection view
 */
- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
        UIView *bgView = [[UIView alloc] initWithFrame:self.backgroundView.frame];
        self.selectedBackgroundView = bgView;      
    }
    return self;
}
/**
*************************************************
*                                               *
*                Set Photo                      *
*                                               *
*************************************************
*/
- (void) setPhoto:(FlickrPhoto *)photo
{
    if(_photo != photo)
    {
        _photo = photo;
    }
    
    self.imageView.image = _photo.thumbnail;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
