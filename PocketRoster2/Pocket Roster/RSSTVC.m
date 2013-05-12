//
//  RSSTVC.m
//  RSSFun
//
//  Created by James P. Garvey on 5/9/13.
//  Copyright (c) 2013 edu.bowdoin.cs281.garvey. All rights reserved.
//

#import "RSSTVC.h"
#import "RSSEntry.h"
#import "RSSCell.h"
#import "News Story View Controller.h"
#define genURL @"http://athletics.bowdoin.edu/landing/headlines-featured?feed=rss_2.0"
#define footURL @"http://athletics.bowdoin.edu/sports/fball/headlines-featured?feed=rss_2.0"
#define swimMURL @"http://athletics.bowdoin.edu/sports/mswimdive/headlines-featured?feed=rss_2.0"
#define laxMURL @"http://athletics.bowdoin.edu/sports/mlax/headlines-featured?feed=rss_2.0"
#define baseballURL @"http://athletics.bowdoin.edu/sports/bsb/headlines-featured?feed=rss_2.0"


@interface RSSTVC ()

@end

@implementation RSSTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.title = @"FEEDS";
    //[self addArticles];
    
    if (self.stories == nil) {
        NSLog(@"sucks");
        [self fetchRSS];
    }
    
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)fetchRSS{
    
    self.stories = [[NSMutableArray alloc]init];
    
        
    NSURL *xmlURL = [NSURL URLWithString:[self getCorrectURL]];
     //NSLog(@"%@", xmlURL);
    
    
    
    //NSData* xmlData = [[NSMutableData alloc] initWithContentsOfURL:[NSURL URLWithString:newsURL]];
    
    NSXMLParser *rssParser = [[NSXMLParser alloc]initWithContentsOfURL:xmlURL];
    
    [rssParser setDelegate:self];
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
    
    [rssParser parse];
    
}

-(NSString*)getCorrectURL{
    NSString *sURL = [[NSString alloc]init];
    if([self.teamName isEqualToString:@"general"])
        sURL = genURL;
    else if ([self.teamName isEqualToString:@"football"])
        sURL = footURL;
    else if ([self.teamName isEqualToString: @"swimmingM"])
        sURL = swimMURL;
    else if ([self.teamName isEqualToString: @"baseball"])
        sURL = baseballURL;
    else if ([self.teamName isEqualToString: @"lacrossM"])
        sURL = laxMURL;
    
    
       
    return sURL;
}


