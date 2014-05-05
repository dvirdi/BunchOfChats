//
//  Chat.h
//  BunchOfChats
//
//  Created by Daljeet Virdi on 4/28/14.
//  Copyright (c) 2014 Daljeet Virdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chat : NSObject
@property NSString *text;
@property NSString *name;
@property NSString *date;

/*designated initializer*/

-(id) init;



@end
