//
//  configure.h
//  arc_peiwowan
//
//  Created by MacBook on 11/12/14.
//  Copyright (c) 2014 MacBook. All rights reserved.
//

#ifndef arc_peiwowan_configure_h
#define arc_peiwowan_configure_h


//----------------自定义导入文件--------------------

#import "MBProgressHUDView.h"
#import "NoNetworkView.h"
#import "EventDispatcher.h"

#define UIColorRGB(a,b,c) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1]

#define  SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define  SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)

#define MBPROGRESSHUD_TEXT_DOWNLOAD  @"加载中..."
#define MBPROGRESSHUD_TEXT_WAIT  @"请稍等..."

#define kHomeTitleString @"HomeTitleString"
//static const NSString  *kHomeTitleString = @"HomeTitleString";

//最新线路接口
#define  home_hotWays            @"index.php/Home/Way/hotWays"

//关注线路接口
#define  home_careWays           @"index.php/Home/Way/careWays"

//动态线路接口
#define  home_myCareDynamic      @"index.php/Home/Dynamic/myCareDynamic"

#endif


