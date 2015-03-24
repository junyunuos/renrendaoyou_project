//
//  LoginViewController.h
//  arc_peiwowan
//
//  Created by Selina Lee on 14-10-31.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class tabbarViewController;

@interface LoginViewController : UIViewController


@property (strong, nonatomic) tabbarViewController *viewController;
@property (weak, nonatomic) IBOutlet UITextField *tel;
@property (weak, nonatomic) IBOutlet UITextField *pw;

- (IBAction)login:(id)sender;

@end
