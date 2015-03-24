//
//  EditSexViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-3.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "EditSexViewController.h"

@interface EditSexViewController ()

@end

@implementation EditSexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"性别";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveSex)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
//    _sex = [AccountManager shareAccountManager].bean.sex;

}
-(void)saveSex
{
//    [[AccountManager shareAccountManager] updateSex:_sex];
//    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier =@"editSexCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    switch (indexPath.row)
    {
        case 0:
            [cell.textLabel setText:@"男"];
            if ([_sex isEqual:@"男"])
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            
            
            break;
        case 1:
            [cell.textLabel setText:@"女"];
            if ([_sex isEqual:@"女"])
            {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            
            break;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//在弹出警告后自动取消选中表视图单元
    
    //把字符串设置，然后传回去
    if (indexPath.row == 0)
    {
        _sex = @"男";
        
    }else if(indexPath.row==1)
    {
        _sex = @"女";
    }
    [_tableView reloadData];
}
//分区间距
- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section
{
    return 10.0 ;
}
@end
