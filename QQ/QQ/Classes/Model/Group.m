//
//  Group.m
//  QQ
//
//  Created by lyh on 15/10/29.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "Group.h"
#import "Friends.h"

@implementation Group

-(instancetype) initWithDict:(NSDictionary *)dict{
    
    self = [super init];
    
    if (self) {
        [self setValue:dict[@"name"] forKey:@"name"];
        [self setValue:dict[@"online"] forKey:@"online"];
        
        self.friends = [Friends friendsWithArray:dict[@"friends"]];
    }
    return self;
}


+(instancetype) groupWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}

+(NSArray *) group{
    
    NSArray *plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"]];
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    for (NSDictionary *item in plist) {
        
        [tmpArray addObject:[self groupWithDict:item]];
    }
    return tmpArray;
}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@: %p> {name: %@}", self.class, self, self.name];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
