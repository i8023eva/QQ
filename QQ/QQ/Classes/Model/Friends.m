//
//  Friends.m
//  QQ
//
//  Created by lyh on 15/10/29.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "Friends.h"

@implementation Friends

-(instancetype) initWithDict:(NSDictionary *)dict{
    
    self = [super init];
    
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype) friendsWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}

+(NSArray *) friendsWithArray: (NSArray *)plist {
    NSMutableArray *tmpArr = [NSMutableArray array];
    
    [plist enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tmpArr addObject:[self friendsWithDict:obj]];
    }];
    return tmpArr;
}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@: %p> {name: %@}", self.class, self, self.name];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
