//
//  GuideUserIntroCell.m
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-5.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import "GuideUserIntroCell.h"

@implementation GuideUserIntroCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+(CGSize)oprateHeightWithContent:(NSString *) content
{
    
    CGSize constraint = CGSizeMake(230 , 2000.0);
    CGSize size = CGSizeZero;
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
    {
        
        size = [content sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    }
    else
    {
        
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f]};
        CGSize boundingBox = [content boundingRectWithSize:constraint options: NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
        size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    }
    return size;
}

@end
