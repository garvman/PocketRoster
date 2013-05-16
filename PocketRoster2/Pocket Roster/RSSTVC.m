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
        if (self.stories == nil) {
        
        [self fetchRSS];
    }
    
    
    

    
}

-(void)fetchRSS{
    
    self.stories = [[NSMutableArray alloc]init];
    
        
    NSURL *xmlURL = [NSURL URLWithString:[self getCorrectURL]];
     
    
    NSXMLParser *rssParser = [[NSXMLParser alloc]initWithContentsOfURL:xmlURL];
    
    [rssParser setDelegate:self];
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
    
    [rssParser parse];
    
}

-(NSString*)getCorrectURL{
    
    
    
    NSString *sURL = [[NSString alloc]init];
    if([self.teamName isEqualToString:@"General"])
        sURL = genURL;
    else if ([self.teamName isEqualToString:@"Football"])
        sURL = footURL;
    else if ([self.teamName isEqualToString: @"Mens Swimming and Diving"])
        sURL = swimMURL;
    else if ([self.teamName isEqualToString: @"Baseball"])
        sURL = baseballURL;
    else if ([self.teamName isEqualToString: @"Mens Lacrosse"])
        sURL = laxMURL;
    
    NSLog(@"%@   %@\n", self.teamName, sURL);
       
    return sURL;
}




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

//sets the info in the cells from the correct story titles, images, etc
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    RSSCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[RSSCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
   
    cell.title.text = [[self.stories objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.description.text = [[self.stories objectAtIndex:indexPath.row]objectForKey:@"summary"];
    cell.image.image = [[self.stories objectAtIndex:indexPath.row]objectForKey:@"image"];
    
    return cell;
}


/*
 *  The following code is used to parse the XML data for the RSS feed
 *  Sets various string properties to info that was parsed
 *  this info is stored in a collection of stories which is then
 *  displayed in the table view. 
 *
 */

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
	} 
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
	
    
	NSLog(@"all done!");
	NSLog(@"stories array has %d items", [self.stories count]);
	
}


//send info for displaying specific story
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
                
                
                
            }
        }
    }
}

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
