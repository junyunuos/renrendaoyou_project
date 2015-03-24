//
//  XinLangWeiboApplication.m
//  DressStyle
//
//  Created by MacBook on 3/25/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import "XinLangWeiboApplication.h"
#import "UIAlertView+Dismiss.h"
#define kRedirectURI    @"https://api.weibo.com/oauth2/default.html"
#define kAppKey         @"270256935"

@implementation XinLangWeiboApplication
{
    NSString* _wbtoken;
    NSString* _uid;
    UIViewController *_viewController;
}

+(XinLangWeiboApplication*) shareInstance
{
    static XinLangWeiboApplication *instance=nil;
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
        
        [WeiboSDK enableDebugMode:YES];
        [WeiboSDK registerApp:kAppKey];
        
    }
    return self;
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}


//返回用户数据
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        
        [MBProgressHUDView initWithView:_viewController.view labelText:@"登录中..."];
        WBAuthorizeResponse* wresponse=(WBAuthorizeResponse *)response;
        if(wresponse.statusCode==WeiboSDKResponseStatusCodeSuccess)
        {
            _wbtoken = [wresponse accessToken];
            //NSDictionary* userInfo=response.userInfo;
            NSString* accessToken = [wresponse accessToken];
            _uid = wresponse.userID;
            NSString* openId = wresponse.userID;
            NSDate* expirationDate = wresponse.expirationDate;
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setValue:accessToken forKey:@"xinlang_accessToken"];
            [defaults setValue:openId forKey:@"xinlang_openId"];
            [defaults setValue:expirationDate forKey:@"xinlang_expirationDate"];
            [defaults synchronize];
            
            [self getUserInfo];
        }
        else if(wresponse.statusCode==WeiboSDKResponseStatusCodeUserCancel)
        {
           [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"取消登录"}];

        }
        else if (wresponse.statusCode==WeiboSDKResponseStatusCodeUnknown)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"取消登录"}];
        }
        else if(wresponse.statusCode==WeiboSDKResponseStatusCodeSentFail)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"登录失败"}];
        }
        
        //[MBProgressHUDView hideHUDForView:_viewController.view];
        
        /*
         else if(response.statusCode==WeiboSDKResponseStatusCodeUserCancel)
         {
         [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"用户登录失败"}];
         }
         
         NSString *title = @"认证结果";
         NSString *message = [NSString stringWithFormat:@"响应状态: %d\nresponse.userId: %@\nresponse.accessToken: %@\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode,[(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken], response.userInfo, response.requestUserInfo];
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
         message:message
         delegate:nil
         cancelButtonTitle:@"确定"
         otherButtonTitles:nil];
         
         [alert show];
         */
    }
    else if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        if(response.statusCode==WeiboSDKResponseStatusCodeSuccess)
        {
            [MBProgressHUDView showHUDAddedToExt:window showMessage:@"分享成功"  yOffset:0 afterDelay:2 animated:YES];
        }
        else if(response.statusCode==WeiboSDKResponseStatusCodeUserCancel)
        {
            [MBProgressHUDView showHUDAddedToExt:window showMessage:@"取消分享"  yOffset:0 afterDelay:2 animated:YES];
        }
        else if(response.statusCode==WeiboSDKResponseStatusCodeSentFail)
        {
            [MBProgressHUDView showHUDAddedToExt:window showMessage:@"分享失败"  yOffset:0 afterDelay:2 animated:YES];
        }
    }
}

- (void)request:(WBHttpRequest *)request didFinishLoadingWithDataResult:(NSData *)data
{
    if([request.tag isEqualToString:@"getUserInfo"])
    {
        NSDictionary* userData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSString* gender = userData[@"gender"];
        BOOL male = [gender isEqualToString:@"m"];
        NSString* name = [NSString stringWithFormat:@"wb_%@",_uid];
        NSString* district = [NSString stringWithFormat:@"%@%@",userData[@"province"],userData[@"city"]];
        
        if (gender==nil||[gender isEqualToString:@""])
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequest" object:self userInfo:nil];
            return;
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequest" object:self userInfo:@{@"name":name,@"nickname":userData[@"screen_name"],@"male":[NSNumber numberWithBool:male],@"icon":userData[@"profile_image_url"],@"district":district}];
    }
    
}

- (void)request:(WBHttpRequest *)request didFailWithError:(NSError *)erro
{
    if([request.tag isEqualToString:@"getUserInfo"])
    {
        //[MBProgressHUDView hideHUDForView:_viewController.view];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"用户登录失败"}];
    }
}


//验证用户信息
-(void)getUserInfo
{
    
    [WBHttpRequest requestWithAccessToken:_wbtoken url:@"https://api.weibo.com/2/users/show.json" httpMethod:@"GET" params:@{@"uid":_uid} delegate:self withTag:@"getUserInfo"];
}


//登录
-(void)login:(UIViewController *)viewController
{
     WBAuthorizeRequest *request = [WBAuthorizeRequest request];
     request.redirectURI = kRedirectURI;
     request.scope = @"all";
     request.userInfo = nil;
     [WeiboSDK sendRequest:request];
    
    _viewController = viewController;
}

//分享
-(void)publishWeibo:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock
{
    WBMessageObject *message = [WBMessageObject message];
    //message.text = text;
    WBImageObject *imageObject = [WBImageObject object];
    imageObject.imageData = UIImagePNGRepresentation(image);
    message.imageObject = imageObject;
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
    BOOL re = [WeiboSDK sendRequest:request];
    completeBlock(re);
}


@end
