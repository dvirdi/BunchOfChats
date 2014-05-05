//
//  AlternateViewController.m
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/23/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//
#import "AlternateViewController.h"
#import "BunchOfChats.h"
#import <GoogleMaps/GoogleMaps.h>
#import "Chat.h"

@interface AlternateViewController ()

@end

@implementation AlternateViewController{
    GMSMapView *mapView_;
    double latitude;
    double longitude;
    double latitudeClicked;
    double longitudeClicked;
    
}
@synthesize numberOfChats, mostRecentChat, firstChat;

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
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:2
                                                            longitude:3
                                                                 zoom:12];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.settings.scrollGestures = YES;
    mapView_.settings.zoomGestures = YES;
    self.view = mapView_;
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myButton.frame = CGRectMake(20, 20, 200, 44); // position in the parent view and set the size of the button
    [myButton setTitle:@"My Location!" forState:UIControlStateNormal];
    // add targets and actions
    [myButton addTarget:self action:@selector(locationPressed) forControlEvents:UIControlEventTouchUpInside];
    // add to a view
    [mapView_ addSubview:myButton];

    
    UIButton *dropAPin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    dropAPin.frame = CGRectMake(200, 100, 200, 44); // position in the parent view and set the size of the button
    [dropAPin setTitle:@"Create chatBox!" forState:UIControlStateNormal];
    // add targets and actions
    [dropAPin addTarget:self action:@selector(dropPin) forControlEvents:UIControlEventTouchUpInside];
    // add to a view
    [mapView_ addSubview:dropAPin];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 2.0; //user needs to press for 2 seconds
    [mapView_ addGestureRecognizer:lpgr];


}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    NSLog(@"HELLO");

}



#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
    latitudeClicked = coordinate.latitude;
    longitudeClicked = coordinate.longitude;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    latitude =oldLocation.coordinate.latitude;
    longitude =oldLocation.coordinate.longitude;
    
    
    
}

#pragma mark - GMSMapViewDelegate

- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture {
    [mapView clear];
    
}




- (void)viewWillAppear:(BOOL)animated{
    [mapView_ animateToLocation:CLLocationCoordinate2DMake(latitude, longitude)];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)locationPressed{
    [locationManager startUpdatingLocation];

    [mapView_ animateToLocation:CLLocationCoordinate2DMake(latitude, longitude)];

}

-(IBAction)dropPin{
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(latitudeClicked, longitudeClicked);
    GMSMarker *marker = [GMSMarker markerWithPosition:position];
    marker.title = @"Hello World";
    marker.map = mapView_;
}
@end
