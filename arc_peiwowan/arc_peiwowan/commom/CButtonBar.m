//
//  CButtonBar.m
//  DressStyle
//
//  Created by MacBook on 2/14/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import "CButtonBar.h"

@implementation CButtonBar
{
    CButtonBarItem* currentSelectedItem;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)addButton:(NSString*)title
{
    CButtonBarItem* item=[[CButtonBarItem alloc] initWithFrame:CGRectZero];
    item.index=self.subviews.count;
    [self addSubview:item];
    [item.titleLabel setText:title];
    
    CGFloat width=self.frame.size.width/self.subviews.count;
    NSArray* sviews=self.subviews;
    CGFloat sx=0;
    for(NSInteger i=0;i<sviews.count;i++)
    {
        CButtonBarItem* item=sviews[i];
        item.tag = i;
        [item setFrame:CGRectMake(sx, 0, width, self.frame.size.height)];
        
        sx=sx+width;
        
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, item.frame.size.height+0.5, item.frame.size.width, 0.5)];
        lineLabel.alpha = 0.2;
        lineLabel.backgroundColor = [UIColor grayColor];
        [item addSubview:lineLabel];
    }

}

-(void)setSelectedIndex:(NSUInteger)index
{
    if(currentSelectedItem!=nil)
    {
        if(currentSelectedItem.index==index)
        {
            return;
        }
        [currentSelectedItem setSelected:false];
    }
    
    NSArray* sviews = self.subviews;
    
    currentSelectedItem = sviews[index];
    
    [currentSelectedItem setSelected:true];
    
    if(_target!=nil)
    {
        if ([_target respondsToSelector:_action])
        {
            [_target performSelector:_action withObject:currentSelectedItem];
        }
    }
}


-(NSUInteger)getSelectedIndex
{
    return currentSelectedItem.index;
}


-(void)clear
{
    while(self.subviews.count>0)
    {
        UIView* subView= self.subviews.firstObject;
        [subView removeFromSuperview];
    }
}

@end


@implementation CButtonBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,  0, frame.size.width, frame.size.height)];
        [_titleLabel setFont:[UIFont systemFontOfSize:16]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        _titleLabel.backgroundColor = [UIColor clearColor];
        //255,100,151
        [_titleLabel setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]];
        [self addSubview:_titleLabel];

        
        UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        singleRecognizer.numberOfTapsRequired = 1; // 单击
        singleRecognizer.numberOfTouchesRequired = 1;//点击的手指数
        [self addGestureRecognizer:singleRecognizer];
        
    }
    return self;
}


-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [_titleLabel setFrame:CGRectMake(0,  0, frame.size.width, frame.size.height-0.6)];

}

-(void)setSelected:(bool)selected
{
    if(selected)
    {
        //[_titleLabel setTextColor:[UIColor colorWithRed:255/255.0 green:100/255.0 blue:151/255.0 alpha:1]];
        
        [_titleLabel setTextColor:[UIColor blueColor] ];
    }
    else
    {
        //102,102,102
        //[_titleLabel setTextColor:[UIColor blueColor] ];
        [_titleLabel setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
    }
}


-(void)singleTap:(UITapGestureRecognizer*)recognizer
{
    CButtonBar* buttonBar=(CButtonBar*)self.superview;
    [buttonBar setSelectedIndex:_index];

}



@end
