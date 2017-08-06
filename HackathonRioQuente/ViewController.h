//
//  ViewController.h
//  HackathonRioQuente
//
//  Created by Jose Lino Neto on 06/08/17.
//  Copyright © 2017 Construtor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@property (weak, nonatomic) IBOutlet UIView *viewPreview;
@end
