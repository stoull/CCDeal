//
//  CCCityGroup.m
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCCityGroup.h"

@implementation CCCityGroup

- (CCCityGroup *)initWithDataFromDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        self.title = dic[@"title"];
        self.cities = dic[@"cities"];
    }
    return self;
}
+ (instancetype)parseDataFromDictionayr:(NSDictionary *)dic
{
    return [[CCCityGroup alloc] initWithDataFromDictionary:dic];
}
@end
