//
//  GroupDetailsViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-5.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "GroupDetailsViewController.h"

#import "PublishTopicCell.h"            //小组发布话题 cell

#import "PublishTopicViewController.h"  //发布话题 界面
#import "TopicDetailsViewController.h"  //话题详情 界面
@interface GroupDetailsViewController ()

@end

@implementation GroupDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"发布旅游需求";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStyleBordered target:self action:@selector(GroupDetailsMore)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)GroupDetailsMore
{
    //判断当前帐号是否是这个话题的组长
    NSLog(@"小组详情更多");
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableView DataSoucre
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"PublishTopicCell";
    PublishTopicCell *cell =(PublishTopicCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell =[[[NSBundle mainBundle]loadNibNamed:@"PublishTopicCell" owner:nil options:nil]lastObject];
    }
    return cell;
}
#pragma mark - UITableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//在弹出警告后自动取消选中表视图单元
    TopicDetailsViewController *topicDetailsVC =[[TopicDetailsViewController alloc]init];
    [self.navigationController pushViewController:topicDetailsVC animated:YES];

}

#pragma mark - UIButton Action
- (IBAction)push_publish_topic:(id)sender
{
    PublishTopicViewController *publishTopicVC =[[PublishTopicViewController alloc]init];
    [self.navigationController pushViewController:publishTopicVC animated:YES];
}
@end
