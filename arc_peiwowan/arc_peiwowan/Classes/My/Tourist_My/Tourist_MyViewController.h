//
//  Tourist_MyViewController.h
//  arc_peiwowan
//
//  Created by Selina Lee on 14-10-31.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//  (游客)我的

#import <UIKit/UIKit.h>

@interface Tourist_MyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
