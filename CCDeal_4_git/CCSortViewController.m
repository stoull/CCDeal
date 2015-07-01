//
//  CCSortViewController.m
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCSortViewController.h"
#import "CCMetaDataTool.h"
#import "CCSort.h"

#define BUTTONWIDTH 100
#define BUTTONHEIGHT 30
#define XINSERT 20
#define YINSERT 20
#define BUTTONDINSTANCE 15

@interface CCSortViewController ()

@end

@implementation CCSortViewController

- (id)init
{
    if (self = [super init]) {
        NSArray *sortArray = [CCMetaDataTool sorts];
        NSLog(@"CCSortViewController:");
        NSLog(@"hadGetSortArrayCount:%ld",sortArray.count);
        CGFloat totalHeightOfView = YINSERT;
        NSLog(@"开始添加SortView中的Button......");
        for (int i=0; i<sortArray.count; i++) {
            CCSort *sort = sortArray[i];
            
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(XINSERT, totalHeightOfView, BUTTONWIDTH, BUTTONHEIGHT)];
            [button setTitle:sort.label forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_normal"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_selected"] forState:UIControlStateHighlighted];
            
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i;
            [self.view addSubview:button];
            totalHeightOfView = totalHeightOfView + BUTTONHEIGHT + BUTTONDINSTANCE;
            
            NSLog(@"button %@ and tage is:%d",sort.label,i);
        }
        //    totalHeightOfView = totalHeightOfView + YINSERT;
        CGFloat width = BUTTONWIDTH + 2*XINSERT;
        self.preferredContentSize = CGSizeMake(width, totalHeightOfView);
        NSLog(@"初始化SortView完成！大小为__width:%lf height:%lf",width,totalHeightOfView);
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)clickButton:(UIButton *)button
{
    NSLog(@"clickButton's tag:%ld",button.tag);
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

@end
