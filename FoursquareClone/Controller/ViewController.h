//
//  ViewController.h
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 17.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "UrlApiKey.h"
#import "Services.h"
#import "Venue.h"
#import "ListTableViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *placeTextField;
@property (weak, nonatomic) IBOutlet UITextField *closeToMeTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;


@property (nonatomic, strong) Services *service;
@property (nonatomic, strong) NSMutableArray *venuseList;


- (IBAction)searchAction:(id)sender;

@end

