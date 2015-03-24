//
//  MyOrderformViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-3.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "MyOrderformViewController.h"

#import "TouristOderformCell.h"                     //游客 订单 cell
#import "TouristOderformDetailsViewController.h"    //游客 订单详情 界面
@interface MyOrderformViewController ()

@end

@implementation MyOrderformViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"我的订单";
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
#pragma mark - UItableview Datasoucre
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"TouristOderformCell";
    TouristOderformCell *cell =(TouristOderformCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell =[[[NSBundle mainBundle]loadNibNamed:@"TouristOderformCell" owner:nil options:nil]lastObject];
    }
    return cell;
}
#pragma mark - UItableview Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//在弹出警告后自动取消选中表视图单元
    TouristOderformDetailsViewController *touristOderformDetailsVC =[[TouristOderformDetailsViewController alloc]init];
    [self.navigationController pushViewController:touristOderformDetailsVC animated:YES];
    
}
@end
