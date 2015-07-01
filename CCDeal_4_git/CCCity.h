//
//  CCCity.h
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCCity : NSObject

// 城市名称
@property (nonatomic,copy) NSString *name;

// 城市名称拼音
@property (nonatomic,copy) NSString *pinYin;

// 城市名称拼音首字母
@property (nonatomic,copy) NSString *pinYinHead;

/** 区域(存放的都是MTRegion模型) */
@property (nonatomic,strong) NSArray *regions;

+ (instancetype)parseCityDataFromDictionary:(NSDictionary *)dic;
- (CCCity *)initWithDictionary:(NSDictionary *)dic;

@end
