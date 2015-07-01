//
//  CCSort.m
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCSort.h"

@implementation CCSort

- (CCSort *)initWithDataFromDictionary:(NSDictionary *)dic
{
    if (self == [super init]) {
        self.label = dic[@"label"];
        self.value = dic[@"value"];
    }
    return self;
}
+ (instancetype)parseDataFromDictionayr:(NSDictionary *)dic
{
    return [[CCSort alloc] initWithDataFromDictionary:dic];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"label:%@,value:%@",self.label,self.value];
}
@end
