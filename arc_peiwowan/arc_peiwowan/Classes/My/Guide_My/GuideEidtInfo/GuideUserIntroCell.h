//
//  GuideUserIntroCell.h
//  arc_peiwowan
//
//  Created by Selina Lee on 14-11-5.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideUserIntroCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *intro_text;

+(CGSize)oprateHeightWithContent:(NSString *) content;

@end
