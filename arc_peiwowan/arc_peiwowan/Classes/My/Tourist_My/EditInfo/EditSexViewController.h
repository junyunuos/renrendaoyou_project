//
//  EditSexViewController.h
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-3.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//  更改 性别

#import <UIKit/UIKit.h>

@interface EditSexViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic,copy)  NSString *sex;

@end
