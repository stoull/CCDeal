//
//  CCMenuViewController.m
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCMenuViewController.h"
#import "CCMetaDataTool.h"
#import "CCCategory.h"

@interface CCMenuViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_mainTableView;
    UITableView *_subTableView;
}
@property (nonatomic,strong)NSArray *categories;

@end

@implementation CCMenuViewController
static NSString *mainCellReuseIdentifier = @"mainCell";
static NSString *subCellReuseIdentifier = @"subCell";

- (NSArray *)categories
{
    if (!_categories) {
        _categories = [CCMetaDataTool categories];
        NSLog(@"CCMenuViewController:");
        NSLog(@"getCCCategoriesCount:%ld",_categories.count);
    }
    return _categories;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    装配主菜单选择视图
    [self setMainTableView];
    
//    装配二级菜单选择视图
    [self setSubTableView];
    
}
#pragma mark -装配主菜单选择视图
- (void)setMainTableView
{
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(00, 0, 170, 480)];
    //    _mainTableView.backgroundColor = [UIColor redColor];
    
//    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [self.view addSubview:_mainTableView];
}

#pragma mark -装配二级菜单选择视图
- (void)setSubTableView
{
    _subTableView = [[UITableView alloc]initWithFrame:CGRectMake(160, 00, 170, 480)];
    //    _subTableView.backgroundColor = [UIColor greenColor];
    
    _subTableView.delegate = self;
    _subTableView.dataSource= self;
    [self.view addSubview:_subTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _mainTableView) {
        return self.categories.count;
    }
    else
    {
        long mainTableSelectedIndex = [_mainTableView indexPathForSelectedRow].row;
        CCCategory *category =  _categories[mainTableSelectedIndex];
        NSArray *subCategoriesArray =category.subcategories;
        return subCategoriesArray.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _mainTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellReuseIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mainCellReuseIdentifier];
        }
        cell.backgroundColor = [UIColor clearColor];
        
        CCCategory *category = _categories[indexPath.row];
        cell.textLabel.text = category.name;
        cell.imageView.image = [UIImage imageNamed:category.small_icon];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:subCellReuseIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:subCellReuseIdentifier];
        }
        long mainTableSelectedIndex = [_mainTableView indexPathForSelectedRow].row;
        CCCategory *category =  _categories[mainTableSelectedIndex];
        NSArray *subCategoriesArray =category.subcategories;
        
        cell.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        cell.textLabel.text = subCategoriesArray[indexPath.row];
        UIView *cellSelectView = [[UIView alloc] initWithFrame:cell.frame];
        cellSelectView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
        cell.selectedBackgroundView = cellSelectView;
        return cell;
    }
    
}

#pragma -mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _mainTableView) {
        [_subTableView reloadData];
    }
    else
    {
        NSLog(@"click subTableViewIndexPath:%ld",indexPath.row);
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
