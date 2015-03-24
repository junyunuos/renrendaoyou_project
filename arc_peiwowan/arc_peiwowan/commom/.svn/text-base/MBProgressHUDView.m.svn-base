//
//  MBProgressHUDView.m
//  Weida
//
//  Created by MacBook on 5/7/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import "MBProgressHUDView.h"

@implementation MBProgressHUDView


//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

+(void)initWithView:(UIView *)view imageStr:(NSString *)imageStr labelText:(NSString *)text
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    hud.labelText = text;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageStr]];
    
    //_hud.dimBackground = YES;
    hud.mode = MBProgressHUDModeCustomView;
    [hud showAnimated:YES whileExecutingBlock:^{sleep(2);} completionBlock:^{
        [hud removeFromSuperview];
    }];
    
    
}


+(void)initWithView:(UIView *)view labelText:(NSString *)text
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    //_hud.dimBackground = YES;
    hud.labelText = text;
    [hud show:YES];
}

+(void)initRefreshWithView:(UIView *)view labelText:(NSString *)text
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    //_hud.dimBackground = YES;
    hud.labelText = text;
    hud.mode = MBProgressHUDModeText;
    if ([[UIScreen mainScreen]bounds].size.height==568.0) {
        hud.yOffset = 200.0f;
    }
    else
    {
        hud.yOffset = 160.0f;
    }

    [hud show:YES];
}


+(void)hideHUDForView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}


//冒泡提示 显示完隐藏
+ (void)showHUDAddedToExt:(UIView *)view showMessage:(NSString*)showMessage  yOffset:(float)yOffset afterDelay:(NSTimeInterval)delay animated:(BOOL)animated
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:animated];
	
	// Configure for text only and offset down
	hud.mode = MBProgressHUDModeText;
	hud.labelText = showMessage;
	hud.margin = 10.f;
	hud.yOffset = yOffset;
	hud.removeFromSuperViewOnHide = YES;
    
	[hud hide:YES afterDelay:delay];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
