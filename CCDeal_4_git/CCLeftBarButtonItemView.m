//
//  CCLeftBarButtonItemView.m
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCLeftBarButtonItemView.h"

@implementation CCLeftBarButtonItemView

- (id)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
//        self.backgroundColor = [UIColor grayColor];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2 -frame.size.width/4 +5, 0, frame.size.width/2, frame.size.height/2)];
        titleLabel.text = @"美食";
        titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        
        UILabel *subTitle = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2 -frame.size.width/4 + 5, frame.size.height/2-2, frame.size.width/2, frame.size.height/2)];
        subTitle.text = @"台湾菜";
        subTitle.font = [UIFont systemFontOfSize:15];
        self.subTitleLabel = subTitle;
        [self addSubview:subTitle];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0,6 ,1, frame.size.height-10)];
        lineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        [self addSubview:lineView];
        
        UIButton *button = [[UIButton alloc] initWithFrame:frame];
        [button setImage:[UIImage imageNamed:@"icon_category_1"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"icon_category_highlighted_1"] forState:UIControlStateHighlighted];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.adjustsImageWhenDisabled = NO;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        self.imageButton = button;
        [self addSubview:button];
        
        self.autoresizingMask = UIViewAutoresizingNone;
        
    }
    return self;
}



////防止navigation bar自动拉伸
//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super init]) {
//        self.autoresizingMask = UIViewAutoresizingNone;
//    }
//    return self;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
