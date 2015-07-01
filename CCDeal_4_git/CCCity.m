//
//  CCCity.m
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCCity.h"

@implementation CCCity


+ (instancetype)parseCityDataFromDictionary:(NSDictionary *)dic
{
    return [[CCCity alloc]initWithDictionary:dic];
}
- (CCCity *)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.pinYin = dic[@"pinYin"];
        self.pinYinHead = dic[@"pinYinHead"];
        self.regions = dic[@"regions"];
    }
    return self;
}

@end
