//
//  Tourist_MyViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-10-31.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "Tourist_MyViewController.h"

#import "Tourist_myCell.h"                  //（游客）我的 界面 cell
#import "EditUserInfoViewController.h"      // 编辑 界面

//#import "MyPublishDynamicViewController.h"  //我发布的动态 界面
//#import "mePraiseViewController.h"          //我赞过的    界面
#import "MyOrderformViewController.h"       //我的订单    界面
#import "MyWalletViewController.h"          //我的钱包    界面
#import "ApplyToBeGuideViewController.h"    //申请成为导游 界面
@interface Tourist_MyViewController ()

@end

@implementation Tourist_MyViewController

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
//    
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered target:self action:@selector(pushEditVC)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}
-(void)pushEditVC
{
    EditUserInfoViewController *editInfoVC =[[EditUserInfoViewController alloc]init];
    [self.navigationController pushViewController:editInfoVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView DataSoucre

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 1;
    }
    else
    {
        return 2;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section] == 0)
    {
            static NSString *identifier = @"Tourist_myCell";
            Tourist_myCell *cell =(Tourist_myCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil)
            {
                cell =[[[NSBundle mainBundle]loadNibNamed:@"Tourist_myCell" owner:nil options:nil]lastObject];
            }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

                switch (indexPath.row)
            {
                case 0:
                    cell.tourist_my_label.text = @"我发布的动态";
                    break;
                case 1:
                    cell.tourist_my_label.text = @"我赞过的";
                    break;

                default:
                    break;
            }
            return cell;
    }
    else if ([indexPath section] == 1)
    {
        static NSString *identifier = @"Tourist_myCell";
        Tourist_myCell *cell =(Tourist_myCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell =[[[NSBundle mainBundle]loadNibNamed:@"Tourist_myCell" owner:nil options:nil]lastObject];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        switch (indexPath.row)
        {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            case 0:
                cell.tourist_my_label.text = @"我的订单";
                break;
            case 1:
                cell.tourist_my_label.text = @"我的钱包";
                break;
                
            default:
                break;
        }
        return cell;
    }else
    {
        
        static NSString *identifier = @"Tourist_myCell";
        Tourist_myCell *cell =(Tourist_myCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell =[[[NSBundle mainBundle]loadNibNamed:@"Tourist_myCell" owner:nil options:nil]lastObject];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        cell.tourist_my_label.text = @"申请成为导游";
        return cell;
    }
}
#pragma mark - UITableView Delegate

//分区间距
- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section
{
    return 10.0 ;
}


//单元格 做选择
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//在弹出警告后自动取消选中表视图单元
    if ([indexPath section] == 0 && [indexPath row] == 0)
    {
//        MyPublishDynamicViewController *myPublishDynamicVC =[[MyPublishDynamicViewController alloc]init];
//        [self.navigationController pushViewController:myPublishDynamicVC animated:YES];
    }else if([indexPath section] == 0 && [indexPath row] == 1)
    {
//        mePraiseViewController *mepraiseVC =[[mePraiseViewController alloc]init];
//        [self.navigationController pushViewController:mepraiseVC animated:YES];
    }else if([indexPath section] == 1 && [indexPath row] == 0)
    {
        MyOrderformViewController *myOrderformVC =[[MyOrderformViewController alloc]init];
        [self.navigationController pushViewController:myOrderformVC animated:YES];
    }else if([indexPath section] == 1 && [indexPath row] == 1)
    {
        MyWalletViewController *myWalletVC =[[MyWalletViewController alloc]init];
        [self.navigationController pushViewController:myWalletVC animated:YES];
    }else
    {
        ApplyToBeGuideViewController *applyGuide =[[ApplyToBeGuideViewController alloc]init];
        [self.navigationController pushViewController:applyGuide animated:YES];
    }
    
    
}

@end
