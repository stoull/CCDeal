//
//  CCCityGroup.h
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCCityGroup : NSObject
/**
 *分组城市名称
 */
@property (nonatomic,copy) NSString *title;
/**
 *分组所包含的城市
 */
@property (nonatomic,strong) NSArray *cities;


- (CCCityGroup *)initWithDataFromDictionary:(NSDictionary *)dic;
+ (instancetype)parseDataFromDictionayr:(NSDictionary *)dic;

@end
