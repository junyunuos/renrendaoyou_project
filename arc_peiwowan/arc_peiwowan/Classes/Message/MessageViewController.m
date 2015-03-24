//
//  MessageViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-3.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "MessageViewController.h"

#import "MessageCell.h"             //消息 cell

#import "LinkmanViewController.h"   //联系人 界面
@interface MessageViewController ()

@end

@implementation MessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"消息";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *leftBtn =[[UIBarButtonItem alloc]initWithTitle:@"发起群聊" style:UIBarButtonItemStyleBordered target:self action:@selector(groupChatVC)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"联系人" style:UIBarButtonItemStyleBordered target:self action:@selector(pushLinkmanVC)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)groupChatVC
{
    
}
-(void)pushLinkmanVC
{
    LinkmanViewController *linkmanVC =[[LinkmanViewController alloc]init];
    [self.navigationController pushViewController:linkmanVC animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UItableView DataSoucre
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"MessageCell";
    MessageCell *cell =(MessageCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell =[[[NSBundle mainBundle]loadNibNamed:@"MessageCell" owner:nil options:nil]lastObject];
    }
    return cell;
}
#pragma mark - UItableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//在弹出警告后自动取消选中表视图单元

}
@end
