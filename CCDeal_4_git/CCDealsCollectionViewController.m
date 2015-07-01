//
//  CCDealsCollectionViewController.m
//  CCDeal_4
//
//  Created by April on 6/30/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCDealsCollectionViewController.h"
#import "CCLeftBarButtonItemView.h"
#import "UIBarButtonItem+Extension.h"
#import "CCMenuViewController.h"
#import "CCLocateViewController.h"
#import "CCSortViewController.h"
#import "CCDealManager.h"
#import "CCDealCollectionViewCell.h"

@interface CCDealsCollectionViewController ()

@property (nonatomic,strong)CCLeftBarButtonItemView *menuView;
@property (nonatomic,strong)CCLeftBarButtonItemView *sortView;
@property (nonatomic,strong)CCLeftBarButtonItemView *locationView;


// 菜单Popover控制器
@property (nonatomic,strong) UIPopoverController *MenuPopover;
@property (nonatomic,strong) UIPopoverController *sortPopover;
@property (nonatomic,strong) UIPopoverController *locatePopover;

@end

@implementation CCDealsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if(self)
    {
        self.title = @"Best";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_item_selected_selected"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_item_selected"];
        self.collectionView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(UIPopoverController *)catagoryPopover
{
    if (!_MenuPopover) {
        CCMenuViewController *categoryController = [[CCMenuViewController alloc] init];
        _MenuPopover = [[UIPopoverController alloc]initWithContentViewController:categoryController];
    }
    NSLog(@"Menu");
    return _MenuPopover;
}

-(UIPopoverController *)sortPopover
{
    if (!_sortPopover) {
        CCSortViewController *sortViewController = [[CCSortViewController alloc]init];
        _sortPopover = [[UIPopoverController alloc]initWithContentViewController:sortViewController];
    }
    
    return _sortPopover;
}

- (UIPopoverController *)locatePopover
{
    if (!_locatePopover) {
        CCLocateViewController *locateViewControler = [[CCLocateViewController alloc] init];
        _locatePopover = [[UIPopoverController alloc] initWithContentViewController:locateViewControler];
    }
    NSLog(@"locatione");
    return _locatePopover;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    //     self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    [self addLeftBarButton];
    [self addRightBarButton];
    

    //    self.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    //    self.view.contentMode = UIViewContentModeScaleToFill;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -搭建右边的Navigation的导航
// 搭建右边的Navigation的导航
- (void)addRightBarButton
{
    // 思路二
    UIBarButtonItem *locationItem = [UIBarButtonItem itemWithImageName:@"icon_map" highImageName:@"icon_map_highlighted" target:self action:@selector(clickLocationItem)];
    UIBarButtonItem *searchItem = [UIBarButtonItem itemWithImageName:@"icon_search" highImageName:@"icon_search_highlighted" target:self action:@selector(clickSearchItem)];
    self.navigationItem.rightBarButtonItems = @[locationItem,searchItem];
}

#pragma mark -搭建左边的Navigation的导航
// 搭建左边的Navigation的导航
- (void)addLeftBarButton
{
    // 美团图标
    UIButton *logoButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [logoButton setImage:[UIImage imageNamed:@"icon_meituan_logo"] forState:UIControlStateNormal];
    [logoButton addTarget:self action:@selector(clickLogo) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *logoItem = [[UIBarButtonItem alloc]initWithCustomView:logoButton];
    
    // 分类栏
    CCLeftBarButtonItemView *menuView = [[CCLeftBarButtonItemView alloc] initWithFrame:CGRectMake(0, 0, 130, 40)];
    [menuView.imageButton addTarget:self action:@selector(clickMenuView) forControlEvents:UIControlEventTouchUpInside];
    self.menuView = menuView;
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuView];
    
    
    
    // 区域栏
    CCLeftBarButtonItemView *leftLocatView = [[CCLeftBarButtonItemView alloc] initWithFrame:CGRectMake(0, 0, 130, 40)];
    leftLocatView.titleLabel.text = @"北京——全部";
    [leftLocatView.imageButton setImage:[UIImage imageNamed:@"icon_district"] forState:UIControlStateNormal];
    [leftLocatView.imageButton setImage:[UIImage imageNamed:@"icon_district_highlighted"] forState:UIControlStateHighlighted];
    [leftLocatView.imageButton addTarget:self action:@selector(clickLeftLocateView) forControlEvents:UIControlEventTouchUpInside];
    self.locationView = leftLocatView;
    UIBarButtonItem *leftLocateItem = [[UIBarButtonItem alloc] initWithCustomView:leftLocatView];
    
    
    // 排序栏
    CCLeftBarButtonItemView *leftSortView = [[CCLeftBarButtonItemView alloc] initWithFrame:CGRectMake(0, 0, 130, 40)];
    leftSortView.titleLabel.text = @"排序";
    leftSortView.subTitleLabel.text = @"子标题";
    [leftSortView.imageButton setImage:[UIImage imageNamed:@"icon_sort"] forState:UIControlStateNormal];
    [leftSortView.imageButton setImage:[UIImage imageNamed:@"icon_sort_highlighted"] forState:UIControlStateHighlighted];
    [leftSortView.imageButton addTarget:self action:@selector(clickSortView) forControlEvents:UIControlEventTouchUpInside];
    self.sortView = leftSortView;
    UIBarButtonItem *leftSortItem = [[UIBarButtonItem alloc] initWithCustomView:leftSortView];
    
    self.navigationItem.leftBarButtonItems = @[logoItem,menuItem,leftLocateItem,leftSortItem];
    
}

#pragma mark -clickRightNavigationBarItemAction
- (void)clickLocationItem
{
    
}

- (void)clickSearchItem
{
    
}

#pragma mark -clickLeftNavigationBarItemAction
- (void)clickLogo
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickMenuView
{
    [self.catagoryPopover presentPopoverFromRect:self.menuView.bounds inView:self.menuView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)clickLeftLocateView
{
    [self.locatePopover presentPopoverFromRect:self.locationView.bounds inView:self.locationView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)clickSortView
{
    [self.sortPopover presentPopoverFromRect:self.sortView.bounds inView:self.sortView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
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
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [CCDealManager allDealsImage].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CCDealCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dealCell" forIndexPath:indexPath];
    CCDeal *deal = [CCDealManager allDeals][indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    cell.dealInfo = deal;
    cell.imageView.image = [CCDealManager allDealsImage][indexPath.row];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

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

@end