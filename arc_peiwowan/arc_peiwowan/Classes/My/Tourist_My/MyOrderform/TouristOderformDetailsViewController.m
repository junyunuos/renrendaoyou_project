//
//  TouristOderformDetailsViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-7.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "TouristOderformDetailsViewController.h"

#import "EvaluateViewController.h"              //评价 界面
@interface TouristOderformDetailsViewController ()

@end

@implementation TouristOderformDetailsViewController

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
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"投诉" style:UIBarButtonItemStyleBordered target:self action:@selector(pushComplaintGuideVC)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)pushComplaintGuideVC
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)affirmPayment:(id)sender
{
    //付款时，弹出 是否付款 yes or no
    //银行卡，不够钱时，弹出 余额不做，请充值，或者请选择其他交易的银行卡
    //银行卡，够钱时，计算支付多少钱，算出银行卡的余额 ,然后再弹出，付款成功。是否要去评价该导游。
    //如果点击是，push 评价。点击否 不push
    NSLog(@"确认付款");
    
    NSLog(@"push 评价界面");
    EvaluateViewController  *evaluateVC =[[EvaluateViewController alloc]init];
    [self.navigationController pushViewController:evaluateVC animated:YES];
}
@end
