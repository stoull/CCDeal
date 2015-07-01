//
//  CCCategory.h
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCCategory : NSObject
/**
 *分类选择时的图标
 */
@property (nonatomic,copy) NSString *highlighted_icon;
/**
 *分类图标
 */
@property (nonatomic,copy) NSString *icon;

/**
 *分类名称
 */
@property (nonatomic,copy) NSString *name;
/**
 *分类选择时的小图标
 */
@property (nonatomic,copy) NSString *small_highlighted_icon;
/**
 *小图标
 */
@property (nonatomic,copy) NSString *small_icon;
/**
 *第二级分类
 */
@property (nonatomic,strong) NSArray *subcategories;


+ (instancetype)parseCategoryDataFormDictionary:(NSDictionary *)dic;
- (CCCategory *)initWithDictionaryData:(NSDictionary *)dic;
@end
