//
//  HomeCustomTitleView.m
//  arc_peiwowan
//
//  Created by MacBook on 11/12/14.
//  Copyright (c) 2014 MacBook. All rights reserved.
//

#import "HomeCustomTitleView.h"
#import "EventDispatcher.h"

@implementation HomeCustomTitleView
{
    NSInteger _count;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorRGB(0,146,197);
        self.layer.cornerRadius = 15;
        
        
    }
    return self;
}

//初始化view
-(void)initView:(NSArray *)titleArray
{
    NSInteger count = [titleArray count];
    _count = count;
    //点击事件
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, (self.frame.size.width-2)/count, self.frame.size.height-2)];
    imageView.backgroundColor = UIColorRGB(0,192,238);
    imageView.layer.cornerRadius = 14;
    imageView.layer.masksToBounds = YES;
    imageView.userInteractionEnabled = YES;
    imageView.tag = 103;
    [self addSubview:imageView];
    
    
    for (NSInteger i=0; i<count; i++)
    {
        UIButton *label = [[UIButton alloc] initWithFrame:CGRectMake(0+i*self.frame.size.width/count, 0, self.frame.size.width/count, self.frame.size.height)];
        [label setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [label setTitleColor:UIColorRGB(0,192,238) forState:UIControlStateNormal];
        //label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];//UIColorRGB(0,192,238);
        label.layer.cornerRadius = 15;
        label.tag = 100 + i;
        [label addTarget:self action:@selector(onClickLabelEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:label];
        
        if (i == 0)
        {
            //label.backgroundColor = UIColorRGB(0,192,238);
            [label setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }

    }
}


//点击label
-(void)onClickLabelEvent:(UIButton *)button
{
    //
    NSInteger index = button.tag-100;
    DataEvent* dataEvent=[[DataEvent alloc] initWithTarget:self data:[NSNumber numberWithInt:index]];
    [self dispatcherEvent:kHomeTitleString event:dataEvent];
    
    //设置图片的位置
    [self changeImageViewPosition:index];
    
    //
    [self changeLabelTextColor:index];
}


-(void)changeImageViewPosition:(NSInteger)index
{
    UIImageView *imageView = (UIImageView *)[self viewWithTag:103];
    CGFloat width = imageView.frame.size.width;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [imageView setFrame:CGRectMake(1+index*width, imageView.frame.origin.y, width, imageView.frame.size.height)];
        //NSLog(@"%@",NSStringFromCGRect(imageView.frame));
        
    } completion:^(BOOL finished) {
        
    }];
}


-(void)changeLabelTextColor:(NSInteger)index
{
    for (NSInteger i=0; i<_count; i++)
    {
        UIButton *label = (UIButton *)[self viewWithTag:100+i];
        if (label.tag==index+100)
        {
            [label setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else
        {
            [label setTitleColor:UIColorRGB(0,192,238) forState:UIControlStateNormal];
        }
    }
}


@end
