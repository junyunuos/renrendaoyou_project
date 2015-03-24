//
//  MainViewController.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-10-31.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "MainViewController.h"
#import "Dock.h"                        //自定义 tabbar
#import "WBNavigationController.h"      //自定义 navigation
#import "HomeViewController.h"          //home 界面
#import "DiscoverViewController.h"      //发现 界面
#import "PublishViewController.h"       //发表 界面
#import "MessageViewController.h"       //消息 界面
#import "Tourist_MyViewController.h"    //（游客）我的 界面
#import "Guide_MyViewController.h"      //（导游）我的 界面
@interface MainViewController ()<DockDelegate>
{
    HomeViewController *homeVC;
    DiscoverViewController *discoverVC;
    PublishViewController *publishViewController;
    MessageViewController *messageViewController;
    Guide_MyViewController *guide_myVC;
}

@end

@implementation MainViewController

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
        homeVC = [[HomeViewController alloc] init];
     discoverVC =  [[DiscoverViewController alloc] init];
     publishViewController= [[PublishViewController alloc] init];
     messageViewController= [[MessageViewController alloc] init];
     guide_myVC= [[Guide_MyViewController alloc] init];
    
    
    // 1.初始化所有的子控制器
    [self addAllChildControllers];
    // 2.初始化DockItems
    [self addDockItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addAllChildControllers
{
    
    WBNavigationController *nav1 = [[WBNavigationController alloc] initWithRootViewController:homeVC];
    [self addChildViewController:nav1];
    

    WBNavigationController *nav2 = [[WBNavigationController alloc] initWithRootViewController:discoverVC];
    nav2.delegate = self;
    [self addChildViewController:nav2];
    

    WBNavigationController *nav3 = [[WBNavigationController alloc] initWithRootViewController:publishViewController];
    [self addChildViewController:nav3];
    

    WBNavigationController *nav4 = [[WBNavigationController alloc] initWithRootViewController:messageViewController];
    [self addChildViewController:nav4];
    
    
    WBNavigationController *nav5 = [[WBNavigationController alloc] initWithRootViewController:guide_myVC];
    nav5.delegate = self;
    
    [self addChildViewController:nav5];

}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == homeVC || viewController == discoverVC  || viewController == publishViewController  || viewController == guide_myVC  || viewController == messageViewController) {
        _dock.hidden = NO;
    }
    else _dock.hidden = YES;
}

#pragma mark 添加Dock
- (void)addDockItems
{
    // 1.设置Dock的背景图片
    _dock.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
    
    // 2.往Dock里面填充内容
    [_dock addItemWithIcon:@"tabbar_home.png" selectedIcon:@"tabbar_home_selected.png" title:@"首页"];
    
    [_dock addItemWithIcon:@"tabbar_discover.png" selectedIcon:@"tabbar_discover_selected.png" title:@"发现"];
    
    [_dock addItemWithIcon:@"tabbar_more.png" selectedIcon:@"tabbar_more_selected.png" title:@"发表"];
    
    [_dock addItemWithIcon:@"tabbar_message_center.png" selectedIcon:@"tabbar_message_center_selected.png" title:@"消息"];
    
    [_dock addItemWithIcon:@"tabbar_profile.png" selectedIcon:@"tabbar_profile_selected.png"  title:@"我的"];


}
@end
