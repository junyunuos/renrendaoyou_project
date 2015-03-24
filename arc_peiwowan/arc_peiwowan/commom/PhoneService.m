//
//  PhoneService.m
//  Weida
//
//  Created by MacBook on 5/4/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import "PhoneService.h"
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>


@implementation PhoneService{
    void(^callEventHandler)(CTCall*);
}
+(PhoneService*)shareInstance{
    static PhoneService *instance=nil;
    @synchronized(self) {
        if (instance == nil) {
            instance=[[self alloc] init];
        }
    }
    return instance;
}
-(id)init {
    if (self = [super init]) {
      
    }
    return self;
}

- (void) checkCallStatus
{
    CTCallCenter *center = [[CTCallCenter alloc] init];
    callEventHandler = ^(CTCall *call) {
        if ([call.callState isEqualToString:CTCallStateDisconnected])
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:PHONE_DISCONNECTED_NOTIFY
                                                                object:nil];
        }
        else if ([call.callState isEqualToString:CTCallStateConnected])
        {

        }
        else if([call.callState isEqualToString:CTCallStateIncoming])
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:PHONE_CALLING_NOTIFY
                                                                object:nil];
        }
        else if ([call.callState isEqualToString:CTCallStateDialing])
        {
            NSLog(@"call is dialing");
        }
        else
        {  
            NSLog(@"Nothing is done");  
        }
    };
    
    center.callEventHandler=callEventHandler;
    
}

@end
