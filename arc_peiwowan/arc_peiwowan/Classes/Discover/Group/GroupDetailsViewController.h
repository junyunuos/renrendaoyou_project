//
//  GroupDetailsViewController.h
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-5.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupDetailsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)push_publish_topic:(id)sender;

@end
