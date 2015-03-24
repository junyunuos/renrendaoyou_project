//
//  CImageAndLabelView.h
//  OPP
//
//  Created by MacBook on 9/9/14.
//  Copyright (c) 2014 com.chaobo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, OPViewStyleType)
{
    OPViewStyleTypeComment,
    OPViewStyleTypeShare,
    OPViewStyleTypePraise,
    
};


@protocol CImageAndLabelViewDelegate <NSObject>

@optional
-(void)commentDelegate:(BOOL)isMainComment;
-(void)shareDelegate;
-(void)praiseDelegate;

@end

@interface CImageAndLabelView : UIView

@property (nonatomic, assign) BOOL isMainComment;
@property (nonatomic, assign) OPViewStyleType opViewStyleType;
@property (nonatomic, assign) id<CImageAndLabelViewDelegate> delegate;

-(void)setValue:(NSString *)labelStr withImage:(UIImage *)image withFont:(CGFloat)font withTextColor:(UIColor *)color;
-(void)setTextLabelColor:(UIColor *)color withText:(NSString *)text;
-(void)setImageFrame:(CGSize)imageSize withTextFrame:(CGSize)textSize;

@end
