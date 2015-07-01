//
//  CCDealManager.m
//  CCDeals
//
//  Created by April on 6/28/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCDealManager.h"
#import "DPAPI.h"
#import "CCDeal.h"
#import "DPRequest.h"
@interface CCDealManager() <DPRequestDelegate>

@end

@implementation CCDealManager

static NSArray *_dealsArrays = nil;
static NSMutableArray *_allDealImage = nil;

singleton_implementation(CCDealManager)

+ (void)sentResquestWithCity:(NSString *)city andRegion:(NSString *)region andCategory:(NSString *)category andKeyWord:(NSString *)keyword andOtherValue:(NSDictionary *)otherValure;
{
    DPAPI *api = [[DPAPI alloc] init];
    // 设置参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    // required 参数：城市
    params[@"city"] = city;

    
    // 可选参数
    params[@"region"] = region;
    params[@"category"] = category;
    params[@"keyword"] = keyword;
    NSLog(@"ResquestWith:%@,%@,%@,%@,%@",city,region,category,keyword,otherValure);
    DPRequest *request = [api requestWithURL:@"v1/deal/find_deals" params:params delegate:[[CCDealManager alloc]init]];
}


#pragma mark - DPRequestDelegate
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result
{
    NSLog(@"CCDealManager:");
    NSLog(@"请求发送成功");
    // 解析result，获取订单
    NSLog(@"result:%@",request);
    NSArray *dealsArray = [self parseDealsWithArray:result];
    NSLog(@"serviceReturnedDealsCount:%ld",dealsArray.count);
    _dealsArrays = dealsArray;
    NSLog(@"开始获取图片");
    _allDealImage = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        for (CCDeal *deal in _dealsArrays) {
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:deal.image_url]];
            NSLog(@"image_url:%@",deal.image_url);
            UIImage *image= [UIImage imageWithData:imageData];
            [_allDealImage addObject:image];
        }
        NSLog(@"图片获取完毕共：%ld 张",_allDealImage.count);
    });
}

- (void)request:(DPRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"ViewContorller:");
    NSLog(@"请求发送失败：");
}

#pragma mark - 解析json
- (NSArray *)parseDealsWithArray:(id)result
{
    NSArray *dealsArray = result[@"deals"];
    NSMutableArray *deals= [NSMutableArray array];
    for (NSDictionary *dealDic in dealsArray)
    {
        CCDeal *deal = [CCDeal parseDealWithDictionary:dealDic];
        [deals addObject:deal];
    }
    return deals;
}


+ (NSArray *)allDeals
{
    return _dealsArrays;
}

+ (NSArray *)allDealsImage
{
    return [_allDealImage copy];
}




@end
