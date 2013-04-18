//
//  ImageViewController.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 4/11/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//
#import "ImageViewController.h"
#import "AttributedStringViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *titleBarButtonItem;

@end

@implementation ImageViewController

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _imageView;
}

- (void)setTitle:(NSString *)title
{
    super.title = title;
    self.titleBarButtonItem.title = title;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Show URL"]) {
        if ([segue.destinationViewController isKindOfClass:[AttributedStringViewController class]]) {
            AttributedStringViewController *asc = (AttributedStringViewController *)segue.destinationViewController;
            asc.text = [[NSAttributedString alloc] initWithString:[self.imageURL description]];
        }
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"Show URL"]) {
        return self.imageURL ? YES : NO;
    } else {
        return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
    }
}

- (void)resetImage
{
    if (self.scrollView) {
        // blank out anything that was there
        self.scrollView.contentSize = CGSizeZero;
        self.imageView.image = nil;
        // get the data
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:self.imageURL];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        if (image) {
            // when getting a new image reset the zoom scale
            self.scrollView.zoomScale = 1.0;
            // set the content size with each new image to fit the image
            self.scrollView.contentSize = image.size;
            // our image view is now the new image
            self.imageView.image = image;
            // now we can set the frame
            self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            
        }
    }
}

- (void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    [self resetImage];
}

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
    [self.scrollView addSubview:self.imageView];
    [self resetImage];
    self.titleBarButtonItem.title = self.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
