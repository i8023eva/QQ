//
//  Group.h
//  QQ
//
//  Created by lyh on 15/10/29.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *online;
@property (nonatomic, assign) BOOL isOpen;

-(instancetype) initWithDict:(NSDictionary *) dict;
+(instancetype) groupWithDict:(NSDictionary *) dict;

+(NSArray *) group;
@end
