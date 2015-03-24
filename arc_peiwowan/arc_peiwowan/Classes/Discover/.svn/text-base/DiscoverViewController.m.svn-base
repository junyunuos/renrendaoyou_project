//
//  DiscoverViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-3.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "DiscoverViewController.h"
//人
#import "NearbyTouristCell.h"               //附近游客 cell
#import "NearbyGuideCell.h"                 //附近导游 cell

#import "NearbyTouristInfoViewController.h" //附近游客信息 界面
#import "NearbyGuideInfoViewController.h"   //附近导游信息 界面

//小组
#import "MyGroupCell.h"                     //我的小组 cell
#import "RecommendCell.h"                   //推荐小组 cell
#import "GroupDetailsViewController.h"      //小组详情 界面
@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    //BarButtion
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(pushSearchPersonOrGroupVC)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    self.navigationItem.titleView=_navView;


}
-(void)pushSearchPersonOrGroupVC
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //人的tabieView
    if (tableView == self.tableView)
    {
        return 2;

    }
    //小组tableView
    else
    {
        return 2;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    //人
    if (tableView == self.tableView)
    {
         return 2;
    }
    //小组
    else
    {
        if (section == 0)
        {
            return 1;
        }
        return 2;
    }
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //人的tabieView
    if (tableView == self.tableView)
    {
        if (indexPath.section == 0)
        {
            static NSString *identifier = @"NearbyTouristCell";
            NearbyTouristCell *cell =(NearbyTouristCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil)
            {
                cell =[[[NSBundle mainBundle]loadNibNamed:@"NearbyTouristCell" owner:nil options:nil]lastObject];
            }
            return cell;
        }
        else
        {
            static NSString *identifier = @"NearbyGuideCell";
            NearbyGuideCell *cell =(NearbyGuideCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil)
            {
                cell =[[[NSBundle mainBundle]loadNibNamed:@"NearbyGuideCell" owner:nil options:nil]lastObject];
            }
            return cell;
            
        }
    }
    //小组tableView
    else
    {
        if (indexPath.section == 0)
        {
            static NSString *identifier = @"MyGroupCell";
            MyGroupCell *cell =(MyGroupCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil)
            {
                cell =[[[NSBundle mainBundle]loadNibNamed:@"MyGroupCell" owner:nil options:nil]lastObject];
            }
            return cell;
        }
        else
        {
            static NSString *identifier = @"RecommendCell";
            RecommendCell *cell =(RecommendCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil)
            {
                cell =[[[NSBundle mainBundle]loadNibNamed:@"RecommendCell" owner:nil options:nil]lastObject];
            }
            return cell;
            
        }
    }

}

#pragma mark - UITableView Delegate
//单元格 做选择
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //人tableView
    if (tableView == self.tableView)
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];//在弹出警告后自动取消选中表视图单元

        if (indexPath.section == 0)
        {
            NearbyTouristInfoViewController *NearbytouristInfoVC =[[NearbyTouristInfoViewController alloc]init];
            [self.navigationController pushViewController:NearbytouristInfoVC animated:YES];
        }
        else
        {
            NearbyGuideInfoViewController *nearbyGuideVC =[[NearbyGuideInfoViewController alloc]init];
            [self.navigationController pushViewController:nearbyGuideVC animated:YES];
        }
        

    }
    //小组tableView
    else
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];//在弹出警告后自动取消选中表视图单元
        GroupDetailsViewController *groupDetailsVC = [[GroupDetailsViewController alloc]init];
        [self.navigationController pushViewController:groupDetailsVC animated:YES];
    }

}

//分区间距
- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section
{
    //人的tabieView
    if (tableView == self.tableView)
    {
        if (section == 0)
        {
            return 10.0;
        }
        return 20.0 ;
    }
    //小组tableView
    else
    {
        if (section == 0)
        {
            return 30.0;
        }
        return 20.0 ;
    }

}
//section标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //人的tabieView
    if (tableView == self.tableView)
    {
        if (section == 0) {
            return @"";
        }
        else
            return @" 附近导游";
    }
    //小组tableView
    else
    {
        if (section == 0)
        {
            return @" 我的小组";
        }
        else
            return @" 推荐小组";
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //人的tabieView
    if (tableView == self.tableView)
    {
        return 65;
    }
    //小组tableView
    else
    {
        return 65;

    }
}

#pragma mark - Navigation titleView Button
- (IBAction)nav_Person_Bt_Action:(id)sender
{
    self.tableView.hidden = NO;
    self.groupTableView.hidden = YES;
    self.navigationItem.title = @"附近的人";
}

- (IBAction)nav_Group_Bt_action:(id)sender
{
    self.tableView.hidden = YES;
    self.groupTableView.hidden = NO;
    self.navigationItem.title = @"小组";

}
@end
