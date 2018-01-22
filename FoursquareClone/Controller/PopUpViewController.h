//
//  PopUpViewController.h
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 17.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIKit+AFNetworking.h"
#import "MapTableViewCell.h"
#import "ImageTableViewCell.h"
#import "TipTableViewCell.h"
#import "Venue.h"
@interface PopUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *panelView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tipsList;
@property (nonatomic, strong) Venue *venue;

@end
