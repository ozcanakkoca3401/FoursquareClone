//
//  ListTableViewController.h
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 17.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableViewCell.h"
#import "PopUpViewController.h"
#import "Venue.h"
#import "Services.h"

@interface ListTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *venuseList;
@property (nonatomic, strong) NSMutableArray *tipsList;

@property (nonatomic, strong) Services *service;

@end
