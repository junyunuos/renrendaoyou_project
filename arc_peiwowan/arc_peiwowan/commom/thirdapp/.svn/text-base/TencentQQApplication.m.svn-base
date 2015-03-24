//
//  DSQQApplication.m
//  DressStyle
//
//  Created by MacBook on 3/24/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import "TencentQQApplication.h"
#define QQ_APPID @"1102327771"

@implementation TencentQQApplication
{
    TencentOAuth* _tencentOAuth;
    NSArray* _permissions;
    NSString* _openId;
    UIViewController *_viewController;
}


+(TencentQQApplication*) shareInstance
{
    static TencentQQApplication *instance=nil;
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
       _tencentOAuth =  [[TencentOAuth alloc] initWithAppId:QQ_APPID andDelegate:self];
       //_tencentOAuth.redirectURI = @"www.qq.com";
       _permissions = @[kOPEN_PERMISSION_GET_USER_INFO,kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,kOPEN_PERMISSION_ADD_SHARE];
    }
    return self;
}

//登录
-(void)login:(UIViewController *)viewController
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* accessToken =[defaults objectForKey:@"qq_accessToken"];
    
    if(accessToken!=nil)
    {
     //   [_tencentOAuth setAccessToken:accessToken];
    }
    
    NSString* qq_openId =[defaults objectForKey:@"qq_openId"];
    if(qq_openId!=nil)
    {
      //  [_tencentOAuth setOpenId:qq_openId];
    }
    
    NSDate* qq_expirationDate =[defaults objectForKey:@"qq_expirationDate"];
    if(qq_expirationDate!=nil)
    {
      //  [_tencentOAuth setExpirationDate:qq_expirationDate];
    }
    
    [_tencentOAuth authorize:_permissions inSafari:NO];
    
    _viewController = viewController;
    
}


- (void)tencentDidLogin
{
    if (_tencentOAuth.accessToken && 0 != [_tencentOAuth.accessToken length])
    {
        [MBProgressHUDView initWithView:_viewController.view labelText:@"登录中..."];
        
        // 记录登录用户的OpenID、Token以及过期时间
        NSString* accessToken = _tencentOAuth.accessToken;
        _openId= _tencentOAuth.openId;
        NSDate* expirationDate= _tencentOAuth.expirationDate;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:accessToken forKey:@"qq_accessToken"];
        [defaults setValue:_openId forKey:@"qq_openId"];
        [defaults setValue:expirationDate forKey:@"qq_expirationDate"];
        [defaults synchronize];
        
        [self getUserInfo];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"用户登录失败"}];
    }
}


-(void)tencentDidNotLogin:(BOOL)cancelled
{
    NSString* mess;
    if (cancelled)
    {
        mess = @"取消登录";
        
    }
    else
    {
        mess = @"登录失败";
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":mess}];
    
}

-(void)tencentDidNotNetWork
{
    NSString* mess=@"网络不给力啊";
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":mess}];
    
}

//判断获取信息是否成功
-(void)getUserInfo
{
    BOOL result= [_tencentOAuth getUserInfo];
    if(!result)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"获取用户信息失败"}];
    }

}


//获取用户信息
- (void)getUserInfoResponse:(APIResponse*) response
{
    if (URLREQUEST_SUCCEED == response.retCode && kOpenSDKErrorSuccess == response.detailRetCode)
    {
        NSDictionary* userData=response.jsonResponse;
        NSString* gender=userData[@"gender"];
        bool male=[gender isEqualToString:@"男"];
        NSString* openId= _tencentOAuth.openId;
        NSString* name=[NSString stringWithFormat:@"qq%@",openId];
        NSString* district = [NSString stringWithFormat:@"%@%@",userData[@"province"],userData[@"city"]];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequest" object:self userInfo:@{@"name":name,@"nickname":userData[@"nickname"],@"male":[NSNumber numberWithBool:male],@"icon":userData[@"figureurl_qq_2"], @"district":district}];
        
    }else{
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":response.message}];
        
    }
}


-(void)publishWeibo:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock{
    
}

//分享
-(void)publishFriend:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock
{
   
    if (![TencentOAuth iphoneQQInstalled])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"未安装QQ客户端，是否安装" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"安装", nil];
        [alert show];
        
        return;
    }
    
    NSData *imgData =   UIImagePNGRepresentation(image);
    QQApiImageObject *imgObj = [QQApiImageObject objectWithData:imgData
                                               previewImageData:imgData
                                                          title:@"分享到QQ好友"
                                                    description:text];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:imgObj];
    //将内容分享到qq
    //QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    [QQApiInterface sendReq:req];
    
}


