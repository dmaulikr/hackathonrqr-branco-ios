//
//  PhotoCellCollectionViewCell.h
//  HackathonRioQuente
//
//  Created by Jose Lino Neto on 05/08/17.
//  Copyright © 2017 Construtor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoracaoView.h"

IB_DESIGNABLE
@interface PhotoCellCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) NSString *shareText;
@property (assign, nonatomic) NSInteger numberLikes;
@property (strong, nonatomic) CoracaoView *coracao;

@property (assign, nonatomic) BOOL voted;

@end
