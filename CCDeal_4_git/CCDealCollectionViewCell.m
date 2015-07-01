//
//  CCDealCollectionViewCell.m
//  CCDeal_4
//
//  Created by April on 6/30/15.
//  Copyright (c) 2015 gunzi. All rights reserved.
//

#import "CCDealCollectionViewCell.h"

#import "CCDealManager.h"
@interface CCDealCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descripateLabel;
@property (weak, nonatomic) IBOutlet UILabel *listPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *purchseCountLabel;


@end


@implementation CCDealCollectionViewCell

//@synthesize imageView;


- (void)setDealInfo:(CCDeal *)dealInfo
{
    self.titleLabel.text = dealInfo.title;
    self.descripateLabel.text = dealInfo.desc;
    self.currentPriceLabel.text = [NSString stringWithFormat:@"¥%@",dealInfo.current_price];
    self.listPriceLabel.text = [NSString stringWithFormat:@"¥%@",dealInfo.current_price];
    
    // 给以前的价格加删除线
    NSUInteger length = [self.listPriceLabel.text length];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:self.listPriceLabel.text];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, length)];
    [self.listPriceLabel setAttributedText:attri];
    
    self.purchseCountLabel.text = [NSString stringWithFormat:@"已售%@",dealInfo.purchase_count];
    
    //    self.backgroundColor = [UIColor cyanColor];
}

@end

