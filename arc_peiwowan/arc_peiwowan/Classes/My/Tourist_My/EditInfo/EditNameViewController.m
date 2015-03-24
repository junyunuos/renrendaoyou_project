//
//  EditNameViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-10-31.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "EditNameViewController.h"

@interface EditNameViewController ()

@end

@implementation EditNameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"更改名字";
        
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
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveName)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
//    _nameInput.text = [AccountManager shareAccountManager].bean.name;
}
-(void)saveName
{
//    if (self.delegate)
//    {
//        [self.delegate  finishNameEdit:_nameInput.text];
//    }
//    [[AccountManager shareAccountManager] updateName:_nameInput.text];
//    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.edit_name_TextField resignFirstResponder];
}
@end
