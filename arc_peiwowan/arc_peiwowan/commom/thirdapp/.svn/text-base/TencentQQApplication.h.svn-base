//
//  DSQQApplication.h
//  DressStyle
//
//  Created by MacBook on 3/24/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentApiInterface.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface TencentQQApplication : NSObject<TencentSessionDelegate,QQApiInterfaceDelegate,UIAlertViewDelegate>

+(TencentQQApplication *) shareInstance;

-(void)login:(UIViewController *)viewController;

-(void)publishWeibo:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock;

-(void)publishSpace:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock;

-(void)publishSpaceImageString:(NSString *)imageUrl title:(NSString *)title description:(NSString *)description completeBlock:(void(^)(BOOL success)) completeBlock;

-(void)publishFriend:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock;


@end
