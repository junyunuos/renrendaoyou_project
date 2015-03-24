//
//  IntroGuideViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-10-31.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "IntroGuideViewController.h"
#import "LoginViewController.h"     //登录 界面
#import "MainViewController.h"
#import "AppDelegate.h"
@interface IntroGuideViewController ()

@end

@implementation IntroGuideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender
{
    LoginViewController *loginVC =[[LoginViewController alloc]init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

- (IBAction)register:(id)sender {
}
- (IBAction)stroll:(id)sender {
    
    APPDelagate.uid =@"1";
    APPDelagate.token = @"342342";
    
    MainViewController *mainVC =[[MainViewController alloc]init];
    [self presentViewController:mainVC animated:YES completion:nil];
    
}
@end
