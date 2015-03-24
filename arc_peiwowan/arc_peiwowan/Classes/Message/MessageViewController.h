//
//  MessageViewController.h
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-3.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//  消息

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
