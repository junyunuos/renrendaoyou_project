//
//  GuideOderformDetailsViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-7.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "GuideOderformDetailsViewController.h"

@interface GuideOderformDetailsViewController ()

@end

@implementation GuideOderformDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0)
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        self.navigationItem.title = @"订单详情";

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"投诉" style:UIBarButtonItemStyleBordered target:self action:@selector(pushComplaintTouristVC)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)pushComplaintTouristVC
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
