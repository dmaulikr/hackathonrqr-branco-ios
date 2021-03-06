//
//  PhotoCellCollectionViewCell.m
//  HackathonRioQuente
//
//  Created by Jose Lino Neto on 05/08/17.
//  Copyright © 2017 Construtor. All rights reserved.
//

#import "PhotoCellCollectionViewCell.h"
#import "CoracaoView.h"

@implementation PhotoCellCollectionViewCell

-(void)drawRect:(CGRect)rect{
    
    UIView *catView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = catView.bounds;
    [catView addSubview:self.imageView];
    [self addSubview:catView];
    
//    self.coracao = [CoracaoView new];
//    self.coracao.frame = CGRectMake(4, 287, 45, 45);
//    self.coracao.backgroundColor = [UIColor whiteColor];
//    self.coracao.corTexto = [UIColor blackColor];
//    self.coracao.bpm = self.numberLikes;
//    
//    if(self.voted)
//    {
//        self.coracao.cor = [UIColor redColor];
//        self.coracao.corBorda = [UIColor whiteColor];
//    }
//    else
//    {
//        self.coracao.cor = [UIColor whiteColor];
//        self.coracao.corBorda = [UIColor blackColor];
//        self.coracao.corTexto = [UIColor whiteColor];
//    }
//    
//    [self.coracao setNeedsDisplay];
//    
//    [self addSubview:self.coracao];
//    
//    //// Rectangle 3 Drawing
//    UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(60, 287, 50, 50)];
//    [UIColor.grayColor setFill];
//    [rectangle3Path fill];
//    
//    
//    //// Text Drawing
//    CGRect textRect = CGRectMake(4, 337, 293, 202);
//    NSMutableParagraphStyle* textStyle = [NSMutableParagraphStyle new];
//    textStyle.alignment = NSTextAlignmentLeft;
//    
//    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: UIFont.systemFontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: textStyle};
//    
//    [self.shareText drawInRect: textRect withAttributes: textFontAttributes];
    
    //self.backgroundColor = [UIColor whiteColor];
    
    [self setNeedsDisplay];
}

-(void)bater{
    [self.coracao bater];
}

@end
