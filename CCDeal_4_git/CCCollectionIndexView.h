//
//  CCCollectionIndexView.h
//  CCDeal_4
//
//  Created by April on 6/30/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface CCCollectionIndexView : UIControl

- (id) initWithFrame:(CGRect)frame indexTitles:(NSArray *)indexTitles;

// Model
@property (strong, nonatomic) NSArray *indexTitles; // NSString
@property (readonly, nonatomic) NSUInteger currentIndex;

- (NSString *)currentIndexTitle;

@end
