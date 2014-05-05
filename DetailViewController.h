//
//  DetailViewController.h
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/26/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *chatText;
@property (weak, nonatomic) IBOutlet UILabel *nameText;
@property (weak, nonatomic) IBOutlet UILabel *timeText;

@property (nonatomic, strong)  NSString *chats;
@property (nonatomic, strong) NSString *chatTime;
@property (nonatomic, strong) NSString *chatName;

@end
