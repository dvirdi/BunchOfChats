//
//  BunchOfChats.m
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/21/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//

#import "BunchOfChats.h"

@implementation BunchOfChats

//create a singelton instance
static BunchOfChats *theOneInstance;

+ (BunchOfChats *) chats
{
    @synchronized (self)
    {
        if (! theOneInstance)
        {
            theOneInstance = [[BunchOfChats alloc] init];
        }
    }
    return theOneInstance;
}

//retrive the number of chats made.
-(NSInteger) numberOfChats{
    return [chats count];
    
}

//returns the chat history
-(NSMutableArray *) chatList{
    return chats;
}

//initializes nsmutablearrays.
- (id) init
{
    if (self = [super init]) {
        chats = [[NSMutableArray alloc] init];
        
        
    }
    return self;
}







@end
