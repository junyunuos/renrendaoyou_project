//
//  UIImage+ScaleImage.m
//  OPP
//
//  Created by MacBook on 9/10/14.
//  Copyright (c) 2014 com.chaobo. All rights reserved.
//

#import "UIImage+ScaleImage.h"

@implementation UIImage (ScaleImage)

-(UIImage *)imageWithMaxSize:(CGSize)maxSize
{
    
    if(self.size.width<maxSize.width&&self.size.height<maxSize.height)
    {
        return self;
    }
    
    CGFloat nwidth;
    CGFloat nheight;
    if(self.size.width/self.size.height<maxSize.width/maxSize.height)
    {
        nheight=maxSize.height;
        nwidth=nheight*self.size.width/self.size.height;
    }else{
        nwidth=maxSize.width;
        nheight=nwidth*self.size.height/self.size.width;
    }
    
    CGSize ssize=CGSizeMake(nwidth, nheight);
    // 创建一个bitmap的context
    UIGraphicsBeginImageContextWithOptions(ssize, false, self.scale);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, ssize.width, ssize.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *result=UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return result;
}

//等比例缩放
-(UIImage*)scaleToSize:(CGSize)size
{
    
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    if (size.width>width&&size.height>height) {
        return self;
    }
    
    float verticalRadio = size.height*1.0/height;
    float horizontalRadio = size.width*1.0/width;
    
    float radio = 1;
    if(verticalRadio>1 && horizontalRadio>1)
    {
        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    }
    else
    {
        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    }
    
    width = width*radio;
    height = height*radio;
    
    int xPos = (size.width - width)/2;
    int yPos = (size.height-height)/2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}



//截图
-(UIImage *)getSubImage:(CGRect)rect
{
//    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
//    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
//    
//    UIGraphicsBeginImageContext(smallBounds.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextDrawImage(context, smallBounds, subImageRef);
//    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef scale:self.scale orientation:UIImageOrientationUp];
//    UIGraphicsEndImageContext();
//    
    return nil;
}


-(UIImage *)antialiasedImageOfSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [self drawInRect:CGRectMake(1, 1, size.width-2, size.height-2)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

CGImageRef flip (CGImageRef im) {
    
    CGSize sz = CGSizeMake(CGImageGetWidth(im), CGImageGetHeight(im));
    
    UIGraphicsBeginImageContextWithOptions(sz, NO, 0);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, sz.width, sz.height), im);
    
    CGImageRef result = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
    
    UIGraphicsEndImageContext();
    
    return result;
    
}


@end
