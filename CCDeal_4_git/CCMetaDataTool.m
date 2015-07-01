//
//  CCMetaDataTool.m
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCMetaDataTool.h"
#import "CCCategory.h"
#import "CCCity.h"
#import "CCSort.h"
#import "CCCityGroup.h"
@implementation CCMetaDataTool

- (NSArray *)getArrayFromPlistFile:(NSString *)fileName;
{
    NSString *file = [fileName stringByDeletingPathExtension];
    NSString *FileExtension = [fileName pathExtension];
    NSString *filePathString = [[NSBundle mainBundle] pathForResource:file ofType:FileExtension];
    NSLog(@"MetaDataTool:");
    NSLog(@"getArrayFromPlistFile____fileName:%@  extension:%@",file,FileExtension);
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:filePathString];
    return [dataArray copy];
    
}


//如果在这里不声明该静态变量的话，直接写categories类方法是否可以呢？
//不行，原因：只有创建对象属性，才可以访问，类方法无法访问对象属性
//线程不安全单例，只加载解析一次categories.plist文件
#pragma mark ---分类相关
static NSArray *_categories = nil;
+ (NSArray *)categories
{
    if (_categories == nil) {
        _categories = [[self alloc] getAndParseCategoryFile:@"categories.plist"];
    }
    return _categories;
}

- (NSArray *)getAndParseCategoryFile:(NSString *)fileName
{
    NSArray *dataArray = [self getArrayFromPlistFile:fileName];
    NSMutableArray *sortArray = [NSMutableArray array];
    for (NSDictionary *dic in dataArray)
    {
        CCCategory *cate = [CCCategory parseCategoryDataFormDictionary:dic];
        [sortArray addObject:cate];
    }
    return sortArray;
}

#pragma mark ---城市相关
static NSArray *_cities = nil;
+ (NSArray *)cities
{
    if (_cities == nil) {
        _cities = [[self alloc] getAndParseCitiesFile:@"cities.plist"];
        NSLog(@"citiesCount: %ld", _cities.count);
    }
    return _cities;
}
- (NSArray *)getAndParseCitiesFile:(NSString *)fileName
{
    NSArray *dataArray = [self getArrayFromPlistFile:fileName];
    NSMutableArray *citiesArray = [NSMutableArray array];
    for (NSDictionary *dic in dataArray)
    {
        CCCity *city = [CCCity parseCityDataFromDictionary:dic];
        [citiesArray addObject:city];
    }
    return citiesArray;
}

#pragma mark ---城市分组相关
static NSArray *_cityGroups = nil;
+ (NSArray *)cityGroups
{
    if (!_cityGroups) {
        _cityGroups = [[self alloc] getAndParseCityGroupsFile:@"cityGroups.plist"];
    }
    return _cityGroups;
}
- (NSArray *)getAndParseCityGroupsFile:(NSString *)fileName
{
    NSArray *dataArray = [self getArrayFromPlistFile:fileName];
    NSMutableArray *cityGroupsArray = [NSMutableArray array];
    for (NSDictionary *dic in dataArray)
    {
        CCCityGroup *group = [CCCityGroup parseDataFromDictionayr:dic];
        [cityGroupsArray addObject:group];
    }
    NSLog(@"returnCityGroupsArray:%ld",cityGroupsArray.count);
    return cityGroupsArray;
}

#pragma mark --- 分类相关
static NSArray *_sorts = nil;
+ (NSArray *)sorts
{
    if (_sorts == nil) {
        _sorts = [[self alloc]getAndParseSortsFile:@"sorts.plist"];
    }
    return _sorts;
}
- (NSArray *)getAndParseSortsFile:(NSString *)fileName
{
    NSArray *dataArray = [self getArrayFromPlistFile:fileName];
    NSMutableArray *sortArray= [NSMutableArray array];
    for (NSDictionary *dic in dataArray)
    {
        CCSort *group = [CCSort parseDataFromDictionayr:dic];
        [sortArray addObject:group];
    }
    return sortArray;
}

+ (NSArray *)regionsByCityName:(NSString *)cityName
{
    NSArray *citys = [CCMetaDataTool cities];
    for (CCCity *city in citys)
    {
        if ([city.name isEqualToString:cityName]) {
            return city.regions;
        }
    }
    NSLog(@"这城市我们不提供服务或无此城市");
    return nil;
}

@end
