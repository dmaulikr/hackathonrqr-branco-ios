//
//  CoracaoView.h
//  FotoMania
//
//  Created by George Villasboas on 10/18/14.
//  Copyright (c) 2014 Logics Software. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CoracaoView : UIControl

@property (assign, nonatomic) BOOL voted;

@property (strong, nonatomic) IBInspectable UIColor *cor;
@property (strong, nonatomic) IBInspectable UIColor *corTexto;
@property (strong, nonatomic) IBInspectable UIColor *corBorda;
@property (assign, nonatomic) IBInspectable NSUInteger bpm;

- (void)bater;
- (void)parar;

@end
