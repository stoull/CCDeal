//
//  UIBarButtonItem+Extension.m
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    button.imageView.contentMode = UIViewContentModeScaleAspectFill;
    button.frame = CGRectMake(0, 0, 60, 40);
    
    // 设置按钮的尺寸为背景图片的尺寸(更加通用, 可选)
    //    CGRect frame = button.frame;
    //    frame.size = button.currentImage.size;
    //    button.frame = frame;
    
    // 监听点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
    
}
@end
