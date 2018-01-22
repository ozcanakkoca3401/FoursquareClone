//
//  MapTableViewCell.h
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 19.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MapTableViewCell : UITableViewCell  <MKMapViewDelegate>
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;


@end
