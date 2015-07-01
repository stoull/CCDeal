//
//  CCMetaDataTool.h
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCMetaDataTool : NSObject
// 主为了读取Plist文件

/**
 返回所有categories
 */
+ (NSArray *)categories;

/**
 *返回所有的城市
 */
+ (NSArray *)cities;

/**
 *返回所有的城市分组（cityGroup)
 */
+ (NSArray *)cityGroups;

/**
 *返回所有的分类种类
 */
+ (NSArray *)sorts;

+ (NSArray *)regionsByCityName:(NSString *)cityName;

@end
