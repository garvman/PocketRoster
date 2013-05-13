//
//  FlickrPracticeViewController.m
//  PracticeFlickrPhoto
//
//  Created by Ryan Kulesza on 4/22/13.
//  Copyright (c) 2013 Kulesza Productions. All rights reserved.
//
/**
 * *************************************************
 *                                               *
 *              IBAction - Done                  *
 *                                               *
 *************************************************
* By Ryan Kulesza
*
* This is code I used after going through a tutorial
* on setting up a photo collection from Flickr
* http://www.raywenderlich.com/22324/beginning-uicollectionview-in-ios-6-part-12
* This site had the backbones of what I needed. I tried using the Stanford code
* However, apart from being hard to understand I realized it pulls recient downloads
* and through a lot of research I learned that I could not
* use my own album that Flickr was hard to use unless it was public
* This tutorial created a program that allowed one to search on flickr
* So I found a way to access my account using this idea of searches. 
 * The code takes the search key (originally entered by the user) and searches 
 * all of flickr for photos with those tags
 * My idea was to creat PhotoRoster specific tags that I 
 * could prepare and preenter so when a user enters a certain page 
 * that tag would be put in and the result would be loaded onto the
 * page.
 * This took more work than I expected. The tutorial 
 * had holes and things that went unanswered but in the end I figured out 
 * a way to successfully implement it 
 * 
 * Flickr uploading and setting proper privacy setting and tagging setting proved 
 * timely 
*/
#import "FlickrPracticeViewController.h"
#import "FlickrPhoto.h"
#import "Flickr.h"
#import "FlickrPhotoCell.h"
#import "FlickrPhotoHeaderView.h"
#import "FlickrPhotoViewController.h"
#define imagePrefix @"BowdoinPocketRoster"


@interface FlickrPracticeViewController () <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

/**
*************************************************
*                                               *
*                 Properties                    *
*                                               *
*************************************************
 */

@property(nonatomic, weak) IBOutlet UIToolbar *toolbar;
@property(nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property(nonatomic, weak) IBOutlet UITextField *textField;
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) NSMutableDictionary *searchResults;
@property(nonatomic, strong) NSMutableArray *searches;
@property(nonatomic, strong) NSMutableArray *selectedPhotos;
@property(nonatomic, strong) Flickr *flickr;
@property(nonatomic) BOOL sharing;
- (IBAction)shareButtonTapped:(id)sender;
@end



@implementation FlickrPracticeViewController

/**
 *************************************************
 *                                               *
 *                View Did Load                  *
 *                                               *
 *************************************************
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
            // Do any additional setup after loading the view, typically from a nib.
    self.searches = [@[] mutableCopy];
    self.searchResults = [@{} mutableCopy];
    self.flickr = [[Flickr alloc] init];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier: @"MY_CELL"];
    /**
     -------------------------
     |        NSLOG          |
     -------------------------
     */
    
    NSLog(@"View Loaded");
    /**
     **********************************************************
     *                           KEY                          *
     **********************************************************
     * 
     * This is where we set the search on flickr.
     * These are predetermined tags that will return Bowdoin sport photos 
     * from a set Flickr account 
     * 
     * It is set up to recognize if a team was specified or if it just want most 
     * recent uploaded photos 
     */
    UITextField *textField = [[UITextField alloc] init];
    
    NSString *teamPhotos;
    
    if(self.teamName){
        /**
         -------------------------
         |        NSLOG          |
         -------------------------
         */
        NSLog(@"%@\n", self.teamName);
        teamPhotos = [NSString stringWithFormat:@"BowdoinPocketRoster%@", self.teamName];
        /**
         -------------------------
         |        NSLOG          |
         -------------------------
         */
        NSLog(@"%@", teamPhotos);
    }
    else{
        /**
         -------------------------
         |        NSLOG          |
         -------------------------
         */
        NSLog(@"It did not work generic call was made!!!!!!");
        teamPhotos = @"Bowdoin Pocket Roster";
    }
    
    
    textField.text = teamPhotos;
    
    [self textFieldShouldReturn:textField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

/**
 *************************************************
 *                                               *
 *        UICollectionView Datasource            *
 *                                               *
 *************************************************
 */
#pragma mark - UICollectionView Datasource
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    NSString *searchTerm = self.searches[section];
    NSLog(@"itemsinsection%d", [self.searchResults[searchTerm] count]);
    return [self.searchResults[searchTerm] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSLog(@"sections%d", [self.searches count]);
    return [self.searches count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FlickrPhotoCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    
    NSString *searchTerm = self.searches[indexPath.section];
        cell.photo = self.searchResults[searchTerm][indexPath.row];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    FlickrPhotoHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FlickPhotoHeaderView" forIndexPath:indexPath];
    NSString *searchTerm = self.searches[indexPath.section];
    

    [headerView setSearchText:searchTerm];
    return headerView;
}

/**
 *************************************************
 *                                               *
 *        UICollectionView Delegate              *
 *                                               *
 *************************************************
 */
#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(!self.sharing)
    {
     
        NSString *searchTerm = self.searches[indexPath.section];

        FlickrPhoto *photo = self.searchResults[searchTerm][indexPath.row];
        [self performSegueWithIdentifier:@"ShowPhoto" sender:photo];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
    }
    else
    {
        
       NSString *searchTerm = self.searches[indexPath.section];
        
        FlickrPhoto *photo = self.searchResults[searchTerm][indexPath.row];
        [self.selectedPhotos addObject:photo];
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.sharing)
    {
        
        NSString *searchTerm = self.searches[indexPath.section];
        
        FlickrPhoto *photo = self.searchResults[searchTerm][indexPath.row];
        [self.selectedPhotos removeObject:photo];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
   NSString *searchTerm = self.searches[indexPath.section];
           FlickrPhoto *photo = self.searchResults[searchTerm][indexPath.row];
    CGSize retval = photo.thumbnail.size.width > 0 ? photo.thumbnail.size : CGSizeMake(10, 10);
    retval.height += 10;
    retval.width += 10;
    return retval;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(50, 50, 50, 50);
}
/**
 *************************************************
 *                                               *
 *          UICollectionView Methods             *
 *                                               *
 *************************************************
 */

#pragma mark - UITextFieldDelegate methods
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    // 1
    [self.flickr searchFlickrForTerm:textField.text completionBlock:^(NSString *searchTerm, NSArray *results, NSError *error) {
        if(results && [results count] > 0) {
            // 2
            if(![self.searches containsObject:searchTerm]) {
                NSLog(@"Found %d photos matching %@", [results count],searchTerm);
                [self.searches insertObject:searchTerm atIndex:0];
                self.searchResults[searchTerm] = results; }
            // 3
            dispatch_async(dispatch_get_main_queue(), ^{
                // Placeholder: reload collectionview data
                [self.collectionView reloadData];
            });
        } else { // 1
            NSLog(@"Error searching Flickr: %@", error.localizedDescription);
        } }];
    [textField resignFirstResponder];
    return YES; 
}

/**
 *************************************************
 *                                               *
 *           UICollectionView Segue              *
 *                                               *
 *************************************************
 */
#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"ShowPhoto"])
	{
        if([segue.destinationViewController isKindOfClass:[FlickrPhotoViewController class]])
        {
            FlickrPhotoViewController *flickrPhotoViewController = (FlickrPhotoViewController *)segue.destinationViewController;
            flickrPhotoViewController.flickrPhoto = sender;
        }
	}
}




@end