/*
-(void)addArticles{
    RSSEntry *entry1 = [[RSSEntry alloc]initWithBlogTitle:@"1" articleTitle:@"1" articleURL:@"1" articleDate:[NSDate date]];
    RSSEntry *entry2 = [[RSSEntry alloc]initWithBlogTitle:@"2" articleTitle:@"2" articleURL:@"2" articleDate:[NSDate date]];
    RSSEntry *entry3 = [[RSSEntry alloc]initWithBlogTitle:@"3" articleTitle:@"3" articleURL:@"3" articleDate:[NSDate date]];
    
    
    [self.allArticles insertObject:entry1 atIndex:0];
    [self.allArticles insertObject:entry2 atIndex:0];
    [self.allArticles insertObject:entry3 atIndex:0];
    
    //RSSEntry *e = [self.allArticles objectAtIndex:0];
    
    NSLog(@"%@", entry1.articleTitle);
}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.stories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    RSSCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[RSSCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //RSSEntry *entry = [self.allArticles objectAtIndex:indexPath.row];
    //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //[dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    //[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    //NSString *articleDateString = [dateFormatter stringFromDate:entry.articleDate];
    
    //cell.textLabel.text = entry.articleTitle;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", articleDateString, entry.blogTitle];
    
    cell.title.text = [[self.stories objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.description.text = [[self.stories objectAtIndex:indexPath.row]objectForKey:@"summary"];
    cell.image.image = [[self.stories objectAtIndex:indexPath.row]objectForKey:@"image"];
    
    return cell;
}



- (void)parserDidStartDocument:(NSXMLParser *)parser {
	NSLog(@"found file and started parsing");
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
    
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
	//NSLog(@"found this element: %@", elementName);
	
    
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		self.item = [[NSMutableDictionary alloc] init];
		self.currentTitle = [[NSMutableString alloc] init];
		self.currentDate = [[NSMutableString alloc] init];
		self.currentSummary = [[NSMutableString alloc] init];
		self.currentLink = [[NSMutableString alloc] init];
        self.imageURL = [[NSMutableString alloc]init];
        self.storyImage = [[UIImage alloc]init];
	}
    if ([elementName isEqualToString:@"title"]) {
        self.currentElement = @"title";
    }
    if ([elementName isEqualToString:@"link"]) {
        self.currentElement = @"link";
    }
    if ([elementName isEqualToString:@"description"]) {
        self.currentElement = @"description";
    }
    if ([elementName isEqualToString:@"date"]) {
        self.currentElement = @"date";
    }
    if ([elementName isEqualToString:@"media:content"]){
        self.currentElement = @"image";
        self.imageURL = [attributeDict objectForKey:@"url"];
        NSURL *url = [NSURL URLWithString:self.imageURL];
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
        self.storyImage = [UIImage imageWithData:imageData];
         //NSLog(@"found characters: %@", self.imageURL);
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[self.item setObject:self.currentTitle forKey:@"title"];
		[self.item setObject:self.currentLink forKey:@"link"];
		[self.item setObject:self.currentSummary forKey:@"summary"];
		[self.item setObject:self.currentDate forKey:@"date"];
        [self.item setObject:self.storyImage forKey:@"image"];
        
        //RSSEntry *entry = [[RSSEntry alloc]initWithBlogTitle:self.currentTitle articleTitle:self.currentSummary articleURL:self.currentLink articleDate:self.currentDate];
        
		[self.stories addObject:self.item ];
		//NSLog(@"adding story: %@", self.currentTitle);
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	
	// save the characters for the current item...
	if ([self.currentElement isEqualToString:@"title"]) {
		[self.currentTitle appendString:string];
	} else if ([self.currentElement isEqualToString:@"link"]) {
		[self.currentLink appendString:string];
	} else if ([self.currentElement isEqualToString:@"description"]) {
		[self.currentSummary appendString:string];
        
	} else if ([self.currentElement isEqualToString:@"pubDate"]) {
		[self.currentDate appendString:string];
	} else if ([self.currentElement isEqualToString:@"image"]){
        //[self.imageURL appendString:string];
       
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
	//[activityIndicator stopAnimating];
	//[activityIndicator removeFromSuperview];
    
	NSLog(@"all done!");
	NSLog(@"stories array has %d items", [self.stories count]);
	//[newsTable reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([sender isKindOfClass:[UITableViewCell class] ]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
       
        if (indexPath) {
             //NSLog(@"%@", indexPath);
            if ([segue.identifier isEqualToString:@"webView"]) {
                    
                self.sequeLink = [[self.stories objectAtIndex:indexPath.row]objectForKey:@"link"];
                //self.currentTitle = [[self.stories objectAtIndex:indexPath.row]objectForKey:@"title"];
                //NSLog(@"%@", self.sequeLink);
                
                if ([segue.destinationViewController isKindOfClass:[News_Story_View_Controller class]]) {
                    News_Story_View_Controller *newsTMP = (News_Story_View_Controller *)segue.destinationViewController;
                    newsTMP.newsURL = self.sequeLink;
                    newsTMP.team = self.teamName;
                    NSLog(@"RSSTVC%@", newsTMP.team);
                }
                
                //[segue.destinationViewController setNewsURL:self.sequeLink];
                //[segue.destinationViewController setTitle:self.currentTitle];
                
            }
        }
    }
}
/*
-(void) performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if([identifier isEqualToString:@"webView"]){
        [self performSegueWithIdentifier:identifier sender:self];
    }
}
 */
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    //self.sequeLink = [[self.stories objectAtIndex:indexPath.row]objectForKey:@"link"];
    //self.wVC.inputURL = self.sequeLink;
   // NSLog(@"int here bitch");
   //[self performSegueWithIdentifier:@"webView" sender:self];
    
    //[self getCorrectLink:indexPath.row];
    //[self performSegueWithIdentifier:@"webView" sender:self];
    
     // ...
     // Pass the selected object to the new view controller.
        
}

@end
