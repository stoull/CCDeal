//
//  CCDealCollectionViewCell.h
//  CCDeal_4
//
//  Created by April on 6/30/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCDeal.h"
@interface CCDealCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong)CCDeal *dealInfo;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
