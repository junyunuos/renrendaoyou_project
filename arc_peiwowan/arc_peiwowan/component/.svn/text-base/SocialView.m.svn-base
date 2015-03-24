//
//  SocialView.m
//  arc_peiwowan
//
//  Created by MacBook on 11/13/14.
//  Copyright (c) 2014 MacBook. All rights reserved.
//

#import "SocialView.h"
#import "UIView+UIViewController.h"
#import "CommentViewController.h"
#import "PraiseViewController.h"
#import "UIImageView+WebCache.h"

@implementation SocialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
 
        [self initView];
        
    }
    return self;
}

-(void)initView
{
    CGFloat sx = 10;
    CGFloat sy = 10;
    
    
    //社交网络
    NSArray *imageArray = @[@"bottom_share_btn.png", @"bottom_comment_btn.png", @"bottom_unPraise_btn.png"];
    NSArray *titles = @[@"赞",@"评论",@"私聊"];
    for (NSInteger i=0; i<[imageArray count]; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(sx+i*70, sy, 60, 30)];
        button.tag = 300+i;
        button.backgroundColor = [UIColor grayColor];
        button.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onClickSocialBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
    }
    
    UIButton *reserveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [reserveBtn setFrame:CGRectMake(self.frame.size.width-80-10, sy, 80, 30)];
    reserveBtn.tag = 303;
    reserveBtn.backgroundColor = [UIColor redColor];
    reserveBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [reserveBtn setTitle:@"立即预订" forState:UIControlStateNormal];
    [reserveBtn addTarget:self action:@selector(onClickReserveBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:reserveBtn];
    
    
    //点赞用户列表
    sy = sy + reserveBtn.frame.size.height+15;
    //ssy = ssy + linkLabel.frame.size.height+4;
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(sx, sy, self.frame.size.width-50-10, 30)];
    //scrollview.backgroundColor = UIColorRGB(249,251,252);
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.tag = 304;
    [self addSubview:scrollview];
    
    UIButton *praiseCountButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [praiseCountButton setFrame: CGRectMake(self.frame.size.width-40, sy, 30, 30)];
    praiseCountButton.tag = 305;
    [praiseCountButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    praiseCountButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [praiseCountButton setBackgroundColor:UIColorRGB(249,251,252)];
    praiseCountButton.layer.cornerRadius = 15;
    praiseCountButton.layer.borderWidth = 0.5;
    praiseCountButton.layer.borderColor = [UIColor grayColor].CGColor;
    [praiseCountButton addTarget:self action:@selector(onClickPraiseCountBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:praiseCountButton];
    
    sy = sy + scrollview.frame.size.height;
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(sx-10, sy, self.frame.size.width, 100)];
    bottomView.tag = 306;
    bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView];
    
}

