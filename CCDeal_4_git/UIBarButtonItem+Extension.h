//
//  UIBarButtonItem+Extension.h
//  CCDeals
//
//  Created by April on 6/26/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;
@end
