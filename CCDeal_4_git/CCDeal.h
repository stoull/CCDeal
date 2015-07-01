//
//  CCDeal.h
//  CCDeals
//
//  Created by April on 6/25/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCDeal : NSObject

// deal_id
@property (nonatomic,copy) NSString *deal_id;
// title
@property (nonatomic,copy) NSString *title;
// description
@property (nonatomic,copy) NSString *desc;
// list_price
@property (nonatomic,strong) NSNumber *list_price;
// current_price
@property (nonatomic,strong) NSNumber *current_price;
// purchase_count
@property (nonatomic,strong) NSNumber *purchase_count;
// image_url
@property (nonatomic,copy)NSString *image_url;
// s_image_url
@property (nonatomic,copy)NSString *s_image_url;
// publish_date
@property (nonatomic,copy )NSString *publish_date;

+ (instancetype)parseDealWithDictionary:(NSDictionary *)dealDic;
- (CCDeal *)initWithDealDic:(NSDictionary *)dealDic;

@property (nonatomic,strong)NSArray *images;

+ (void)getAllImages;

@end
