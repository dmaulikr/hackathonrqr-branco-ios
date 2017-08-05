//
//  CoracaoView.m
//  FotoMania
//
//  Created by George Villasboas on 10/18/14.
//  Copyright (c) 2014 Logics Software. All rights reserved.
//

#import "CoracaoView.h"


@interface CoracaoView ()
@property (strong, nonatomic) NSTimer *pulsoTimer;
@end

@implementation CoracaoView

- (void)setCor:(UIColor *)cor
{
    _cor = cor;
    [self setNeedsDisplay];
}

- (void)setCorBorda:(UIColor *)corBorda
{
    _corBorda = corBorda;
    [self setNeedsDisplay];
}

- (void)setCorTexto:(UIColor *)corTexto
{
    _corTexto = corTexto;
    [self setNeedsDisplay];
}

- (void)setBpm:(NSUInteger)bpm
{
    _bpm = bpm;
    [self setNeedsDisplay];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
}

- (void)drawRect:(CGRect)rect
{
    CGRect frame = self.bounds;
    
    //// Forma 1 Drawing
    UIBezierPath* forma1Path = UIBezierPath.bezierPath;
    [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50250 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.94500 * CGRectGetHeight(frame))];
    [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.43495 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.87766 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.02000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.32454 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.18405 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.65641 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.02000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50731 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.28537 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.06000 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.02000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.17543 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.13580 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.06000 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50250 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16101 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.36740 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.06000 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.44942 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09848 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.71962 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.06000 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.55557 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09848 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.63760 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.06000 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.98500 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.32454 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.86920 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.06000 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.98500 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.17543 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.57005 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.87766 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.98500 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50731 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.82095 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.65641 * CGRectGetHeight(frame))];
    [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50250 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.94500 * CGRectGetHeight(frame))];
    [forma1Path closePath];
    
    [self.cor setFill];
    [forma1Path fill];
    
    if (self.corBorda) {
        [self.corBorda setStroke];
        forma1Path.lineWidth = 1;
        [forma1Path stroke];
    }
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.21000 + 0.5), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.16000 + 0.5), floor(CGRectGetWidth(frame) * 0.80000 + 0.5) - floor(CGRectGetWidth(frame) * 0.21000 + 0.5), floor(CGRectGetHeight(frame) * 0.66000 + 0.5) - floor(CGRectGetHeight(frame) * 0.16000 + 0.5));
    {
        NSString* textContent = [NSString stringWithFormat:@"%lu", (unsigned long)self.bpm];
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: [self redimensionaFonte]], NSForegroundColorAttributeName: self.corTexto, NSParagraphStyleAttributeName: textStyle};
        
        [textContent drawInRect: CGRectOffset(textRect, 0, (CGRectGetHeight(textRect) - [textContent boundingRectWithSize: textRect.size options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height) / 2) withAttributes: textFontAttributes];
    }
}

- (CGFloat)redimensionaFonte
{
    return 0.35 * CGRectGetWidth(self.bounds);
}

- (void)bater
{
    CALayer *layer = self.layer;
    CABasicAnimation *animacaoPulso = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animacaoPulso.fromValue = @(1.0);
    animacaoPulso.toValue = @(1.1);
    
    animacaoPulso.repeatCount = 1;
    animacaoPulso.autoreverses = YES;
    
    animacaoPulso.duration = 60.0 / self.bpm / 2.0;
    
    animacaoPulso.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [layer addAnimation:animacaoPulso forKey:@"pulso"];
    
    self.pulsoTimer = [NSTimer scheduledTimerWithTimeInterval:(60.0/self.bpm) target:self selector:@selector(bater) userInfo:nil repeats:NO];
}

- (void)parar
{
    [self.pulsoTimer invalidate];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

@end
