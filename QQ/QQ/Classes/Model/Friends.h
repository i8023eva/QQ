//
//  Friends.h
//  QQ
//
//  Created by lyh on 15/10/29.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friends : NSObject

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign, getter=isVip) BOOL vip;

-(instancetype) initWithDict:(NSDictionary *) dict;
+(instancetype) friendsWithDict:(NSDictionary *) dict;

+(NSArray *) friendsWithArray: (NSArray *)plist;

@end
