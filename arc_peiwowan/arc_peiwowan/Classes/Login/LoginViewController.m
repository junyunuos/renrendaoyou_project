//
//  LoginViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-10-31.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"  //主 界面
#import "Tourist_MyViewController.h"
#import "WBNavigationController.h"
#import "AppDelegate.h"
#import "MKNetworkEngine.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

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
    _tel.text = @"13800138001";
    _pw.text = @"123456";
    [self initNetwork];
    // Do any additional setup after loading the view from its nib.
}

-(void) initNetwork
{
	APPDelagate.appNetwork = [[MKNetworkEngine alloc] initWithHostName:@"114.215.153.50"
                                                      customHeaderFields:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//登录、网络请求
- (IBAction)login:(id)sender
{
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:_tel.text forKey:@"tel"];
    [dic setObject:_pw.text forKey:@"pw"];
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/User/login" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        //NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
        //NSLog(@"respon is %@",msgData);
        
        id json = [completedOperation responseJSON];
        NSDictionary *jd = (NSDictionary *)json;
        NSString *isok = [jd objectForKey:@"isOk"];
        
        if (isok.intValue == 1) {
            
            NSDictionary *user = [jd objectForKey:@"user"];
            NSString *_id = [user objectForKey:@"id"];
            APPDelagate.uid = _id;
            APPDelagate.token =  [jd objectForKey:@"token"];
            
            MainViewController *mainVC =[[MainViewController alloc]init];
            [self presentViewController:mainVC animated:YES completion:nil];
        }

        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
    
}



@end
