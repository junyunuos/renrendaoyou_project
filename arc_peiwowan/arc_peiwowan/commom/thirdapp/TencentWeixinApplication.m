//
//  TencentWeixinApplication.m
//  Weida
//
//  Created by MacBook on 3/31/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import "TencentWeixinApplication.h"
#import "WXApiObject.h"
#import "UIAlertView+Dismiss.h"

#define kAppKey         @"wx9a9658ac76ad5a52"
@implementation TencentWeixinApplication

+(TencentWeixinApplication*) shareInstance
{
    static TencentWeixinApplication *instance=nil;
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
        [WXApi registerApp:kAppKey];
    }
    return self;
}

-(void) onReq:(BaseReq*)req
{
    NSLog(@"---");
}

-(void) onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        if(resp.errCode==WXSuccess)
        {
            [MBProgressHUDView showHUDAddedToExt:window  showMessage:@"分享成功" yOffset:0 afterDelay:2 animated:YES];
        }
        else if(resp.errCode==WXErrCodeUserCancel)
        {
            [MBProgressHUDView showHUDAddedToExt:window  showMessage:@"取消分享" yOffset:0 afterDelay:2 animated:YES];
        }
        else if(resp.errCode==WXErrCodeSentFail)
        {
            [MBProgressHUDView showHUDAddedToExt:window  showMessage:@"分享失败" yOffset:0 afterDelay:2 animated:YES];
        }
    }

}

-(void)publishContextToSession:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock
{
    if([self checkInstall])
    {
        UIImage *thumbImage = [self OriginImage:image scaleToSize:CGSizeMake(image.size.width/2, image.size.height/2)];
        WXMediaMessage *message = [WXMediaMessage message];
        [message setThumbImage:thumbImage];

        WXImageObject *ext = [WXImageObject object];
        ext.imageData = UIImagePNGRepresentation(image);
        
        message.mediaObject = ext;
        message.description=text;
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        req.scene = WXSceneSession;
        [WXApi sendReq:req];

    }
    
}

-(void)publishContextToTimeline:(UIImage*)image text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock
{
    if([self checkInstall])
    {
        UIImage *thumbImage = [self OriginImage:image scaleToSize:CGSizeMake(image.size.width/2, image.size.height/2)];
        WXMediaMessage *message = [WXMediaMessage message];
        [message setThumbImage:thumbImage];
        
        WXImageObject *ext = [WXImageObject object];
        ext.imageData = UIImagePNGRepresentation(image);
        
        message.mediaObject = ext;
        message.description=text;
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        req.scene = WXSceneTimeline;

        [WXApi sendReq:req];
    }
}

-(void)publishContextArrayToSession:(NSArray*)imageArray text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock
{
    if([self checkInstall])
    {
        UIImage *thumbImage = [imageArray objectAtIndex:0];
        thumbImage = [self OriginImage:thumbImage scaleToSize:CGSizeMake(thumbImage.size.width/2, thumbImage.size.height/2)];
        WXMediaMessage *message = [WXMediaMessage message];
        [message setThumbImage:thumbImage];
        
        WXImageObject *ext = [WXImageObject object];
        ext.imageData = UIImagePNGRepresentation([imageArray objectAtIndex:1]);
        
        message.mediaObject = ext;
        message.description=text;
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        req.scene = WXSceneSession;
        [WXApi sendReq:req];
        
    }
    
}

-(void)publishContextArrayToTimeline:(NSArray*)imageArray text:(NSString*)text completeBlock:(void(^)(BOOL success)) completeBlock
{
    if([self checkInstall])
    {
        UIImage *thumbImage = [imageArray objectAtIndex:0];
        thumbImage = [self OriginImage:thumbImage scaleToSize:CGSizeMake(thumbImage.size.width/2, thumbImage.size.height/2)];
        WXMediaMessage *message = [WXMediaMessage message];
        [message setThumbImage:thumbImage];
        
        WXImageObject *ext = [WXImageObject object];
        UIImage *image = [imageArray objectAtIndex:1];
        ext.imageData = UIImagePNGRepresentation(image);
        
        message.mediaObject = ext;
        message.description=text;
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        
        req.message = message;
        req.scene = WXSceneTimeline;
        [WXApi sendReq:req];
    }
}


-(bool)checkInstall
{
    if(![WXApi isWXAppInstalled])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"系统未安装微信应用，是否安装？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"安装", nil];
        [alert show];
        return false;
    }else{
        return true;
    }
}


-(void)openWeixin
{
    if ([self checkInstall])
    {
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"weixin://"]];
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        NSString* installURL=[WXApi getWXAppInstallUrl];
        NSURL *url = [NSURL URLWithString:installURL];
        [[UIApplication sharedApplication] openURL:url];
    }
}

-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

@end
