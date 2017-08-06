//
//  PhotoCellCollectionViewCell.h
//  HackathonRioQuente
//
//  Created by Jose Lino Neto on 05/08/17.
//  Copyright © 2017 Construtor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoracaoView.h"
#import <SDWebImage/UIImageView+WebCache.h>

IB_DESIGNABLE
@interface PhotoCellCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) NSString *shareText;
@property (assign, nonatomic) NSInteger numberLikes;
@property (strong, nonatomic) CoracaoView *coracao;
@property (strong, nonatomic) NSString *photoUrl;
@property (assign, nonatomic) BOOL voted;
@property (assign, nonatomic) BOOL imageAssing;
@property (strong, nonatomic) UIImageView *imageView;

-(void)bater;

@end
