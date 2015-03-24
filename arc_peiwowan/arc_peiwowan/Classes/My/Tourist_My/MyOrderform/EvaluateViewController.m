//
//  EvaluateViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-7.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "EvaluateViewController.h"

@interface EvaluateViewController ()

@end

@implementation EvaluateViewController

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
        self.navigationItem.title = @"评价";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStyleBordered target:self action:@selector(evaluatePublishVC)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)evaluatePublishVC
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark textView Delegate
//限制输入字数
-(BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [self.textViewInput resignFirstResponder];
    }
    else
    {
        self.statusLabel.text = [NSString stringWithFormat:@"%d/100",self.textViewInput.text.length];
        if ([text isEqualToString:@""] && range.length > 0)
        {
            //删除字符肯定是安全的
            return YES;
        }
        
        else
        {
            if (self.textViewInput.text.length - range.length + text.length > 100)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"超出最大可输入长度" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alert show];
                return NO;
            }
            else
            {
                return YES;
            }
        }
    }
    return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textViewInput resignFirstResponder];
}
@end
