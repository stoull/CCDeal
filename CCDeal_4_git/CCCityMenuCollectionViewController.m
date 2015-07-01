//
//  CCCityMenuCollectionViewController.m
//  CCDeal_4
//
//  Created by April on 6/30/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCCityMenuCollectionViewController.h"
#import "CCMetaDataTool.h"
#import "CCCity.h"
#import "CCCityGroup.h"
#import "CCCollectionIndexView.h"
@interface CCCityMenuCollectionViewController ()

@property (nonatomic,strong)NSArray *cityGroups;
@property (nonatomic,strong)CCCollectionIndexView *collectionIndexView;

@end


@implementation CCCityMenuCollectionViewController
- (CCCollectionIndexView *)collectionIndexView
{
    if (_collectionIndexView) {
        _collectionIndexView = [[CCCollectionIndexView alloc] initWithFrame:CGRectMake(100, 40, 20, 100) indexTitles:@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i"]];
    }
    return _collectionIndexView;
}
-(NSArray *)cityGroups
{
    if (!_cityGroups) {
        _cityGroups = [CCMetaDataTool cityGroups];
    }
    return _cityGroups;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 和collectionIndexView有关  indexWasTapped 在本页代码最后面
    [self.collectionIndexView addTarget:self action:@selector(indexWasTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.preferredContentSize = CGSizeMake(600,800);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.cityGroups.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    CCCityGroup *cityGroup = self.cityGroups[section];
    NSArray *cities = cityGroup.cities;
    return cities.count;
//    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews)
    {
            [view removeFromSuperview];
    }
    
    UILabel *cityLabel = [[UILabel alloc]initWithFrame:cell.contentView.frame];
    CCCityGroup *cityGroup = self.cityGroups[indexPath.section];
    NSString *city = cityGroup.cities[indexPath.row];
    cityLabel.text = city;
    cityLabel.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:cityLabel];
    cell.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected the number :%ld city",indexPath.row);
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/






- (void)indexWasTapped:(id)sender {
//    [self.collectionView scrollToIndexPath:];
    NSLog(@"I'm moving now!");
}


@end
