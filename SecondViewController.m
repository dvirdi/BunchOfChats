//
//  SecondViewController.m
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/21/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//

#import "SecondViewController.h"
#import "BunchOfChats.h"
#import "DetailViewController.h"
#import "Chat.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


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
    //sends an alert if array is out of bounds.
    [super viewDidLoad];
        
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[BunchOfChats chats] numberOfChats];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *chatCellID = @"chatCell";
    
    UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:chatCellID];
    
    if (newCell == nil)
    {
        newCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:chatCellID];
        
    }
    Chat *chat = [[[BunchOfChats chats] chatList] objectAtIndex:indexPath.row];
    
    newCell.textLabel.text = chat.text;
    
    return newCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Chat *chats = [[[BunchOfChats chats] chatList] objectAtIndex:indexPath.row];
   
    UIStoryboard *storyboard = self.storyboard;
    DetailViewController *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    detailVC.chats = chats.text;
    detailVC.chatTime = chats.date;
    detailVC.chatName = chats.name;
    /*detailVC.chatText.text = chats;
    detailVC.timeText.text = chatTime;
    detailVC.nameText.text = chatName;*/
    
    
    [self.navigationController pushViewController:detailVC animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
