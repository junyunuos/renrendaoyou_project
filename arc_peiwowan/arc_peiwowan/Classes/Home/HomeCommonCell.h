//
//  HomeCommonCell.h
//  arc_peiwowan
//
//  Created by MacBook on 11/13/14.
//  Copyright (c) 2014 MacBook. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HomeCommonCellBlock)();

@interface HomeCommonCell : UITableViewCell

-(void)setValue:(NSDictionary *)dic withRow:(NSInteger)index;

@end
