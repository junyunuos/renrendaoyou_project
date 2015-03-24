//
//  AccountManager.h
//  AccountManager
//
//  Created by Chen Yaoqiang on 13-12-24.
//  Copyright (c) 2013年 Chen Yaoqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountBean.h"
@protocol AccountDelegate <NSObject>
//协议方法
@optional
-(void)onUpdateIconSucceful:(NSString* )image;
-(void)onUpdateNameSucceful:(NSString* )var;
-(void)onUpdateSchoolSucceful:(NSString* )var;
-(void)onUpdateSexSucceful:(NSString* )var;
-(void)onUpdateHometowmSucceful:(NSString* )var;
-(void)onUpdatePersonal_desSucceful:(NSString* )var;
-(void)onUpdateTelSucceful:(NSString* )var;
-(void)onUpdateHeightSucceful:(NSString* )var;
-(void)onUpdateCan_serviceSucceful:(NSString* )var;
-(void)onUpdateAgeSucceful:(NSString* )var;
-(void)onUpdateRegionSucceful:(NSString* )var;
@end

@interface AccountManager : NSObject
{
    
}

@property(nonatomic,strong)AccountBean* bean;
+ (AccountManager *)shareAccountManager;

-(void)updateIcon:(UIImage*)iamge;
-(void)updateSchool:(NSString*)var;
-(void)updateName:(NSString*)var;
-(void)updateSex:(NSString*)var;
-(void)updateHometowm:(NSString*)var;
-(void)updateCan_service:(NSString*)var;
-(void)updatePersonal_des:(NSString*)var;
-(void)updateTel:(NSString*)var;
-(void)updateHeight:(NSString*)var;
-(void)updateAge:(NSString*)var;
-(void)updateRegion:(NSString*)var;
@end
