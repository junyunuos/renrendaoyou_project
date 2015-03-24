//
//  GuideInfoView.m
//  arc_peiwowan
//
//  Created by MacBook on 11/13/14.
//  Copyright (c) 2014 MacBook. All rights reserved.
//

#import "GuideInfoView.h"
#import "UIImageView+WebCache.h"
#import "UIView+UIViewController.h"

@implementation GuideInfoView
{
    NSArray *pass_Array;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        pass_Array = @[@"tabbar_discover.png", @"tabbar_home.png", @"tabbar_profile.png", @"tabbar_profile_selected.png"];
        
        [self initView];
        
    }
    return self;
}


-(void)initView
{
    CGFloat sx = 0;
    //CGFloat sy = 0;
    
    UIImageView *userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(sx+10, 10, 30, 30)];
    userImageView.tag = 101;
    userImageView.userInteractionEnabled = YES;
    //userImageView.backgroundColor = [UIColor redColor];
    userImageView.layer.cornerRadius = 15;
    [userImageView.layer setMasksToBounds:YES];
    userImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:userImageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickUserIconBtn:)];
    tap.numberOfTapsRequired = 1;
    [userImageView addGestureRecognizer:tap];
    
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(userImageView.frame.origin.x+userImageView.frame.size.width+10, userImageView.frame.origin.y, 80, 20)];
    //userNameLabel.text = @"小巨额";
    userNameLabel.tag = 102;
    //userNameLabel.backgroundColor = [UIColor greenColor];
    userNameLabel.font = [UIFont systemFontOfSize:15.0];
    [self addSubview:userNameLabel];
    
    UIImageView *genderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(userNameLabel.frame.origin.x+userNameLabel.frame.size.width, userNameLabel.frame.origin.y, 20, 20)];
    genderImageView.tag = 103;
    genderImageView.userInteractionEnabled = YES;
    //genderImageView.backgroundColor = [UIColor redColor];
    //genderImageView.layer.cornerRadius = 10;
    [self addSubview:genderImageView];
    
    UILabel *ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(genderImageView.frame.origin.x+genderImageView.frame.size.width, genderImageView.frame.origin.y, 30, 20)];
    ageLabel.tag = 104;
    //ageLabel.text = @"123";
    ageLabel.backgroundColor = [UIColor redColor];
    ageLabel.font = [UIFont systemFontOfSize:15.0];
    ageLabel.textColor = [UIColor whiteColor];
    [self addSubview:ageLabel];
    
    
    for (NSInteger i=0; i<[pass_Array count]; i++)
    {
        UIImageView *passImageView = [[UIImageView alloc] initWithFrame:CGRectMake(userNameLabel.frame.origin.x+i*10, ageLabel.frame.origin.y+ageLabel.frame.size.height, 8, 8)];
        passImageView.tag = 105+i;
        passImageView.image = [UIImage imageNamed:[pass_Array objectAtIndex:i]];
        [self addSubview:passImageView];
        passImageView.hidden = YES;
    }
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(userNameLabel.frame.origin.x, ageLabel.frame.origin.y+ageLabel.frame.size.height, 120, 14)];
    timeLabel.tag = 111;
    //timeLabel.text = @"123";
    //timeLabel.backgroundColor = [UIColor redColor];
    timeLabel.font = [UIFont systemFontOfSize:14.0];
    timeLabel.textColor = [UIColor grayColor];
    [self addSubview:timeLabel];
    timeLabel.hidden = YES;
    
    
    UIButton* attentionBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    attentionBtn.frame = CGRectMake(self.frame.size.width-70, 12, 56, 26);
    attentionBtn.tag=110;
    attentionBtn.backgroundColor=[UIColor blueColor];
    attentionBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
    [attentionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    [attentionBtn setBackgroundImage:[UIImage imageNamed:@"common_un_attention.png"] forState:UIControlStateNormal];
    [attentionBtn addTarget:self action:@selector(onClickAttentionBtn:) forControlEvents:UIControlEventTouchUpInside];
    //attentionBtn.layer.cornerRadius = 4;
    [self addSubview:attentionBtn];
    attentionBtn.hidden = YES;

}

