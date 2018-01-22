//
//  ImageTableViewCell.h
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 19.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIKit+AFNetworking.h"
#import "Services.h"
@interface ImageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *setImageView;
@property (nonatomic, strong) Services *service;
@property (nonatomic) NSString *venueId;

@end
