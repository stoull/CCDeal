//
//  CCSort.h
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCSort : NSObject

/**
 *排序种类名称
 */
@property (nonatomic,copy) NSString *label;
/**
 *排序编号
 */
@property (nonatomic,strong) NSNumber *value;

- (CCSort *)initWithDataFromDictionary:(NSDictionary *)dic;
+ (instancetype)parseDataFromDictionayr:(NSDictionary *)dic;
@end
