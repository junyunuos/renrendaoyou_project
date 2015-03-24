//
//  TopicDetailsViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-5.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "TopicDetailsViewController.h"

@interface TopicDetailsViewController ()

@end

@implementation TopicDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"话题详情";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStyleBordered target:self action:@selector(topicDetailsMore)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)topicDetailsMore
{
    NSLog(@"话题详情更多");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
