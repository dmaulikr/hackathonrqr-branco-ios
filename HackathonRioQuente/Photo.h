//
//  Photo.h
//  HackathonRioQuente
//
//  Created by Jose Lino Neto on 05/08/17.
//  Copyright © 2017 Construtor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

typedef void (^HandlerSuccessPhotos)(NSString *responseObject);
typedef void (^HandlerFailPhotos)(NSError *error);

+(void)getPhotos:(HandlerSuccessPhotos)success falha:(HandlerFailPhotos)fail;


@end
