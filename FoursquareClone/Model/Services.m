//
//  Services.m
//  TheMovieApp
//
//  Created by Özcan AKKOCA on 24.03.2017.
//  Copyright © 2017 Özcan AKKOCA. All rights reserved.
//

#import "Services.h"

@implementation Services


- (void)servicesOnCompletion:(NSString *) location nearAtHand: (NSString *) near dateToStringVersion:(NSString *) version comletion: (void (^)(id responseObject))completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *link = nil;
    
    if (location.length > 0) {
        link = [NSString stringWithFormat:@"%@venues/search?client_id=%@&client_secret=%@&near=%@&query=%@&v=%@",BASE_URL,CLIENT_ID,CLIENT_SECRET, location, near, version];
    } else {
       
        CLLocationManager *locationManager;
        locationManager = [[CLLocationManager alloc] init];
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        [locationManager startUpdatingLocation];
        
        [locationManager requestAlwaysAuthorization]; //Note this one
        
        float Lat = locationManager.location.coordinate.latitude;
        float Long = locationManager.location.coordinate.longitude;
        NSLog(@"Lat : %f  Long : %f",Lat,Long);
        
        link = [NSString stringWithFormat:@"%@venues/search?client_id=%@&client_secret=%@&ll=%f,%f&query=%@&v=%@",BASE_URL,CLIENT_ID,CLIENT_SECRET, Lat, Long, near, version];
    }
    
    [manager GET:link
      parameters:nil
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             NSMutableArray *venuseList = [[NSMutableArray alloc] init];

             for (int i = 0; i < [[[responseObject objectForKey:@"response"] valueForKeyPath:@"venues"] count]; i++) {
                 
                 Venue *venue = [[Venue alloc] init];
                 
                 
                 if ([[[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.name"][i] isKindOfClass:[NSNull class]]) {
                     venue.place = @"";
                 } else {
                     venue.place = [[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.name"][i];
                 }
                 
                 if ([[[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.id"][i] isKindOfClass:[NSNull class]]) {
                     venue.place = @"";
                 } else {
                     venue.id = [[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.id"][i];
                 }
                 
                 if ([[[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.location.address"][i] isKindOfClass:[NSNull class]]) {
                     venue.district = @"";
                 } else {
                     venue.district = [[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.location.address"][i];
                 }
                 
                 if ([[[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.location.lat"][i] isKindOfClass:[NSNull class]]) {
                     venue.lat = @"0";
                 } else {
                     venue.lat = [[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.location.lat"][i];
                 }
                 
                 if ([[[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.location.lng"][i] isKindOfClass:[NSNull class]]) {
                     venue.lng = @"0";
                 } else {
                     venue.lng = [[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.location.lng"][i];
                 }
                 
                 
          
                 if ([[[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.location.city"][i] isKindOfClass:[NSNull class]]) {
                     venue.district = @"";
                 } else {
                     venue.city = [[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.location.city"][i];

                 }
                 
                 if ([[[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.location.country"][i] isKindOfClass:[NSNull class]]) {
                     venue.country = @"";
                 } else {
                     venue.country = [[responseObject objectForKey:@"response"] valueForKeyPath:@"venues.location.country"][i];

                 }
                 
                 [venuseList addObject:venue];
                 
             }
             
             completion(venuseList);
             
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];

}


- (void)tipsOnCompletion:(NSString *) venueId comletion: (void (^)(id responseObject))completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *link = [NSString stringWithFormat:@"%@venues/%@/tips?client_id=%@&client_secret=%@&sort=popular&v=20185718",BASE_URL,venueId, CLIENT_ID,CLIENT_SECRET];
    
    [manager GET:link
      parameters:nil
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             NSMutableArray *tipsList = [[NSMutableArray alloc] init];
             
             for (int i = 0; i < [[[responseObject objectForKey:@"response"] valueForKeyPath:@"tips.items"] count]; i++) {
                 
                 NSString *tip = [[NSString alloc] init];
                 
                 
                 if ([[[[responseObject objectForKey:@"response"] valueForKeyPath:@"tips.items"][i] valueForKey:@"text"] isKindOfClass:[NSNull class]]) {
                     tip = @"";
                 } else {
                     tip = [[[responseObject objectForKey:@"response"] valueForKeyPath:@"tips.items"][i] valueForKey:@"text"];
                 }
                
                 
                 [tipsList addObject:tip];
                 
             }
             
             completion(tipsList);
             
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    
}

- (void)imageOnCompletion:(NSString *) venueId comletion: (void (^)(id responseObject))completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *link = [NSString stringWithFormat:@"%@venues/%@/photos?client_id=%@&client_secret=%@&limit=1&v=20185718",BASE_URL,venueId, CLIENT_ID,CLIENT_SECRET];
    [manager GET:link
      parameters:nil
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {

             NSString *prefix = [[[responseObject objectForKey:@"response"] valueForKeyPath:@"photos.items"][0] valueForKey:@"prefix"];
             NSLog(@"%@", prefix);
             NSString *suffix = [[[responseObject objectForKey:@"response"] valueForKeyPath:@"photos.items"][0] valueForKey:@"suffix"];
             NSLog(@"%@", suffix);
             NSString *width = [[[responseObject objectForKey:@"response"] valueForKeyPath:@"photos.items"][0] valueForKey:@"width"];
             NSLog(@"%@", width);
             NSString *height = [[[responseObject objectForKey:@"response"] valueForKeyPath:@"photos.items"][0] valueForKey:@"height"];
             NSLog(@"%@", height);
             
             NSString *imageUrl = [NSString stringWithFormat:@"%@%@x%@%@",prefix, width, height, suffix];
             
             completion(imageUrl);
             
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    
}

 

@end
