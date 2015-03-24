//
//  DSThirdApplication.h
//  DressStyle
//
//  Created by MacBook on 3/26/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^LoginCompleteBlock)(NSDictionary* data);

typedef NS_ENUM(NSUInteger, ThirdApplicationLoginType)
{
    ThirdApplicationLoginTypeTencentQQ,
    ThirdApplicationLoginTypeXinLang,
};

@interface ThirdApplication : NSObject

+(ThirdApplication*) shareInstance;

-(BOOL)withControllor:(UIViewController *)viewControllor login:(LoginCompleteBlock)loginCompleteBlock type:(ThirdApplicationLoginType)type;

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;


@end
