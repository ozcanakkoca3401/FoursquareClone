//
//  Services.h
//  TheMovieApp
//
//  Created by Özcan AKKOCA on 24.03.2017.
//  Copyright © 2017 Özcan AKKOCA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "UrlApiKey.h"
#import "Venue.h"
#import <CoreLocation/CoreLocation.h>

@interface Services : NSObject

- (void)servicesOnCompletion:(NSString *) location nearAtHand: (NSString *) near dateToStringVersion:(NSString *) version comletion: (void (^)(id responseObject))completion;
- (void)tipsOnCompletion:(NSString *) venueId comletion: (void (^)(id responseObject))completion;
- (void)imageOnCompletion:(NSString *) venueId comletion: (void (^)(id responseObject))completion;

 @end
