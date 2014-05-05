//
//  AlternateViewController.h
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/23/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>


@interface AlternateViewController : UIViewController <GMSMapViewDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}


- (IBAction)locationPressed;
-(IBAction)dropPin;
@property (weak, nonatomic) IBOutlet UILabel *numberOfChats;
@property (weak, nonatomic) IBOutlet UILabel *mostRecentChat;
@property (weak, nonatomic) IBOutlet UILabel *firstChat;
@property(strong, nonatomic) GMSMapView *mapView;
@end
