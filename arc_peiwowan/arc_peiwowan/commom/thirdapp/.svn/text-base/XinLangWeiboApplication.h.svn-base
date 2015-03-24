//
//  XinLangWeiboApplication.h
//  DressStyle
//
//  Created by MacBook on 3/25/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboSDK.h"
@interface XinLangWeiboApplication : NSObject<WeiboSDKDelegate,WBHttpRequestDelegate>

-(void)login:(UIViewController *)viewController;

+(XinLangWeiboApplication*) shareInstance;

-(void)publishWeibo:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock;

@end
