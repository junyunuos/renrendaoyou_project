//
//  DSThirdApplication.m
//  DressStyle
//
//  Created by MacBook on 3/26/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import "ThirdApplication.h"
#import "TencentQQApplication.h"
#import "XinLangWeiboApplication.h"
#import "WXApi.h"
#import "TencentWeixinApplication.h"

@implementation ThirdApplication
{
    LoginCompleteBlock _loginCompleteBlock;
    UIViewController *_viewController;
}


+(ThirdApplication*) shareInstance
{
    static ThirdApplication *instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
        
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [XinLangWeiboApplication shareInstance];
        
        [TencentQQApplication shareInstance];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginRequestAction:) name:@"loginRequest" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginRequestFailAction:) name:@"loginRequestFail" object:nil];
        
    }
    return self;
}

-(BOOL)withControllor:(UIViewController *)viewControllor login:(LoginCompleteBlock)loginCompleteBlock type:(ThirdApplicationLoginType)type
{
    if(_loginCompleteBlock!=nil)
    {
        return false;
    }

    _loginCompleteBlock = loginCompleteBlock;
    _viewController = viewControllor;
    
    switch (type){
            
        case ThirdApplicationLoginTypeTencentQQ:
        {
            [[TencentQQApplication shareInstance] login:viewControllor];
            break;
        }
            
        case ThirdApplicationLoginTypeXinLang:
        {
            [[XinLangWeiboApplication shareInstance] login:viewControllor];
            break;
        }
    }
    
    return true;
}

-(void)loginRequestAction:(NSNotification*)notification
{

//    NSDictionary* d = notification.userInfo;
//    [[NetService shareInstance] sendData:@"UserService.thirdLogin" data:d completionBlock:^(id data, NetServiceResponseStatus responseStatus, ASIHTTPRequest *request) {
//        
//        if (data==nil)
//        {
//            data = @{@"success":[NSNumber numberWithBool:NO],@"message":@"用户登录失败"};
//        }
//        _loginCompleteBlock(data);
//        _loginCompleteBlock=nil;
//        
//    } parse:nil];

}


-(void)loginRequestFailAction:(NSNotification*)notification
{
    
    [MBProgressHUDView hideHUDForView:_viewController.view];
    
    NSDictionary* d = notification.userInfo;
    
    _loginCompleteBlock(@{@"success":[NSNumber numberWithBool:NO],@"message":d[@"message"]});
    _loginCompleteBlock=nil;
    
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    NSString *strUrl = [url absoluteString];
    if ([strUrl hasPrefix:@"tencent"])
    {
        return  [QQApiInterface handleOpenURL:url delegate:[TencentQQApplication shareInstance]]||[TencentOAuth HandleOpenURL:url];
    }
    
    if ([strUrl hasPrefix:@"wb"])
    {
        return [WeiboSDK handleOpenURL:url delegate:[XinLangWeiboApplication shareInstance]];
    }
    
    if ([strUrl hasPrefix:@"wx"])
    {
        return [WXApi handleOpenURL:url delegate:[TencentWeixinApplication shareInstance]];
    }
    
    return NO;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    
    NSString *strUrl = [url absoluteString];
    if ([strUrl hasPrefix:@"tencent"])
    {
        return [WeiboSDK handleOpenURL:url delegate:[XinLangWeiboApplication shareInstance]];
    }
    
    if ([strUrl hasPrefix:@"wb"])
    {
        return [WeiboSDK handleOpenURL:url delegate:[XinLangWeiboApplication shareInstance]];
    }
    
    if ([strUrl hasPrefix:@"wx"])
    {
        return [WXApi handleOpenURL:url delegate:[TencentWeixinApplication shareInstance]];
    }
    
    return NO;
}

-(void)dealloc
{
    _viewController = nil;
    _loginCompleteBlock = nil;
}


@end
