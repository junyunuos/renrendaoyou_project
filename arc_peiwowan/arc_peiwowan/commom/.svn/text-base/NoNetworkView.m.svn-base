//
//  NoDataView.m
//  Weida
//
//  Created by MacBook on 7/8/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import "NoNetworkView.h"
#import "UIViewController+Helper.h"

@implementation NoNetworkView

-(id)initWithFrame:(CGRect)frame viewController:(UIViewController *)viewController hidden:(BOOL)boolHidden complete:(NoNetWorkBlock)comblock
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _noNetWorkBlock = comblock;
        
        [self setFrame:CGRectMake(viewController.view.frame.origin.x, [viewController getInitY]+36, viewController.view.frame.size.width, viewController.view.frame.size.height-[viewController getInitY]-36-44)];
        self.userInteractionEnabled = YES;
        self.hidden = boolHidden;
        [viewController.view addSubview:self];
        
        
    }
    return self;
}


//没有网络
-(void)noNetwork
{
    for (UIView *subView in self.subviews){
        [subView removeFromSuperview];
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-135/2, self.frame.size.height/2-124/2-44, 135, 124)];
    imageView.image = [UIImage imageNamed:@"netWorkFail.png"];
    [self addSubview:imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.frame.size.width/2-80/2, imageView.frame.origin.y+imageView.frame.size.height+10, 80, 34) ;
    [button setBackgroundImage:[UIImage imageNamed:@"reloadNet.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}


//请求数据失败
-(void)getDataFail
{
    
    for (UIView *subView in self.subviews){
        [subView removeFromSuperview];
    }
    
    UILabel *failLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-180/2, self.frame.size.height/2-40/2-44, 180, 40)];
    failLabel.text = @"无法加载数据";
    failLabel.font = [UIFont systemFontOfSize:17.0];
    failLabel.textColor = [UIColor grayColor];
    failLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:failLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.frame.size.width/2-80/2, failLabel.frame.origin.y+failLabel.frame.size.height+10, 80, 34) ;
    [button setBackgroundImage:[UIImage imageNamed:@"reloadNet.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    
}


//请求数据失败
-(void)getDataFail:(NSString *)failStr
{
    
    for (UIView *subView in self.subviews){
        [subView removeFromSuperview];
    }
    
    UILabel *failLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-180/2, self.frame.size.height/2-40/2-44, 180, 40)];
    failLabel.text = failStr;
    failLabel.font = [UIFont systemFontOfSize:17.0];
    failLabel.textColor = [UIColor grayColor];
    failLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:failLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.frame.size.width/2-80/2, failLabel.frame.origin.y+failLabel.frame.size.height+10, 80, 34) ;
    [button setBackgroundImage:[UIImage imageNamed:@"reloadNet.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    
}


//获取数据为空
-(void)getNoneData
{
    for (UIView *subView in self.subviews){
        [subView removeFromSuperview];
    }
    
    UILabel *failLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-150/2, self.frame.size.height/2-60/2-44, 150, 60)];
    failLabel.text = @"亲，暂无数据，赶快去拍照发布吧";
    failLabel.textColor = [UIColor grayColor];
    failLabel.font = [UIFont systemFontOfSize:15.0];
    failLabel.textAlignment = NSTextAlignmentCenter;
    failLabel.numberOfLines = 2;
    failLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self addSubview:failLabel];
}


//获取数据为空
-(void)getNoneUserData
{
    for (UIView *subView in self.subviews){
        [subView removeFromSuperview];
    }
    
    UILabel *failLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-150/2, self.frame.size.height/2-60/2-44, 150, 60)];
    failLabel.text = @"亲，暂无您的个人信息";
    failLabel.textColor = [UIColor grayColor];
    failLabel.font = [UIFont systemFontOfSize:15.0];
    failLabel.textAlignment = NSTextAlignmentCenter;
    failLabel.numberOfLines = 2;
    failLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self addSubview:failLabel];
}

-(void)getNonePriceData
{
    for (UIView *subView in self.subviews){
        [subView removeFromSuperview];
    }
    
    UILabel *failLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-180/2, self.frame.size.height/2-40/2-44, 180, 40)];
    failLabel.text = @"亲，暂无报价";
    failLabel.textColor = [UIColor grayColor];
    failLabel.font = [UIFont systemFontOfSize:15.0];
    failLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:failLabel];
}


-(void)buttonClick:(UIButton *)btn
{
    if (_noNetWorkBlock)
    {
        _noNetWorkBlock(YES);
    }
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
