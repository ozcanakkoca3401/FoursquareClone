//
//  MapTableViewCell.m
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 19.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import "MapTableViewCell.h"

@implementation MapTableViewCell

@synthesize mapView, latitude, longitude;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    // Set MapView Location
    CLLocationCoordinate2D coord = {.latitude = latitude, .longitude = longitude};
    MKCoordinateSpan span = {.latitudeDelta = 0.050f, .longitudeDelta = 0.050f};
    MKCoordinateRegion region = {coord, span};
    [mapView setRegion:region];
    
    //set pin
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
    CLLocationCoordinate2D coordforpin = {.latitude = latitude, .longitude = longitude};
    [annotation setCoordinate:coordforpin];
    [annotation setTitle:@"Pin is here"];
    [mapView addAnnotation:annotation];
}

@end
