//
//  CImageAndLabelView.m
//  OPP
//
//  Created by MacBook on 9/9/14.
//  Copyright (c) 2014 com.chaobo. All rights reserved.
//

#import "CImageAndLabelView.h"

@implementation CImageAndLabelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16, 26)];
        imageView.tag = 100;
        //imageView.backgroundColor = [UIColor greenColor];
        [self addSubview:imageView];
        
        UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+ imageView.frame.size.width+4, imageView.frame.origin.y, 70, frame.size.height)];
        commentLabel.tag = 101;
        commentLabel.backgroundColor = [UIColor clearColor];
        //commentLabel.textColor = UIColorFromRGB(0xAFAFAF);
        commentLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:commentLabel];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickSelf:)];
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap];
        
    }
    return self;
}


//赋值
-(void)setValue:(NSString *)labelStr withImage:(UIImage *)image withFont:(CGFloat)font withTextColor:(UIColor *)color
{
    
    UIImageView *imageView = (UIImageView *)[self viewWithTag:100];
    imageView.image = image;
    
    UILabel *commentLabel = (UILabel *)[self viewWithTag:101];
    commentLabel.text = labelStr;
    commentLabel.font = [UIFont systemFontOfSize:font];
    commentLabel.textColor = color;
    
}


//设置frame
-(void)setImageFrame:(CGSize)imageSize withTextFrame:(CGSize)textSize
{
    UIImageView *imageView = (UIImageView *)[self viewWithTag:100];
    CGRect rect = imageView.frame;
    rect.size = imageSize;
    imageView.frame = rect;
    
    UILabel *commentLabel = (UILabel *)[self viewWithTag:101];
    CGRect rect1 = commentLabel.frame;
    rect1.size = textSize;
    commentLabel.frame = rect1;
}


//设置点赞字体的内容
-(void)setTextLabelColor:(UIColor *)color withText:(NSString *)text
{
    UILabel *commentLabel = (UILabel *)[self viewWithTag:101];
    commentLabel.text = text;
    commentLabel.textColor = color;
}


//评论按钮
-(void)onClickSelf:(UITapGestureRecognizer *)tap
{
    
    if (_opViewStyleType==OPViewStyleTypeComment)
    {
        if ([self.delegate respondsToSelector:@selector(commentDelegate:)])
        {
            [self.delegate commentDelegate:_isMainComment];
        }
        
    }
    else if(_opViewStyleType==OPViewStyleTypeShare)
    {
        if ([self.delegate respondsToSelector:@selector(shareDelegate)])
        {
            [self.delegate shareDelegate];
        }
        
    }
    else if (_opViewStyleType==OPViewStyleTypePraise)
    {
        if ([self.delegate respondsToSelector:@selector(praiseDelegate)])
        {
            [self.delegate praiseDelegate];
        }
    }
}


@end