/*
 
 age = 25;
 comment =     (
 );
 des = "\U4e0a\U6d77\Uff0d\U9999\U6e2f\Uff0d\U5df4\U5398\U5c9b \U5165\U4f4f\U5df4\U5398\U5c9b\U7cbe\U54c1\U9152\U5e97\Uff0c\U6027\U4ef7\U6bd4\U8d85\U9ad8\Uff0c\U7ecf\U6d4e\U5b9e\U60e0\U6e38\U5df4\U5398\Uff1b \U6f2b\U6b65\U6c99\U6ee9\Uff0c\U4eab\U53d7\U6e05\U65b0\U6d77\U5cb8\U3002 \U5168\U7a0bDIY\U81ea\U7531\U6d3b\U52a8\Uff0c\U8ba9\U60a8\U4eab\U53d7\U771f\U6b63\U5c5e\U4e8e\U81ea\U5df1\U7684\U5df4\U5398\U4e4b\U65c5\Uff1b";
 icon = "http://114.215.153.50/Uploads/2014-10-17/544098a0e9123.jpg";
 name = "\U7ed9\U6628\U5929\U753b\U4e2a\U53e5\U53f7";
 "num_comment" = 0;
 "num_like" = 0;
 "num_people" = 8;
 "pass_avatar" = 0;
 "pass_guide" = 0;
 "pass_identity" = 0;
 "pass_tel" = 0;
 picture = "http://114.215.153.50/Uploads/2014-10-16/543f67d48df37.jpg_http://114.215.153.50/Uploads/2014-10-16/543f67d4e6deb.jpg_http://114.215.153.50/Uploads/2014-10-16/543f67d526b5b.jpg";
 price = "\U5355\U4eba_888;\U53cc\U4eba_300;\U591a\U4eba_100";
 region = "\U4e0a\U6d77 \U6d66\U4e1c";
 sex = "\U5973";
 time = 1413474443;
 type = 1;
 uid = 8;
 "valid_time" = 1413474443;
 "way_id" = 4;
 
 
 */

//赋值
-(void)setValue:(NSDictionary *)dic withRow:(NSInteger)index
{
    //用户头像
    UIImageView *userImageView = (UIImageView *)[self viewWithTag:101];
    NSString *iconUrl = dic[@"icon"];
    if ([iconUrl isKindOfClass:[NSNull class]]||iconUrl.length==0)
    {
        //
    }
    else
    {
        [userImageView sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
        }];
    }
    
    //用户姓名
    UILabel *userNameLabel = (UILabel *)[self viewWithTag:102];
    NSString *userNameString = dic[@"name"];
    if (userNameString==nil||[userNameString isEqualToString:@""])
    {
        userNameLabel.hidden = YES;
    }
    else
    {
        userNameLabel.hidden = NO;
        userNameLabel.text = userNameString;
        CGRect rect = [userNameLabel.text boundingRectWithSize:CGSizeMake(160, userNameLabel.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0], NSFontAttributeName, nil] context:nil];
        [userNameLabel setFrame:CGRectMake(userNameLabel.frame.origin.x, userNameLabel.frame.origin.y, rect.size.width, userNameLabel.frame.size.height)];
    }
    
    //用户性别
    UIImageView *genderImageView = (UIImageView *)[self viewWithTag:103];
    NSString *sexString = dic[@"sex"];
    if ([sexString isEqualToString:@"男"])
    {
        genderImageView.backgroundColor = [UIColor greenColor];
    }
    else
    {
        genderImageView.backgroundColor = [UIColor redColor];
    }
    [genderImageView setFrame:CGRectMake(userNameLabel.frame.origin.x+userNameLabel.frame.size.width+6, genderImageView.frame.origin.y, genderImageView.frame.size.width, genderImageView.frame.size.height)];
    
    //年龄
    UILabel *ageLabel = (UILabel *)[self viewWithTag:104];
    NSString *ageString = dic[@"age"];
    if (ageString==nil||[ageString isEqualToString:@""])
    {
        ageLabel.hidden = YES;
    }
    else
    {
        ageLabel.hidden = NO;
        ageLabel.text = ageString;
    }
    [ageLabel setFrame:CGRectMake(genderImageView.frame.origin.x+genderImageView.frame.size.width, ageLabel.frame.origin.y, ageLabel.frame.size.width, ageLabel.frame.size.height)];
    
    
    UIButton* attentionBtn = (UIButton *)[self viewWithTag:110];
    NSString *dynamicId = dic[@"dynamic_id"];
    if ([dynamicId isKindOfClass:[NSNull class]]||dynamicId==nil)
    {
        //认证
        for (NSInteger i=0; i<[pass_Array count]; i++)
        {
            UIImageView *photoView = (UIImageView *)[self viewWithTag:105+i];
            NSNumber *photoNum;
            switch (i) {
                case 0:
                {
                    photoNum = dic[@"pass_tel"];
                }
                    break;
                case 1:
                {
                    photoNum = dic[@"pass_identity"];
                }
                    break;
                case 2:
                {
                    photoNum = dic[@"pass_avatar"];
                }
                    break;
                case 3:
                {
                    photoNum = dic[@"pass_guide"];
                }
                    break;
                    
                default:
                    break;
            }
            
            if (photoNum.integerValue == 1)
            {
                photoView.hidden = NO;
            }
            else
            {
                photoView.hidden = YES;
            }
        }
        
        attentionBtn.hidden = NO;

    }
    else
    {
        UILabel *timeLabel = (UILabel *)[self viewWithTag:111];
        timeLabel.hidden = NO;
        NSString *timeString = dic[@"time"];
        timeLabel.text = timeString;
        
        attentionBtn.hidden = YES;
    }


}


#pragma mark - 点击用户头像
-(void)onClickUserIconBtn:(UITapGestureRecognizer *)tapGesture
{
    
}


#pragma mark - 点击关注按钮
-(void)onClickAttentionBtn:(UIButton *)button
{
    
}


@end
