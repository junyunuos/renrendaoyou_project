//
//  GuideLineView.m
//  arc_peiwowan
//
//  Created by MacBook on 11/13/14.
//  Copyright (c) 2014 MacBook. All rights reserved.
//

#import "GuideLineView.h"

@implementation GuideLineView

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
    
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(sx, sy, 300, 20)];
    addressLabel.text = @"小巨额";
    addressLabel.tag = 100;
    addressLabel.font = [UIFont systemFontOfSize:15.0];
    [self addSubview:addressLabel];
    
    sy = sy + addressLabel.frame.size.height;
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(sx, sy, 300, 20)];
    lineLabel.text = @"小巨额";
    lineLabel.tag = 101;
    lineLabel.font = [UIFont systemFontOfSize:15.0];
    [self addSubview:lineLabel];
    
    sy = sy + lineLabel.frame.size.height;
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(sx, sy, 300, 20)];
    timeLabel.text = @"小巨额";
    timeLabel.tag = 102;
    timeLabel.font = [UIFont systemFontOfSize:15.0];
    [self addSubview:timeLabel];
    
    sy = sy + timeLabel.frame.size.height;
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(sx, sy, 300, 20)];
    priceLabel.text = @"小巨额";
    priceLabel.tag = 103;
    priceLabel.font = [UIFont systemFontOfSize:15.0];
    [self addSubview:priceLabel];
    priceLabel.hidden = YES;

    
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
    UILabel *addressLabel = (UILabel *)[self viewWithTag:100];
    NSString *addressString = [self setLabelText:dic[@"region"]];
    addressLabel.text = [NSString stringWithFormat:@"地点：%@",addressString];

    UILabel *lineLabel = (UILabel *)[self viewWithTag:101];
    NSString *lineString = [self setLabelText:dic[@"des"]];
    lineLabel.text = [NSString stringWithFormat:@"线路：%@",lineString];
    
    UILabel *timeLabel = (UILabel *)[self viewWithTag:102];
    NSString *timeString = [self setLabelText:dic[@"valid_time"]];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeString longLongValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    timeLabel.text = [NSString stringWithFormat:@"时间：%@",[dateFormatter stringFromDate:date]];
    
    
    //UILabel *priceLabel = (UILabel *)[self viewWithTag:103];
}


-(NSString *)setLabelText:(NSString *)labelText
{
    NSString *labelString;
    if ([labelText isKindOfClass:[NSNull class]]||[labelText length]>0)
    {
        labelString = labelText;
    }
    else
    {
        labelString = @"";
    }
    
    return labelString;
}


@end
