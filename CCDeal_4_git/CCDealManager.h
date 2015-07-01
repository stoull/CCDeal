//
//  CCDealManager.h
//  CCDeals
//
//  Created by April on 6/28/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSSingleton.h"
#import <UIKit/UIKit.h>
@interface CCDealManager : NSObject 
singleton_interface(CCDealManager)

+ (void)sentResquestWithCity:(NSString *)city andRegion:(NSString *)region andCategory:(NSString *)category andKeyWord:(NSString *)keyword andOtherValue:(NSDictionary *)otherValure;

+ (NSArray *)allDeals;
+ (NSArray *)allDealsImage;
@end
