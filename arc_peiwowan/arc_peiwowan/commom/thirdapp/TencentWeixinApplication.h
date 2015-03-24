//
//  TencentWeixinApplication.h
//  Weida
//
//  Created by MacBook on 3/31/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"

@interface TencentWeixinApplication : NSObject<WXApiDelegate,UIAlertViewDelegate>

+(TencentWeixinApplication*) shareInstance;

-(void)publishContextToSession:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock;

-(void)publishContextToTimeline:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock;

-(void)publishContextArrayToSession:(NSArray*)imageArray text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock;

-(void)publishContextArrayToTimeline:(NSArray*)imageArray text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock;

-(void)openWeixin;

@end
