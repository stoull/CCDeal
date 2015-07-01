//
//  CCLocateViewController.m
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCLocateViewController.h"
#import "CCMetaDataTool.h"
#import "CCCity.h"
#import "CCCityMenuCollectionViewController.h"

@interface CCLocateViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_cityTableView;
    UITableView *_regionsTableView;
    UIView *_changeCityView;
}

@property (nonatomic,strong)CCCityMenuCollectionViewController *cityMenuController;

@property (nonatomic,strong)  NSArray *cityRegions;

@end

@implementation CCLocateViewController

- (NSArray *)cityRegions
{
    if (!_cityRegions) {
#warning 假数据啊！！！！！
        _cityRegions = [CCMetaDataTool regionsByCityName:@"深圳"];
    }
    return _cityRegions;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 装配头视图
    [self setChangeCityView];
    // 装配主菜单选择视图
    [self setCityTableView];
    // 装配二级菜单选择视图
    [self setregionsTableView];
    
}
#pragma mark -装配头视图
- (void)setChangeCityView
{
    UIView *changeCityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    changeCityView.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:changeCityView.frame];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"   切换城市" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_sort"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_sort_highlighted"] forState:UIControlStateHighlighted];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.contentEdgeInsets = UIEdgeInsetsMake(10, 20, 0, 0);
    [button addTarget:self action:@selector(changeCity:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *identifierImageView = [[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 20, 20)];
    identifierImageView.image = [UIImage imageNamed:@"icon_cell_rightArrow"];
    [button addSubview:identifierImageView];
    
    [changeCityView addSubview:button];
    [self.view addSubview:changeCityView];
    
}

#pragma mark -装配主菜单选择视图
- (void)setCityTableView
{
    _cityTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, 150, 440)];
    //    _mainTableView.backgroundColor = [UIColor redColor];
    
    //    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    _cityTableView.delegate = self;
    _cityTableView.dataSource = self;
    [self.view addSubview:_cityTableView];
}

#pragma mark -装配二级菜单选择视图
- (void)setregionsTableView
{
    _regionsTableView = [[UITableView alloc]initWithFrame:CGRectMake(150, 40, 160, 440)];
    //    _subTableView.backgroundColor = [UIColor greenColor];
    
    _regionsTableView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    _regionsTableView.delegate = self;
    _regionsTableView.dataSource= self;
    [self.view addSubview:_regionsTableView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - clickChangeCity
- (void)changeCity:(UIView *)buttonView
{
    NSLog(@"Click change city now you need change the city data");
    self.cityMenuController = [[CCCityMenuCollectionViewController alloc] initWithNibName:@"CCCityMenuCollectionViewController" bundle:nil];
    UIPopoverController *cityMenuPopoverView = [[UIPopoverController alloc] initWithContentViewController:self.cityMenuController];
    [cityMenuPopoverView presentPopoverFromRect:CGRectMake(buttonView.bounds.size.width-30,buttonView.bounds.size.height-20,10,10) inView:buttonView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}




#pragma mark -UITableViewDataSourc
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _cityTableView) {
        return self.cityRegions.count;
    }
    else
    {
        long cityTableViewSelectedIndex = [_cityTableView indexPathForSelectedRow].row;
        NSDictionary *item = self.cityRegions[cityTableViewSelectedIndex];
        NSArray *subregionsArray= item[@"subregions"];
        return subregionsArray.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _cityTableView) {
        static NSString *cityCellIdentifier = @"cityCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cityCellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cityCellIdentifier];
        }
        NSDictionary *regionDic = self.cityRegions[indexPath.row];
        cell.textLabel.text = regionDic[@"name"];
        cell.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1];
        return cell;
    }
    else
    {
        static NSString *regionCellIdentifier = @"cityCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:regionCellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:regionCellIdentifier];
        }
        long cityTableViewSelectedIndex = [_cityTableView indexPathForSelectedRow].row;
        NSDictionary *item = self.cityRegions[cityTableViewSelectedIndex];
        NSArray *subregionsArray= item[@"subregions"];
        cell.textLabel.text = subregionsArray[indexPath.row];
        cell.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        return cell;
    }
}


#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _cityTableView) {
        [_regionsTableView reloadData];
    }
    else
    {
        NSLog(@"clickRegionsTableViewIndexPath:%ld",indexPath.row);
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
