//
//  AccountBean.h
//  renrendaoyou
//
//  Created by Selina Lee on 14-9-14.
//  Copyright (c) 2014年 Selina Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface AccountBean : NSObject
{
    
}
@property (strong ,nonatomic) NSString * uid;
@property (strong ,nonatomic) UIImage * icon;
@property (strong ,nonatomic) NSString * icon_url;
@property (strong ,nonatomic) NSString * name;

@property (strong ,nonatomic) NSString * school;
@property (strong ,nonatomic) NSString * hometowm;
@property (strong ,nonatomic) NSString * score;
@property (strong ,nonatomic) NSString * can_service;
@property (strong ,nonatomic) NSString * personal_des;
@property (strong ,nonatomic) NSString * tel;
@property (strong ,nonatomic) NSString * age;
@property (strong ,nonatomic) NSString * region;
@property (strong ,nonatomic) NSString * pass_verify;

@property (assign ,nonatomic) BOOL is_cinerone;
@property (assign ,nonatomic) BOOL is_tourist;

@property (assign ,nonatomic) BOOL is_pass_guide_verify;
@property (assign ,nonatomic) BOOL is_pass_identity_verify;
@property (assign ,nonatomic) BOOL is_pass_student_verify;

@property (strong ,nonatomic) NSString* sex;
@property (strong ,nonatomic) NSString* height;
@property (assign ,nonatomic) int distance;
@property (strong ,nonatomic) NSArray * pictures;
@property (strong ,nonatomic) NSArray * thumb_pictures;


@end
