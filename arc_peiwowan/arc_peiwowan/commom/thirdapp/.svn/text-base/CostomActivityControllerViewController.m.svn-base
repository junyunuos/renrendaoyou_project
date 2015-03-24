//
//  CostomActivityControllerViewController.m
//  Weida
//
//  Created by MacBook on 4/18/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import "CostomActivityControllerViewController.h"


@interface CostomActivityControllerViewController ()

@end

@implementation CostomActivityControllerViewController
{
    UIView* _rootView;
    UIView *view;
    UIView *fullView;

}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor whiteColor];
    
    //根据activitys构建界面
    int sy = [[UIScreen mainScreen] bounds].size.height;
    int sx = [[UIScreen mainScreen] bounds].size.width;
    int sz = 0;
    
    fullView = [[UIView alloc] initWithFrame:CGRectMake(0, sy, sx, sy)];
    fullView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:fullView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tap.numberOfTapsRequired = 1;
    [fullView addGestureRecognizer:tap];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sx, sy-200)];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.5;
    [fullView addSubview:view];
    
    _rootView = [[UIView alloc] initWithFrame:CGRectMake(0, sy-300, sx, 300)];
    _rootView.backgroundColor = [UIColor whiteColor];
    _rootView.alpha = 1;
    [fullView addSubview:_rootView];
    
    
    UILabel *upTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,  sx,  36)];
    ;
    upTextLabel.text = @"点名好友挑战＃一张图证明＃";
    upTextLabel.textColor = [UIColor grayColor];
    upTextLabel.textAlignment = NSTextAlignmentCenter;
    upTextLabel.font = [UIFont systemFontOfSize:16];
    upTextLabel.backgroundColor = [UIColor whiteColor];
    [_rootView addSubview:upTextLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, upTextLabel.frame.size.height, upTextLabel.frame.size.width, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:226/255.0 green:228/255.0 blue:232/255.0 alpha:1];
    [upTextLabel addSubview:lineView];
    
    sz = sz + upTextLabel.frame.size.height+10;
    for (int i=0; i<5; i++)
    {
        
        CGFloat x = i % 4 * SCREEN_WIDTH/4;
        CGFloat y = i / 4 * SCREEN_WIDTH/4;
        
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareBtn.frame = CGRectMake((SCREEN_WIDTH/4/2-50/2)+x, sz + y, 50, 67);
        [_shareBtn addTarget:self action:@selector(clickItemAction:) forControlEvents:UIControlEventTouchUpInside];
        _shareBtn.tag = 1000+i;
        _shareBtn.userInteractionEnabled = YES;
        [_shareBtn setBackgroundColor:[UIColor clearColor]];
        [_rootView addSubview:_shareBtn];
    }
    
    sz = sz + _shareBtn.frame.size.height * 2 + 20;
    UIButton *reportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    reportBtn.frame = CGRectMake((sx-270)/2, sz, 270, 39);
    //[reportBtn setTitle:@"举报" forState:UIControlStateNormal];
    //[reportBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reportBtn setBackgroundImage:[UIImage imageNamed:@"bottom_report_btn.png"] forState:UIControlStateNormal];
    //reportBtn.layer.cornerRadius = 4;
    //reportBtn.layer.borderColor = [[UIColor blackColor] CGColor];
    //reportBtn.layer.borderWidth = 1;
    [reportBtn addTarget:self action:@selector(reportBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    reportBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [_rootView addSubview:reportBtn];
    
    
    sz = sz + reportBtn.frame.size.height + 10;
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake((sx-270)/2, sz, 270, 39);
    //[cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    //[cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"bottom_cancel_btn.png"] forState:UIControlStateNormal];
    //cancelBtn.layer.cornerRadius = 4;
    //cancelBtn.layer.borderColor = [[UIColor blackColor] CGColor];
    //cancelBtn.layer.borderWidth = 1;
    [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [_rootView addSubview:cancelBtn];

    //调整位置到界面下面
}


-(void)getButtonImage
{
    for (int i=0; i<[self.activitysDelegate getButtonIcon].count; i++)
    {
        UIButton *button = (UIButton *)[self.view viewWithTag:1000+i];
        [button setBackgroundImage:[UIImage imageNamed:[[self.activitysDelegate getButtonIcon] objectAtIndex:i]] forState:UIControlStateNormal];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"Curl" context:context];
    [UIView setAnimationDuration:0.3];
    fullView.frame = CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height);
    [UIView commitAnimations];
}

// 举报
-(void)reportBtnClick:(UIButton *)button
{
    [self.activitysDelegate reportPicture];
    
    [self cancelBtnClick:nil];
}

//取消
-(void)cancelBtnClick:(id)sender
{

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"Curl" context:context];
    [UIView setAnimationDuration:0.3];
    fullView.frame = CGRectMake(0, [[UIScreen mainScreen]bounds].size.height, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height);
    [UIView commitAnimations];
    
    
    [self performSelector:@selector(removeView) withObject:self afterDelay:0.3];


}


-(void)removeView
{
    if (self.view)
    {
        [self.view removeFromSuperview];
    }
}

//消失手势
-(void)handleTapGesture:(UITapGestureRecognizer *)tapGesture
{
    [self cancelBtnClick:nil];
}


-(void)clickItemAction:(id)sender
{
    UIButton *button = (UIButton*)sender;
    
    //执行代理
    [self.activitysDelegate performActivity:button.tag];

    
    //取消
    [self cancelBtnClick:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
