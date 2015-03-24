//
//  AccountManager.m
//  AccountManager
//
//  Created by Chen Yaoqiang on 13-12-24.
//  Copyright (c) 2013年 Chen Yaoqiang. All rights reserved.
//

#import "AccountManager.h"
#import "MKNetworkOperation.h"
#import "AppDelegate.h"
#import "AccountBean.h"

@interface AccountManager ()



@end

@implementation AccountManager
@synthesize bean;
+ (AccountManager *)shareAccountManager;
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
        
    });
    return _sharedObject;
}

- (id)init {
    self = [super init];
    if (self) {
        AccountBean * a = [[AccountBean alloc]init];
        self.bean = a;
        
    }
    return self;
}

-(void)updateSchool:(NSString*)var{
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    [dic setObject:var forKey:@"school"];
    
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updateSchool" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
       /*
        NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
       
        NSDictionary * d= [msgData objectFromJSONString];
        NSString * ret  = [d objectForKey:@"isOk"];
        if ([ret isEqualToString:@"1" ] )
        {
            NSLog(@"update school successful");
            self.bean.school =  var;
            if (self.delegate)
            {
                [self.delegate onUpdateSchoolSucceful:var];
            }
        }
        else
        {
            
        }
        */
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
       
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
}
-(void)updateName:(NSString*)var{
//    self.bean.name =  var;
    
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    [dic setObject:var forKey:@"name"];
    
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updateName" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
         /*
        NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
        
        NSDictionary * d= [msgData objectFromJSONString];
        NSString * ret  = [d objectForKey:@"isOk"];
        if ([ret isEqualToString:@"1" ] )
        {
            NSLog(@"update name successful");
            self.bean.name =  var;
            if (self.delegate) {
                [self.delegate onUpdateNameSucceful:var];
            }
        }
        else
        {
            
        })
          */
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
}
-(void)updateSex:(NSString*)var{

    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    [dic setObject:var forKey:@"sex"];

    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updateSex" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
       /*
        NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
 
        NSDictionary * d= [msgData objectFromJSONString];
        NSString * ret  = [d objectForKey:@"isOk"];
        if ([ret isEqualToString:@"1" ] )
        {
            NSLog(@"update sex successful");
            self.bean.sex =  var;
            if (self.delegate) {
                [self.delegate onUpdateSexSucceful:var];
            }

        }
        else
        {
            
        }
          */
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
       
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
}

-(void)updateHometowm:(NSString*)var{
//    self.bean.hometowm =  var;
    
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    [dic setObject:var forKey:@"hometown"];
    
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updateHometowm" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        /*
        NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
       
        NSDictionary * d= [msgData objectFromJSONString];
        NSString * ret  = [d objectForKey:@"isOk"];
        if ([ret isEqualToString:@"1" ] )
        {
            NSLog(@"update hometown successful");
            self.bean.hometowm =  var;
            if (self.delegate) {
                [self.delegate onUpdateHometowmSucceful:var];
            }

        }
        else
        {
            
        }
          */
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
}
-(void)updateCan_service:(NSString*)var{
//    self.bean.can_service =  var;
    
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    [dic setObject:var forKey:@"can_service"];
    
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updateCan_service" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        /*
        NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
        
        NSDictionary * d= [msgData objectFromJSONString];
        NSString * ret  = [d objectForKey:@"isOk"];
        if ([ret isEqualToString:@"1" ] )
        {
            NSLog(@"update can_service successful");
            self.bean.can_service =  var;
            if (self.delegate) {
                [self.delegate onUpdateCan_serviceSucceful:var];
            }

        }
        else
        {
            
        }
         */
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
       
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
}
-(void)updatePersonal_des:(NSString*)var{
//    self.bean.personal_des =  var;
    
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    [dic setObject:var forKey:@"personal_des"];
    
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updatePersonal_des" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
       /*
        NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
        
        NSDictionary * d= [msgData objectFromJSONString];
        NSString * ret  = [d objectForKey:@"isOk"];
        if ([ret isEqualToString:@"1" ] )
        {
            NSLog(@"update personal_des successful");
            
            self.bean.personal_des =  var;
            if (self.delegate) {
                [self.delegate onUpdatePersonal_desSucceful:var];
            }
        }
        else
        {
            
        }
         */
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
}
-(void)updateTel:(NSString*)var{
//    self.bean.tel =  var;
    
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    [dic setObject:var forKey:@"tel"];
    
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updateTel" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
    /*
        NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
       
        NSDictionary * d= [msgData objectFromJSONString];
        NSString * ret  = [d objectForKey:@"isOk"];
        if ([ret isEqualToString:@"1" ] )
        {
            NSLog(@"update tel successful");
            self.bean.tel =  var;
            if (self.delegate) {
                [self.delegate onUpdateTelSucceful:var];
            }
        }
        else
        {
            
        }
         */
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
       
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
}
-(void)updateHeight:(NSString*)var{
//    self.bean.height = var;
    
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    [dic setObject:var forKey:@"height"];
    
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updateHeight" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
       /*
        NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
        
        NSDictionary * d= [msgData objectFromJSONString];
        NSString * ret  = [d objectForKey:@"isOk"];
        if ([ret isEqualToString:@"1" ] )
        {
            NSLog(@"update height successful");
            self.bean.height =  var;
            if (self.delegate) {
                [self.delegate onUpdateHeightSucceful:var];
            }
        }
        else
        {
            
        }
         */
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
}

