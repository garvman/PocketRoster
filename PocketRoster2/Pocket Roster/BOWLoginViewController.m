//
//  BOWLoginViewController.m
//  Pocket Roster
//
//  Created by Ryan Kulesza on 5/9/13.
//  Copyright (c) 2013 Pocket Roster. All rights reserved.
//

#import "BOWLoginViewController.h"
#import "BOLoginViewControllerDelegate.h"

@interface BOWLoginViewController ()

- (IBAction)loggedIn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) NSMutableData *receivedData;
- (void)doLogin;
- (void)resetAfterFailure;

- (IBAction)LoginButtonPressed:(UIButton *)sender;

@property NSString *userName;

@end

@implementation BOWLoginViewController

@synthesize userField = _userField;
@synthesize passwordField = _passwordField;
@synthesize delegate = _delegate;
@synthesize spinner = _spinner;
@synthesize loginButton = _loginButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.receivedData = [[NSMutableData alloc] init];
    UIImage *loginButtonImage = [[UIImage imageNamed:@"loginbutton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(14,14,14,14)];
    [self.loginButton setTitle:@"" forState:UIControlStateDisabled];
    [self.loginButton setBackgroundImage:loginButtonImage forState:UIControlStateNormal];
    [self.loginButton setTitle:@"Log in" forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.spinner.alpha = 0.0;
    self.userField.delegate = self;
    self.passwordField.delegate = self;
    [self.userField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loggedIn:(id)sender {
    
    [self doLogin];
}

- (void)doLogin {
    
    self.loginButton.enabled = NO;
    [self.receivedData setLength:0];
    
    [UIView	animateWithDuration:0.25
                          delay:0.25
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.spinner.alpha = 1.0;
                         self.loginButton.alpha = 0.25;
                     }
                     completion:^(BOOL finished){}
     ];
    
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.bowdoin.edu/apps/mobile/login.php"]];
	
	NSString *post = [NSString stringWithFormat:@"username=%@&password=%@",self.userField.text,self.passwordField.text];
	NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	
	[request setValue:[NSString stringWithFormat:@"%d",[postData length]] forHTTPHeaderField:@"Content-Length"];
	[request setTimeoutInterval:15];
	[request setHTTPBody:postData];
	[request setHTTPMethod:@"POST"];
	
	NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[urlConnection start];
    NSLog(@"Sending credentials, waiting for response");
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    NSLog(@"Connection failed");
    [self resetAfterFailure];
}

- (void)resetAfterFailure {
    
    NSLog(@"Login failure");
    
    [self.userField becomeFirstResponder];
    self.spinner.alpha = 0.0;
    self.loginButton.enabled = YES;
    
    [UIView	animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.loginButton.alpha = 1.0;
                     }
                     completion:^(BOOL finished){}
     ];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSString *loginInfo = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    
    if ([loginInfo isEqualToString:@"0"]) {
        [self.delegate loginDidFail];
        [self resetAfterFailure];
    } else {
        NSLog(@"Login success: %@",loginInfo);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:loginInfo forKey:@"token"];
        [defaults synchronize];
        [self.delegate loginDidSucceedWithInfo:loginInfo];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.tag == 0) {
        [self.passwordField becomeFirstResponder];
    } else {
        [self doLogin];
    }
    return YES;
}

 - (IBAction)LoginButtonPressed:(UIButton *)sender {
 NSString *username = sender.userField;
 self.userNameToPassOn = [NSString *username];
 NSLog(@"Username is %@", username);
 
 }
 
 -(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 if([segue.destinationViewController isKindOfClass:[PersonalAccount class]])
 {
 PersonalAccount *destination = (PersonalAccount *) segue.destinationViewController;
 destination.username = self.userNameToPassOn;
  }
 }


@end
