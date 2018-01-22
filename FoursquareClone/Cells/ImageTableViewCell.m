//
//  ImageTableViewCell.m
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 19.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

@synthesize service, setImageView,venueId;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    service = [[Services alloc] init];
    [service imageOnCompletion:venueId comletion:^(id responseObject) {
        [setImageView setImageWithURL:[NSURL URLWithString:responseObject]];
        
        
        //  [self performSegueWithIdentifier:@"PopupSegue" sender:self];
        
    }];
    
    
    // Configure the view for the selected state
}

@end
