Ryan Kulesza  
Jim Garvey

Bowdoin College   
Mobile Computing 281  
Professor Chown

PocketRoster
=========================

	An app designed for Bowdoin College Athletics. Designed to provide the user with much of the information 
availible at the Bowdoin College Athletics website along with some social media add ons. The app is designed 
for the iPhone and currently doesn't support switching orientation. This app heavily relies on table views for displaying
lists of teams and options to the user. Most of the code implemented can be generalized and applied to any team 
very easily. 

	Current implementation has four of the five features for the football and mens swimming team set up. The roster, 
schedule, news feed, and flickr photos are up for both of the teams. For the news feed, selecting a story will bring the 
user to a web view for that page from the bowdoin athletics web page. In the future this will be a custom view displaying
the same information. The news feed implements a XML parser to get the information required. In the future a HTML 
parser will be used to pull the required information for the roster and the schedule (right now txt files have been 
written containing the data.) In the future, clicking on a roster cell will pull up athlete bios/ info and clicking on a 
schedule cell will bring up the box/score or live scores. Photos are fetched from flickr using the flickr API.

	All current implementation is the the public side of the app. A Bowdoin user side will be implemented giving
those with valid Bowdoin credentials to post pictures and comments to the app. For the public side of the app, users 
are brought to a home screen with options for selecting different groups of teams. Mens, women's and club sports
are available. Access to a news feed with options to select general, or to an individual team is implemented. Also an
option to display general flickr photos is available. 

	BUGS: not everything is linked up (i.e. clicking on teams without proper implementation doesn't do anything.) The 
photo links for the football and swimming team don't have the option to zoom in on a selected photo yet. For some 
reason the photos displayed for the football team contain swimming pictures. 

	Overall, this app has made significant progress and most of the work lies in replacing hardcoded parts with stuff 
that will be automatically updated. Live scores with push notifications still need to be implemented as well as a feed 
containing comments from users about events. The Bowdoin private side of the app will include much of the same code
etc but will also have the ability to follow individual athletes. 
	
