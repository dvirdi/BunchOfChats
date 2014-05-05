//
//  ViewController.m
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/21/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//

#import "ViewController.h"
#import "BunchOfChats.h"
#import "SecondViewController.h"
#import "AlternateViewController.h"
#import "Chat.h"
@interface ViewController ()

@end

@implementation ViewController

@synthesize nameTextField, thoughTextField, recordTimeSwitch;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *historyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    historyButton.frame = CGRectMake(0, 0, 50, 40);
    [historyButton setTitle:@"History" forState:UIControlStateNormal];
    [historyButton addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:historyButton];
    UILabel * nav_title = [[UILabel alloc] initWithFrame:CGRectMake(80, 2, 220, 25)];
    nav_title.font = [UIFont fontWithName:@"Helvetica" size:20];
    nav_title.textColor = [UIColor greenColor];
    nav_title.adjustsFontSizeToFitWidth = YES;
    nav_title.text = @"Home";
    nav_title.textColor = [UIColor blueColor];
    self.title = @"speakEasy";
    nav_title.backgroundColor = [UIColor greenColor];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//function for taking in all fields and storing them by adding them to the nsmutablearray
- (IBAction)submitButtonPressed:(id)sender {
    Chat *newChat = [[Chat alloc] init];
    newChat.text =[NSString stringWithFormat:@"%@", thoughTextField.text];
    newChat.name =[NSString stringWithFormat:@"%@", nameTextField.text];
    
    
    if([recordTimeSwitch isOn]){
        NSDate *currDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"dd.MM.YY HH:mm:ss"];
        NSString *dateString = [dateFormatter stringFromDate:currDate];
        newChat.date =dateString;
    }
    
    [[[BunchOfChats chats] chatList] addObject:newChat];
  
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
  
    
   
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    [locationManager stopUpdatingLocation];

    

}


//dismisses the keyboard
- (IBAction)dismissKeyboard:(id)sender {
    //sends a message ot the view saying stop the keyboard.
    [self.view endEditing:YES];
    [thoughTextField resignFirstResponder];
    [nameTextField resignFirstResponder];

}
//modal view. presents second view
- (IBAction)nextButtonPressed:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    
    SecondViewController *SecondVC = [storyboard instantiateViewControllerWithIdentifier:@"SecondVC"];
    
    [self.navigationController pushViewController:SecondVC animated:YES];
    
    //[self presentViewController:SecondVC animated:YES completion:nil];
}
//modal view. presents alternate view.



@end
