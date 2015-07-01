//
//  CCCollectionIndexView.m
//  CCDeal_4
//
//  Created by April on 6/30/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCCollectionIndexView.h"

@interface CCCollectionIndexView ()

@property (readwrite, nonatomic) NSUInteger currentIndex;

@property (strong, nonatomic) NSArray *indexLabels;

@end

@implementation CCCollectionIndexView

- (id) initWithFrame:(CGRect)frame indexTitles:(NSArray *)indexTitles {
    self = [super initWithFrame:frame];
    if (!self) {
        self.indexTitles = indexTitles;
        self.currentIndex = 0;
        // add pan recognizer
        
        
    }
    return self;
}

- (void)setIndexTitles:(NSArray *)indexTitles {
    if (_indexTitles == indexTitles) return;
    _indexTitles = indexTitles;
    [self.indexLabels makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self buildIndexLabels];
}

- (NSString *)currentIndexTitle {
    return self.indexTitles[self.currentIndex];
}

#pragma mark - Subviews

- (void) buildIndexLabels {
    CGFloat cumulativeItemWidth = 0.0; // or height in your (vertical) case
    NSMutableArray *indexLabels = [NSMutableArray array];
    for (NSString *indexTitle in self.indexTitles) {
        // build and add label
        cumulativeItemWidth = cumulativeItemWidth+20;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(200, cumulativeItemWidth, 10, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = indexTitle;
        label.backgroundColor = [UIColor redColor];
        [indexLabels addObject:label];
        UITapGestureRecognizer *tapReconginzer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
        
        // add tap recognizer
        [label addGestureRecognizer:tapReconginzer];
    }
    self.indexLabels = indexLabels;
}

#pragma mark - Gestures

- (void) handleTap:(UITapGestureRecognizer*)recognizer {
    NSString *indexTitle = ((UILabel *)recognizer.view).text;
    self.currentIndex = [self.indexTitles indexOfObject:indexTitle];
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

// similarly for pan recognizer

@end
