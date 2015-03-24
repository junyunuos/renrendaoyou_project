//
//  CostomActivityControllerViewController.h
//  Weida
//
//  Created by MacBook on 4/18/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CostomActivityDelegate

-(NSArray *)getButtonIcon;
-(void)performActivity:(int)tag;
-(void)reportPicture;

@end

@interface CostomActivityControllerViewController : UIViewController


@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, assign) id<CostomActivityDelegate> activitysDelegate;
-(void)getButtonImage;


@end
