//
//  UIImage+ScaleImage.h
//  OPP
//
//  Created by MacBook on 9/10/14.
//  Copyright (c) 2014 com.chaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ScaleImage)

-(UIImage*)imageWithMaxSize:(CGSize)maxSize;
-(UIImage*)scaleToSize:(CGSize)size;

//-(UIImage *)scaleImage:(UIImage*)image withSize:(CGSize)size;
-(UIImage *)antialiasedImageOfSize:(CGSize)size;
-(UIImage *)getSubImage:(CGRect)rect;



@end
