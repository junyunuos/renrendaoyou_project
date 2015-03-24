//
//  PublishTopicViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-5.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "PublishTopicViewController.h"

@interface PublishTopicViewController ()

@end

@implementation PublishTopicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"发布话题";
        //IOS7 tableView被navigationBar挡住了
        if([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0)
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(confirmPublishTopic)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)confirmPublishTopic
{
    NSLog(@"确定发布话题");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
