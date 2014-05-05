//
//  BunchOfChats.h
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/21/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BunchOfChats : NSObject

{
    NSMutableArray *chats;
   
    
    
}

+(BunchOfChats *) chats;

-(NSInteger) numberOfChats;

-(NSMutableArray *) chatList;




@end
