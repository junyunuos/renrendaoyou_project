//
//  SocialView.h
//  arc_peiwowan
//
//  Created by MacBook on 11/13/14.
//  Copyright (c) 2014 MacBook. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SocialViewBlock)(NSInteger height);

@interface SocialView : UIView

@property (nonatomic, strong) NSString *dynamicId;
@property (nonatomic, copy) SocialViewBlock socialViewBlock;

-(void)setValue:(NSDictionary *)dic withRow:(NSInteger)index complete:(SocialViewBlock)compelete;

@end
