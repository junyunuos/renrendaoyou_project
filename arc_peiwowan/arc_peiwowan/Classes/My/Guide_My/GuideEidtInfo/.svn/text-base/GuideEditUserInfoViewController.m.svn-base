//
//  GuideEditUserInfoViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-10-31.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "GuideEditUserInfoViewController.h"

#import "GuideUserIconCell.h"           //（导游）头像 cell
#import "GuideUserInfoCell.h"           // (导游)信息 cell
#import "GuideUserIntroCell.h"          //（导游）简介 cell

//基本信息
#import "EditNameViewController.h"      //更改姓名 界面
#import "EditSexViewController.h"       //更改性别 界面
#import "EditBirthdayViewController.h"  //更改生日 界面
#import "EditAddressViewController.h"   //更改地址 界面
#import "EditIntroViewController.h"     //更改简介 界面

//认证
#import "AttestationPhoneNumberViewController.h" //手机认证     界面
#import "AttestationIDCardViewController.h"      //身份证认证   界面
#import "AttestationTrueIconViewController.h"    //真实头像认证  界面
#import "AttestationGuideCardViewController.h"   //导游证认证   界面

@interface GuideEditUserInfoViewController ()

@end

@implementation GuideEditUserInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"个人信息";
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
#pragma mark - UITableView DataSoucre
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 6;
    }
    else
    {
        return 4;
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            static NSString *identifier = @"GuideUserIconCell";
            GuideUserIconCell *cell =(GuideUserIconCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil)
            {
                cell =[[[NSBundle mainBundle]loadNibNamed:@"GuideUserIconCell" owner:nil options:nil]lastObject];
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            return cell;
            
        }
        else
        {
            if (indexPath.row == 5)
            {
                static NSString *identifier = @"GuideUserIntroCell";
                GuideUserIntroCell *cell =(GuideUserIntroCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
                if (cell == nil)
                {
                    cell =[[[NSBundle mainBundle]loadNibNamed:@"GuideUserIntroCell" owner:nil options:nil]lastObject];
                }
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;
            }
            else
            {
                static NSString *identifier = @"GuideUserInfoCell";
                GuideUserInfoCell *cell =(GuideUserInfoCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
                if (cell == nil)
                {
                    cell =[[[NSBundle mainBundle]loadNibNamed:@"GuideUserInfoCell" owner:nil options:nil]lastObject];
                }
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                switch (indexPath.row)
                {
                    case 1:
                        cell.user_info_name_label.text = @"昵称";
                        break;
                    case 2:
                        cell.user_info_name_label.text = @"性别";
                        break;
                    case 3:
                        cell.user_info_name_label.text = @"生日";
                        break;
                    case 4:
                        cell.user_info_name_label.text = @"地址";
                        break;
                        
                    default:
                        break;
                }
                
                return cell;
            }
            
        }
    }
    else
    {
        static NSString *identifier = @"GuideUserInfoCell";
        GuideUserInfoCell *cell =(GuideUserInfoCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil)
        {
            cell =[[[NSBundle mainBundle]loadNibNamed:@"GuideUserInfoCell" owner:nil options:nil]lastObject];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        switch (indexPath.row)
        {
            case 0:
                cell.user_info_name_label.text = @"手机";
                break;
            case 1:
                cell.user_info_name_label.text = @"身份证";
                break;
            case 2:
                cell.user_info_name_label.text = @"真实头像";
                break;
            case 3:
                cell.user_info_name_label.text = @"导游证";
                break;
                
            default:
                break;
        }
        
        return cell;
    }

}
#pragma mark - UITableView Delegate
//单元格 高度
//
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            return 75;
        }
//        //简介
//        else if (indexPath.row == 5)
//        {
//            return 100;
//        }
        else
        {
            return 44;
        }
    }
    else
    {
        return 44;
    }

}
//分区间距
- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section
{
    return 20.0 ;
}

//单元格 做选择
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//在弹出警告后自动取消选中表视图单元
    
    
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
                [self changeUserHead];
                break;
            case 1:
            {
                EditNameViewController *editNameVC =[[EditNameViewController alloc]init];
                [self.navigationController pushViewController:editNameVC animated:YES];
            }
                break;
            case 2:
            {
                EditSexViewController *editSexVC =[[EditSexViewController alloc]init];
                [self.navigationController pushViewController:editSexVC animated:YES];
            }
                break;
            case 3:
            {
                EditBirthdayViewController *editBirthdayVC =[[EditBirthdayViewController alloc]init];
                [self.navigationController pushViewController:editBirthdayVC animated:YES];
            }
                break;
            case 4:
            {
                EditAddressViewController *editAddressVC =[[EditAddressViewController alloc]init];
                [self.navigationController pushViewController:editAddressVC animated:YES];
            }
                break;
            case 5:
            {
                EditIntroViewController *editIntroVC =[[EditIntroViewController alloc]init];
                [self.navigationController pushViewController:editIntroVC animated:YES];
            }
                break;
                
            default:
                break;
        }
    }
    else
    {
        switch (indexPath.row)
        {
            case 0:
            {
                AttestationPhoneNumberViewController *atstionPNumberVC =[[AttestationPhoneNumberViewController alloc]init];
                [self.navigationController pushViewController:atstionPNumberVC animated:YES];
            }
                break;
            case 1:
            {
                AttestationIDCardViewController *atstionIDCardVC =[[AttestationIDCardViewController alloc]init];
                [self.navigationController pushViewController:atstionIDCardVC animated:YES];
            }
                break;
            case 2:
            {
                AttestationTrueIconViewController *attestationTrueIconVC =[[AttestationTrueIconViewController alloc]init];
                [self.navigationController pushViewController:attestationTrueIconVC animated:YES];
            }
                break;
            case 3:
            {
                AttestationGuideCardViewController  *attestationGuideCardVC =[[AttestationGuideCardViewController alloc]init];
                [self.navigationController pushViewController:attestationGuideCardVC animated:YES];
            }
                break;
                
            default:
                break;

        }
    }

    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"";
    }
    else
        return @" 认证";
}
#pragma mark - click cell Action method
- (void)changeUserHead
{
    UIActionSheet *as=[[UIActionSheet alloc]initWithTitle:@"上传头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册中选取", nil ];
    [as showInView:self.view];
}
#pragma mark ----------ActionSheet 按钮点击-------------
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"用户点击的是第%d个按钮",buttonIndex);
    NSUInteger sourceType = 0;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        switch (buttonIndex) {
                
                
                
            case 0:
                
                // 相机
                
                sourceType = UIImagePickerControllerSourceTypeCamera;
                
                break;
                
            case 1:
                
                // 相册
                
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                
                break;
            case 2:
                
                return;
        }
        
    }
    
    else {
        
        if (buttonIndex == 0) {
            
            return;
            
        } else {
            
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            
        }
        
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    
    imagePickerController.allowsEditing = YES;
    
    imagePickerController.sourceType = sourceType;
    
    [self presentViewController:imagePickerController animated:YES completion:^{}];
    
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
	
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    /* 此处info 有六个值
	 08
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
	 09
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
	 10
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
	 11
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
	 12
     * UIImagePickerControllerMediaURL;       // an NSURL
	 13
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
	 14
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
	 15
     */
//    [[AccountManager shareAccountManager]updateIcon:image];
	
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