-(void)updateAge:(NSString*)var{
    
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    [dic setObject:var forKey:@"age"];
    
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updateAge" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
    /*
        NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
       
        NSDictionary * d= [msgData objectFromJSONString];
        NSString * ret  = [d objectForKey:@"isOk"];
        if ([ret isEqualToString:@"1" ] )
        {
            NSLog(@"update height successful");
            self.bean.age =  var;
            if (self.delegate) {
                [self.delegate onUpdateAgeSucceful:var];
            }
        }
        else
        {
            
        }
         */
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
       
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
}

-(void)updateRegion:(NSString*)var{
   /*
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    [dic setObject:var forKey:@"region"];
    
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updateRegion" params:dic httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        NSString * msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
        
        NSDictionary * d= [msgData objectFromJSONString];
        NSString * ret  = [d objectForKey:@"isOk"];
        if ([ret isEqualToString:@"1" ] )
        {
            NSLog(@"update height successful");
            self.bean.region =  var;
            if (self.delegate) {
                [self.delegate onUpdateRegionSucceful:var];
            }
        }
        else
        {
            
        }
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
    }];
    [APPDelagate.appNetwork enqueueOperation:op];
         */
}
 /*
-(void)updateIcon:(UIImage*)iamge{
    
    UIImage * image = [UIImageUtil fixrotation:iamge];
    
    NSMutableDictionary * dic =[NSMutableDictionary dictionaryWithCapacity:0];
    [dic setObject:APPDelagate.uid forKey:@"uid"];
    
    MKNetworkOperation * op = [APPDelagate.appNetwork operationWithPath:@"index.php/Home/PersonInfo/updloadIcon" params:dic httpMethod:@"POST"];
    
    NSData * imageData = UIImageJPEGRepresentation(image, 0.3f);
    
    [op addData:imageData forKey:@"image" mimeType:@"application/octet-stream" fileName:@"xxx.jpg"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
 
        
        NSLog(@"request url: %@",completedOperation.url);
        
        NSString* msgData = [completedOperation responseStringWithEncoding:NSUTF8StringEncoding];
        
        NSDictionary * d= [msgData objectFromJSONString];
        
        NSString * ret  = [d objectForKey:@"isOk"];
        
        if ([ret isEqualToString:@"1" ] ) {
            
            NSString * pic_url  = [d objectForKey:@"url"];
            _bean.icon_url = pic_url;
            if (self.delegate) {
                [self.delegate onUpdateIconSucceful:_bean.icon_url];
            }
        }
        

        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
       
    }];
    
    [APPDelagate.appNetwork enqueueOperation:op];
    
}
 */
@end
