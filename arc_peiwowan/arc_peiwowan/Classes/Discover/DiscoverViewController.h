//
//  DiscoverViewController.h
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-3.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//  发现

#import <UIKit/UIKit.h>

@interface DiscoverViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *navView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *groupTableView;

- (IBAction)nav_Person_Bt_Action:(id)sender;
- (IBAction)nav_Group_Bt_action:(id)sender;

@end
