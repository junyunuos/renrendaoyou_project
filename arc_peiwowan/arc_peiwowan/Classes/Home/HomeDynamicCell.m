//
//  HomeDynamicCell.m
//  arc_peiwowan
//
//  Created by MacBook on 11/17/14.
//  Copyright (c) 2014 MacBook. All rights reserved.
//

#import "HomeDynamicCell.h"
#import "GuideInfoView.h"
#import "GuideLineView.h"
#import "UIImageView+WebCache.h"
#import "SocialView.h"

@implementation HomeDynamicCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = UIColorRGB(237,237,237);
        [self initView];
        
    }
    return self;
}


-(void)initView
{
    CGFloat sx = 0;
    CGFloat sy = 0;
    
    GuideInfoView *guideView = [[GuideInfoView alloc] initWithFrame:CGRectMake(sx, sy, self.frame.size.width, 50)];
    guideView.tag = 1000;
    guideView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:guideView];
    
    sy = sy + guideView.frame.size.height;
    UIImageView *preview = [[UIImageView alloc] initWithFrame:CGRectMake(sx, sy, self.frame.size.width, self.frame.size.width*3/4)];
    preview.tag = 1001;
    preview.backgroundColor = [UIColor whiteColor];
    //preview.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
    //preview.image = [UIImage imageNamed:@"dengni36.jpg"];
    [preview setContentMode:UIViewContentModeScaleAspectFit];
    [self.contentView addSubview:preview];
    
    sy = sy + preview.frame.size.height;
//    GuideLineView *lineView = [[GuideLineView alloc] initWithFrame:CGRectMake(sx, sy, self.frame.size.width, 70)];
//    lineView.tag = 1003;
//    lineView.backgroundColor = [UIColor whiteColor];
//    [self.contentView addSubview:lineView];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(sx, sy, self.frame.size.width, 0)];
    backView.tag = 1002;
    backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:backView];
    backView.hidden = YES;
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, 0)];
    descriptionLabel.tag = 1003;
    //priceLabel.text = @"¥123";
    descriptionLabel.backgroundColor = [UIColor whiteColor];
    descriptionLabel.font = [UIFont systemFontOfSize:15.0];
    descriptionLabel.lineBreakMode = NSLineBreakByCharWrapping;
    //descriptionLabel.layer.borderWidth = 0;
    descriptionLabel.numberOfLines = 0;
    [backView addSubview:descriptionLabel];
    descriptionLabel.hidden = YES;
    
    sy = sy + backView.frame.size.height;
    SocialView *socialView = [[SocialView alloc] initWithFrame:CGRectMake(sx, sy, self.frame.size.width, 50)];
    socialView.tag = 1004;
    socialView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:socialView];
    
    
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
    //NSLog(@"%@",dic);
    //用户信息
    GuideInfoView *guideView = (GuideInfoView *)[self.contentView viewWithTag:1000];
    [guideView setValue:dic withRow:index];
    
    //风景图片
    UIImageView *preview = (UIImageView *)[self.contentView viewWithTag:1001];
    NSString *pictureUrl = dic[@"picture"];
    NSArray *urls = [pictureUrl componentsSeparatedByString:@"_"];
    if ([urls count]>0)
    {
        [preview sd_setImageWithURL:[NSURL URLWithString:[urls objectAtIndex:0]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            //NSLog(@"image : %@",NSStringFromCGSize(image.size));
            
        }];
    }
    
    UIView *backView = (UIView *)[self.contentView viewWithTag:1002];
    
    //图片上的价格
    UILabel *descriptionLabel = (UILabel *)[backView viewWithTag:1003];
    NSString *descriptionString = dic[@"des"];
    if (descriptionString==nil||[descriptionString isEqualToString:@""])
    {
        descriptionLabel.hidden = YES;
        backView.hidden = YES;
    }
    else
    {
        descriptionLabel.hidden = NO;
        backView.hidden = NO;
        descriptionLabel.text = descriptionString;
        CGRect rect = [descriptionLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width-20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0], NSFontAttributeName, nil] context:nil];
        [descriptionLabel setFrame:CGRectMake(descriptionLabel.frame.origin.x, descriptionLabel.frame.origin.y, descriptionLabel.frame.size.width, rect.size.height+10)];
        [backView setFrame:CGRectMake(backView.frame.origin.x, backView.frame.origin.y, backView.frame.size.width, rect.size.height+10)];
        
    }
    
    //导游路线
//    GuideLineView *lineView = (GuideLineView *)[self.contentView viewWithTag:1003];
//    [lineView setValue:dic withRow:index];
    
    //点赞，分享，私聊
    SocialView *socialView = (SocialView *)[self.contentView viewWithTag:1004];
    [socialView setFrame:CGRectMake(socialView.frame.origin.x, backView.frame.origin.y+backView.frame.size.height, socialView.frame.size.width, socialView.frame.size.height)];
    [socialView setValue:dic withRow:index complete:^(NSInteger height){
        
        
        
    }];
    
    
}


@end