/*
 age = 25;
 comment =     (
 {
 comment = "\U60f3\U53bb";
 icon = "http://114.215.153.50/Uploads/2014-10-17/5440b07831ccf.jpg";
 name = "\U613f\U65f6\U5149\U5f85\U6211\U5982\U521d";
 uid = 5;
 },
 {
 comment = "\U60f3\U53bb";
 icon = "http://114.215.153.50/Uploads/2014-10-17/5440b08ecd19c.jpg";
 name = "\U9006\U5012\U5c18\U5149";
 uid = 6;
 },
 {
 comment = "\U4fee\U554a";
 icon = "http://114.215.153.50/Uploads/2014-10-17/54409c8066ac8.jpg";
 name = "\U96e8\U4e2d\U6d6e\U840d";
 uid = 7;
 }
 );
 des = "\U4e0a\U6d77\Uff0d\U9999\U6e2f\Uff0d\U5df4\U5398\U5c9b \U5165\U4f4f\U5df4\U5398\U5c9b\U7cbe\U54c1\U9152\U5e97\Uff0c\U6027\U4ef7\U6bd4\U8d85\U9ad8\Uff0c\U7ecf\U6d4e\U5b9e\U60e0\U6e38\U5df4\U5398\Uff1b \U6f2b\U6b65\U6c99\U6ee9\Uff0c\U4eab\U53d7\U6e05\U65b0\U6d77\U5cb8\U3002 \U5168\U7a0bDIY\U81ea\U7531\U6d3b\U52a8\Uff0c\U8ba9\U60a8\U4eab\U53d7\U771f\U6b63\U5c5e\U4e8e\U81ea\U5df1\U7684\U5df4\U5398\U4e4b\U65c5\Uff1b";
 icon = "http://114.215.153.50/Uploads/2014-10-17/544098a0e9123.jpg";
 "like_users" =     (
 {
 icon = "http://114.215.153.50/Uploads/2014-10-17/5440b05e5cd65.jpg";
 },
 {
 icon = "http://114.215.153.50/Uploads/2014-10-17/5440b05e5cd65.jpg";
 },
 {
 icon = "http://114.215.153.50/Uploads/2014-10-17/5440b07831ccf.jpg";
 },
 {
 icon = "http://114.215.153.50/Uploads/2014-10-17/5440b08ecd19c.jpg";
 },
 {
 icon = "http://114.215.153.50/Uploads/2014-10-17/54409c8066ac8.jpg";
 },
 {
 icon = "http://114.215.153.50/Uploads/2014-10-17/544098a0e9123.jpg";
 }
 );
 name = "\U7ed9\U6628\U5929\U753b\U4e2a\U53e5\U53f7";
 "num_comment" = 4;
 "num_like" = 6;
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

#pragma mark - 赋值
-(void)setValue:(NSDictionary *)dic withRow:(NSInteger)index complete:(SocialViewBlock)compelete
{
    CGFloat sx = 0;
    CGFloat sy = 0;
    //点赞人数
    UIScrollView *scrollview = (UIScrollView *)[self viewWithTag:304];
    CGFloat height = scrollview.frame.origin.y - 15;
    
    UIButton *praiseCountButton = (UIButton *)[self viewWithTag:305];
    NSInteger praiseCount = [dic[@"num_like"] integerValue];
    if (praiseCount==0)
    {
        scrollview.hidden = YES;
        praiseCountButton.hidden = YES;
    }
    else
    {
        scrollview.hidden = NO;
        praiseCountButton.hidden = NO;
        
        for (UIView *subView in scrollview.subviews)
        {
            [subView removeFromSuperview];
        }
        
        NSArray *array = dic[@"like_users"];
        for (NSInteger i=0; i<[array count]; i++)
        {
            UIImageView *praiseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(sx + i*40, sy, 30, 30)];
            praiseImageView.userInteractionEnabled = YES;
            //praiseImageView.tag = [[array[i] objectForKey:@"id"] integerValue];
            praiseImageView.layer.cornerRadius = 15;
            praiseImageView.layer.masksToBounds = YES;
            [scrollview addSubview:praiseImageView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickPraiseUsersBtn:)];
            tap.numberOfTapsRequired = 1;
            [praiseImageView addGestureRecognizer:tap];
            
            NSString *iconStr = [[array objectAtIndex:i] objectForKey:@"icon"];
            
            [praiseImageView sd_setImageWithURL:[NSURL URLWithString:iconStr] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
            }];
            
            [scrollview setContentSize:CGSizeMake(array.count*40, 30)];
            
            
        }
        
        NSString *praiseCountString = [NSString stringWithFormat:@"%@",dic[@"num_like"]];
        [praiseCountButton setTitle:praiseCountString forState:UIControlStateNormal];
        
        height = height + scrollview.frame.size.height + 15;
    }
    
    //评论列表
    UIView *bottomView = (UIView *)[self viewWithTag:306];
    for (UIView *subView in bottomView.subviews)
    {
        [subView removeFromSuperview];
    }


    //评论列表数据
    NSInteger count = 0;
    NSString *commentCount = dic[@"num_comment"];
    NSMutableArray *comments = dic[@"comment"];
    
    if ([comments count]>3) {
        count = 3;
    }else{
        count = [comments count];
    }
    
    if (count==0)
    {
        NSLog(@"commentCount : %@",commentCount);
        bottomView.hidden = YES;
        
    }
    else
    {
        bottomView.hidden = NO;

        NSLog(@"commentCount : %@",commentCount);
        for (NSInteger i=0; i<count; i++)
        {
            UILabel *commentLabel = [[UILabel alloc] init];
            commentLabel.tag = 307+i;
            commentLabel.textColor = [UIColor grayColor];
            //commentLabel.backgroundColor = [UIColor blueColor];
            commentLabel.font = [UIFont systemFontOfSize:15.0];
            commentLabel.lineBreakMode = NSLineBreakByCharWrapping;
            commentLabel.numberOfLines = 0;
            [bottomView addSubview:commentLabel];
            NSString *commentString = [NSString stringWithFormat:@"%@: %@",[[comments objectAtIndex:i] objectForKey:@"name"],[[comments objectAtIndex:i] objectForKey:@"comment"]];
            
            NSRange forwordRange = [commentString rangeOfString:@":"];
            //NSLog(@"forword Range : %@", NSStringFromRange(forwordRange));
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:commentString];
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, forwordRange.location)];
            commentLabel.attributedText = str;
            CGRect rect = [commentString boundingRectWithSize:CGSizeMake(self.frame.size.width-20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0], NSFontAttributeName, nil] context:nil];
            [commentLabel setFrame:CGRectMake(sx+10, 10+i*rect.size.height, self.frame.size.width-20, rect.size.height)];
            
            sy = sy + commentLabel.frame.size.height;
            
        }
        
        UIButton *commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        commentButton.tag = 310;
        commentButton.backgroundColor = [UIColor whiteColor];
        [commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [commentButton addTarget:self action:@selector(onClickCommentListBtn:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:commentButton];
        NSString *commentCountStr = [NSString stringWithFormat:@"查看全部%@条评论",commentCount];
        [commentButton setTitle:commentCountStr forState:UIControlStateNormal];
        CGRect rect = [commentCountStr boundingRectWithSize:CGSizeMake(1000, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17.0], NSFontAttributeName, nil] context:nil];
        [commentButton setFrame:CGRectMake(sx+10, sy+10, rect.size.width+10, 40)];
        
        sy = sy + commentButton.frame.size.height;

        
    }
    
    [bottomView setFrame:CGRectMake(bottomView.frame.origin.x, height, bottomView.frame.size.width, sy+20)];
    
    height = height + sy + 20;
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height)];
    
    if (compelete)
    {
        compelete(height);
    }
    
}


#pragma mark - 点击社交按钮
-(void)onClickSocialBtn:(UIButton *)button
{
    switch (button.tag) {
        case 300:
        {
            [self onClickPraiseBtn:button];
        }
            break;
        case 301:
        {
            [self onClickCommentBtn:button];
        }
            break;
        case 302:
        {
            [self onClickChatBtn:button];
        }
            break;
            
        default:
            break;
    }
}


#pragma mark - 点击预定按钮
-(void)onClickReserveBtn:(UIButton *)button
{
    
}

#pragma mark - 点击赞用户数按钮
-(void)onClickPraiseCountBtn:(UIButton *)button
{
    PraiseViewController *praiseVC = [[PraiseViewController alloc] init];
    [[self getViewController].navigationController pushViewController:praiseVC animated:YES];
}


#pragma mark - 点击赞按钮
-(void)onClickPraiseBtn:(UIButton *)button
{
    
}

#pragma mark - 点击评论按钮
-(void)onClickCommentBtn:(UIButton *)button
{
    CommentViewController *commentVC = [[CommentViewController alloc] init];
    [[self getViewController].navigationController pushViewController:commentVC animated:YES];
}

#pragma mark - 点击私聊按钮
-(void)onClickChatBtn:(UIButton *)button
{
    
}


#pragma mark - 点击评论列表按钮
-(void)onClickCommentListBtn:(UIButton *)button
{
    
}


#pragma mark - 点击点赞用户头像按钮
-(void)onClickPraiseUsersBtn:(UITapGestureRecognizer *)tap
{
    
}

@end
