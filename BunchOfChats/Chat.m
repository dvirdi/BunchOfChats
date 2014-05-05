//
//  Chat.m
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/28/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//

#import "Chat.h"

@implementation Chat
@synthesize text, name, date;
-(id) init;
{
    if(self = [super init])
    {
        text = @"No text Found";
        name = @"No name found";
        date = @"no date found";
    }
    return self;
}

@end
