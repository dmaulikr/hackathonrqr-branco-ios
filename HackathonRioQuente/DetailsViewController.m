//
//  DetailsViewController.m
//  HackathonRioQuente
//
//  Created by Jose Lino Neto on 06/08/17.
//  Copyright © 2017 Construtor. All rights reserved.
//

#import "DetailsViewController.h"

const NSString *cloudnaryDetails = @"http://res.cloudinary.com/datveqkzs/image/upload/c_fit,l_camera_ktuaho,w_500/";

const NSString *cloudnaryBuy = @"http://res.cloudinary.com/datveqkzs/image/upload/";

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *detailsPhotoView;
@property (weak, nonatomic) IBOutlet UILabel *pagarLabel;
@property (weak, nonatomic) IBOutlet UILabel *baixarLabel;
@property (assign, nonatomic) BOOL pagou;
@property (weak, nonatomic) IBOutlet UIView *comprarButton;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //The setup code (in viewDidLoad in your view controller)
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.comprarButton addGestureRecognizer:singleFingerTap];
    
    
    [self.baixarLabel setHidden:YES];
    NSString *url = [[cloudnaryDetails stringByAppendingString:self.fotoId] stringByAppendingString:@".jpg"];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^(void) {
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        UIImage* image = [[UIImage alloc] initWithData:imageData];
        if (image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.detailsPhotoView setImage:image];
                [self.detailsPhotoView setNeedsDisplay];
            });
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    //    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    //
    //    //Do stuff here...
    if (!self.pagou){
        [self.pagarLabel setHidden:YES];
        [self.baixarLabel setHidden:NO];
        self.pagou = YES;
        
        NSString *url = [[cloudnaryBuy stringByAppendingString:self.fotoId] stringByAppendingString:@".jpg"];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^(void) {
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
            UIImage* image = [[UIImage alloc] initWithData:imageData];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.detailsPhotoView setImage:image];
                    [self.detailsPhotoView setNeedsDisplay];
                });
            }
        });
    }
//    else{
//        [self.pagarLabel setHidden:NO];
//        [self.baixarLabel setHidden:YES];
//        self.pagou = NO;
//    }
}

@end