-(void)publishSpaceImageString:(NSString *)imageUrl title:(NSString *)title description:(NSString *)description completeBlock:(void(^)(BOOL success)) completeBlock
{

    if (![TencentOAuth iphoneQQInstalled])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"未安装QQ客户端，是否安装" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"安装", nil];
        [alert show];
        
        return;
    }
    
    QQApiNewsObject *newsObj = [QQApiNewsObject
                                objectWithURL:[NSURL URLWithString:imageUrl]
                                title:title
                                description:description
                                previewImageURL:[NSURL URLWithString:imageUrl]];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];

    [QQApiInterface SendReqToQZone:req];
    
}


-(void)publishSpace:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock
{

}


- (void)showInvalidTokenOrOpenIDMessage
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"api调用失败" message:@"可能授权已过期，请重新获取" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


/**
 处理来至QQ的请求
 */
- (void)onReq:(QQBaseReq *)req
{
    
}

/**
 处理来至QQ的响应
 */
- (void)onResp:(QQBaseResp *)resp
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    switch (resp.type)
    {
        case ESENDMESSAGETOQQRESPTYPE:
        {
            SendMessageToQQResp* sendResp = (SendMessageToQQResp*)resp;
            
            if ([sendResp.result integerValue] == 0)
            {
                [MBProgressHUDView showHUDAddedToExt:window showMessage:@"分享成功" yOffset:0 afterDelay:2 animated:YES];
            }
            if ([sendResp.result integerValue] == -1)
            {
                [MBProgressHUDView showHUDAddedToExt:window showMessage:@"分享失败" yOffset:0 afterDelay:2 animated:YES];
            }
            if ([sendResp.result integerValue] == -4)
            {
                [MBProgressHUDView showHUDAddedToExt:window showMessage:@"取消分享" yOffset:0 afterDelay:2 animated:YES];
            }

            break;
        }
        default:
        {
            break;
        }
    }
}

/**
 处理QQ在线状态的回调
 */
- (void)isOnlineResponse:(NSDictionary *)response
{
    
}



- (BOOL)onTencentReq:(TencentApiReq *)req
{
    return true;
}

- (BOOL)onTencentResp:(TencentApiResp *)resp
{
    return true;
}

- (BOOL)tencentNeedPerformIncrAuth:(TencentOAuth *)tencentOAuth
                   withPermissions:(NSArray *)permissions
{
    // incrAuthWithPermissions是增量授权时需要调用的登录接口
    // permissions是需要增量授权的权限列表
    [tencentOAuth incrAuthWithPermissions:permissions];
    return NO; // 返回NO表明不需要再回传未授权API接口的原始请求结果；
    // 否则可以返回YES
}

- (void)tencentDidUpdate:(TencentOAuth *)tencentOAuth
{
    if (tencentOAuth.accessToken
        && 0 != [tencentOAuth.accessToken length])
    { // 在这里第三方应用需要更新自己维护的token及有效期限等信息
        // **务必在这里检查用户的openid是否有变更，变更需重新拉取用户的资料等信息**
        NSString* accessToken = tencentOAuth.accessToken;
        NSDate* expirationDate= tencentOAuth.expirationDate;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:accessToken forKey:@"qq_accessToken"];
        [defaults setValue:_openId forKey:@"qq_openId"];
        [defaults setValue:expirationDate forKey:@"qq_expirationDate"];
        [defaults synchronize];
        
        if(tencentOAuth.openId!=_openId)
        {
            _openId= tencentOAuth.openId;
            [self getUserInfo];
        }
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"授权失败"}];
    }
}


- (void)tencentFailedUpdate:(UpdateFailType)reason
{
    switch (reason)
    {
        case kUpdateFailNetwork:
        {
             [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"增量授权失败，无网络连接，请设置网络"}];
            break;
        }
        case kUpdateFailUserCancel:
        {
             [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"增量授权失败，用户取消授权"}];
            
            break;
        }
        case kUpdateFailUnknown:
        default:
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"loginRequestFail" object:self userInfo:@{@"message":@"增量授权失败，未知错误"}];
            break;
        }
    }
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
#if __QQAPI_ENABLE__
    [QQApiInterface handleOpenURL:url delegate:(id)[QQAPIDemoEntry class]];
#endif
    if (YES == [TencentOAuth CanHandleOpenURL:url])
    {
        return [TencentOAuth HandleOpenURL:url];
    }
    return YES;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            //
        }
            break;
        case 1:
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/us/app/qq/id444934666?mt=8"]]];
        }
            
            
        default:
            break;
    }
}


@end
