//
//  CButtonBar.h
//  DressStyle
//
//  Created by MacBook on 2/14/14.
//  Copyright (c) 2014 yn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CButtonBar : UIView

@property(nonatomic,weak)NSObject* target;
@property(nonatomic,assign)SEL action;
@property(nonatomic,assign) NSUInteger _currentSelectedIndex;

-(void)addButton:(NSString*)title;
-(void)clear;
-(void)setSelectedIndex:(NSUInteger)index;
-(NSUInteger)getSelectedIndex;

@end


@interface CButtonBarItem : UIView

@property(nonatomic,strong)UILabel* titleLabel;
@property(nonatomic,assign)NSUInteger index;

-(void)setSelected:(bool)selected;

@end