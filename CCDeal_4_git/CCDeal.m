//
//  CCDeal.m
//  CCDeals
//
//  Created by April on 6/25/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCDeal.h"

@implementation CCDeal

+ (instancetype)parseDealWithDictionary:(NSDictionary *)dealDic
{
    return [[self alloc]initWithDealDic:dealDic];
}

- (CCDeal *)initWithDealDic:(NSDictionary *)dealDic
{
    if (self == [super init]) {
        
        self.deal_id = dealDic[@"deal_id"];
        self.title = dealDic[@"title"];
        self.desc = dealDic[@"description"];
        self.list_price = dealDic[@"list_price"];
        self.current_price = dealDic[@"current_price"];
        self.purchase_count = dealDic[@"purchase_count"];
        self.image_url = dealDic[@"image_url"];
        self.s_image_url = dealDic[@"s_image_url"];
        self.publish_date = dealDic[@"publish_date"];
    }
    return self;
}

+ (void)getAllImages
{
    
}

@end
