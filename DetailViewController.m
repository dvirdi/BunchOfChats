//
//  DetailViewController.m
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/26/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//

#import "DetailViewController.h"
#import "BunchOfChats.h"
#import "Chat.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize chatText, timeText, nameText;
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
    self.chatText.text = self.chats;
    self.timeText.text = self.chatTime;
    self.nameText.text = self.chatName;
    
    // Do any additional setup after loading the view.
}
- (void) viewWillAppear:(BOOL)animated
{
    
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
