//
//  ViewController.h
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/21/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "BunchOfChats.h"
@interface ViewController : UIViewController <UINavigationControllerDelegate, CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}
@property (weak, nonatomic) IBOutlet UITextField *thoughTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UISwitch *recordTimeSwitch;
- (IBAction)submitButtonPressed:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end
