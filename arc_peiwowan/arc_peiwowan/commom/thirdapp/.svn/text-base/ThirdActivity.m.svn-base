//
//  XinLangWeiboActivity.m
//  DressStyle
//
//  Created by MacBook on 3/27/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import "ThirdActivity.h"
#import "XinLangWeiboApplication.h"
#import "TencentQQApplication.h"
#import "TencentWeixinApplication.h"
@implementation ThirdActivity{
    NSString* _text;
    UIImage* _image;
}
-(NSString*)activityType{
    return _activityType;
}
-(NSString*)activityTitle{
    return _title;
}


//设置分享的图片
-(UIImage*)activityImage
{
    return _icon;
    //return [UIImage imageNamed:@"qqzone"];
}

-(BOOL)canPerformWithActivityItems:(NSArray *)activityItems{
    for (NSObject* item in activityItems) {
        if([item isKindOfClass:[UIImage class]]){
            return YES;
        }
    }
    return NO;
}

-(void)prepareWithActivityItems:(NSArray *)activityItems{
    for (NSObject* item in activityItems) {
        if([item isKindOfClass:[UIImage class]]){
            _image=(UIImage*)item;
        }
        if([item isKindOfClass:[NSString class]]){
            _text=(NSString*)item;
        }
    }
}

-(void)performActivity{
    switch (_type) {
        case ThirdActivityTypeQQ:
        {
            [[TencentQQApplication shareInstance] publishSpace:_image text:_text completeBlock:^(BOOL success) {
                [self activityDidFinish:success];
            }];
            break;
        }
        case ThirdActivityTypeXinlangWeibo:
        {
            [[XinLangWeiboApplication shareInstance] publishWeibo:_image text:_text completeBlock:^(BOOL success) {
                [self activityDidFinish:success];
            }];
            break;
        }
        case ThirdActivityTypeTencentWeixinTimeline:
        {
            [[TencentWeixinApplication shareInstance] publishContextToTimeline:_image text:_text completeBlock:^(BOOL success) {
                [self activityDidFinish:success];
            }];
            break;
        }
        case ThirdActivityTypeTencentWeixinSession:
        {
            [[TencentWeixinApplication shareInstance] publishContextToSession:_image text:_text completeBlock:^(BOOL success) {
                [self activityDidFinish:success];
            }];
            break;
        }
        default:
            break;
        }
    }
@end
