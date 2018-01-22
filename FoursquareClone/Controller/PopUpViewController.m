//
//  PopUpViewController.m
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 17.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import "PopUpViewController.h"

@interface PopUpViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation PopUpViewController

@synthesize panelView, tipsList, tableView, venue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self gestureTap];
    [self configureUI];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return tipsList.count;
    } else {
        return 1;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        MapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MapCell" forIndexPath:indexPath];
        cell.latitude = [venue.lat doubleValue];
        cell.longitude = [venue.lng doubleValue];
        return cell;
    } else if (indexPath.section == 1) {
        ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
        cell.venueId = venue.id;
        
        return cell;
    } else if (indexPath.section == 2) {
        TipTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipCell" forIndexPath:indexPath];
        cell.textLabel.text = venue.place;
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
        return cell;
        
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
        
        cell.textLabel.text = tipsList[indexPath.row];
        
        return cell;
    }
    

    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        return 145;
    } else if (indexPath.section == 1) {
        return 200;
    } else if (indexPath.section == 2) {
        return 40;
    } else {
        return UITableViewAutomaticDimension;
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 3) {
        return @"Tips";
    } else {
        return nil;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    if(touch.view.tag!=99)
        [self dismissViewControllerAnimated:NO completion:nil];
    
}



-(void) configureUI {
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    self.view.opaque = false;
    self.panelView.backgroundColor = [UIColor whiteColor];
    
    [self setRoundCorners];
}

-(void) setRoundCorners {
    panelView.layer.cornerRadius = 15;
}

-(void) gestureTap {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    [panelView addGestureRecognizer:singleTap];
    panelView.tag = 99;
}






@end
