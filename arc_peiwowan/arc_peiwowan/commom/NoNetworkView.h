//
//  NoDataView.h
//  Weida
//
//  Created by MacBook on 7/8/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ NoNetWorkBlock)(BOOL isReload);

@interface NoNetworkView : UIView

@property (nonatomic, copy) NoNetWorkBlock noNetWorkBlock;

-(void)noNetwork;
-(void)getDataFail;
-(void)getNoneData;
-(void)getNonePriceData;
-(void)getNoneUserData;
-(void)getDataFail:(NSString *)failStr;

-(id)initWithFrame:(CGRect)frame viewController:(UIViewController *)viewController hidden:(BOOL)boolHidden complete:(NoNetWorkBlock)comblock;

@end