//
//  CCCategory.m
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCCategory.h"

@implementation CCCategory

+ (instancetype)parseCategoryDataFormDictionary:(NSDictionary *)dic
{
    return [[CCCategory alloc]initWithDictionaryData:dic];
}


- (CCCategory *)initWithDictionaryData:(NSDictionary *)dic
{
    if (self == [super init]) {
        self.name = dic[@"name"];
        self.highlighted_icon = dic[@"highlighted_icon"];
        self.icon = dic[@"icon"];
        self.small_highlighted_icon = dic[@"samll_highlighted_icon"];
        self.small_icon = dic[@"small_icon"];
        self.subcategories = dic[@"subcategories"];
    }
    return self;
}

@end
