//
//  HelloViewController.h
//  Hellow_WordDemo
//
//  Created by guoqiang on 14/10/29.
//  Copyright (c) 2014年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MePublishRouteViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//添加向左向右滑动手势
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@end
