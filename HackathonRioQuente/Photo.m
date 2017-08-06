//
//  Photo.m
//  HackathonRioQuente
//
//  Created by Jose Lino Neto on 05/08/17.
//  Copyright © 2017 Construtor. All rights reserved.
//

#import "Photo.h"
@import Firebase;
@import FirebaseCore;
@import FirebaseDatabase;

@interface Photo()

@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation Photo

+(void)getPhotos:(HandlerSuccessPhotos)success falha:(HandlerFailPhotos)fail{
    FIRDatabaseReference *photoRef = [[[FIRDatabase database] reference] child:@"photos"];
    [photoRef observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        success(snapshot.value);
    }];
}

@end
