//
//  Guide_MyViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-10-31.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "Guide_MyViewController.h"

#import "Guide_myCell.h"                    //（导游）我的 界面 cell
#import "GuideEditUserInfoViewController.h"      // 编辑 界面

      //我赞过的        界面
#import "GuideOderformViewController.h"     //我的订单(导游)  界面
#import "MyWalletViewController.h"          //我的钱包       界面
#import "MePublishRouteViewController.h"
@interface Guide_MyViewController ()

@end

@implementation Guide_MyViewController

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
    
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered target:self action:@selector(pushEditVC)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)pushEditVC
{
    GuideEditUserInfoViewController *guideEditInfoVC =[[GuideEditUserInfoViewController alloc]init];
    [self.navigationController pushViewController:guideEditInfoVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView DataSoucre

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
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
            static NSString *identifier = @"Guide_myCell";
            Guide_myCell *cell =(Guide_myCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil)
            {
                cell =[[[NSBundle mainBundle]loadNibNamed:@"Guide_myCell" owner:nil options:nil]lastObject];
            }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

                switch (indexPath.row)
            {
                case 0:
                    cell.tourist_my_label.text = @"我发布的路线";
                    break;
                case 1:
                    cell.tourist_my_label.text = @"我发布的动态";
                    break;
                case 2:
                    cell.tourist_my_label.text = @"我赞过的";
                    break;

                default:
                    break;
            }
            return cell;
    }
    else
    {
        static NSString *identifier = @"Guide_myCell";
        Guide_myCell *cell =(Guide_myCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell =[[[NSBundle mainBundle]loadNibNamed:@"Guide_myCell" owner:nil options:nil]lastObject];
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
        MePublishRouteViewController *mePublishRouteVC =[[MePublishRouteViewController alloc]init];
        [self.navigationController pushViewController:mePublishRouteVC animated:YES];
        
        

        
        
    }else if([indexPath section] == 0 && [indexPath row] == 1)
    {
        
//        MyPublishDynamicViewController *myPublishDynamicVC =[[MyPublishDynamicViewController alloc]init];
//        [self.navigationController pushViewController:myPublishDynamicVC animated:YES];
    }
    else if([indexPath section] == 0 && [indexPath row] == 2)
    {
//        mePraiseViewController *mepraiseVC =[[mePraiseViewController alloc]init];
//        [self.navigationController pushViewController:mepraiseVC animated:YES];
    }
    else if([indexPath section] == 1 && [indexPath row] == 0)
    {
        GuideOderformViewController *guideOrderformVC =[[GuideOderformViewController alloc]init];
        [self.navigationController pushViewController:guideOrderformVC animated:YES];
    }else if([indexPath section] == 1 && [indexPath row] == 1)
    {
        MyWalletViewController *myWalletVC =[[MyWalletViewController alloc]init];
        [self.navigationController pushViewController:myWalletVC animated:YES];
    }
    
}

@end
