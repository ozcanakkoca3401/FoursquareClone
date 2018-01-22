//
//  ViewController.m
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 17.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize placeTextField, closeToMeTextField, searchButton, service, venuseList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    service = [[Services alloc] init];
    venuseList = [[NSMutableArray alloc] init];
    
    searchButton.layer.cornerRadius = 5;
    
    [placeTextField addTarget:self
                  action:@selector(placeTextFieldDidChange:)
        forControlEvents:UIControlEventEditingChanged];
    [closeToMeTextField addTarget:self
                       action:@selector(closeToMeTextFieldDidChange:)
             forControlEvents:UIControlEventEditingChanged];
    
    


 
}


- (void)placeTextFieldDidChange:(id)sender {
    if (placeTextField.text.length == 0) {
        placeTextField.placeholder = @"Exp. Cafe, Bar";
    }
}

- (void)closeToMeTextFieldDidChange:(id)sender {
    if (closeToMeTextField.text.length == 0) {
        closeToMeTextField.placeholder = @"Close to me";
    }
}

-(void)getPlacesFromCurrentLocation {
    
    NSString *location = closeToMeTextField.text;
    NSString *near = placeTextField.text;
    NSString *version = @"20184918";
    
    if (near != nil) {
        if ([near length] < 3) {
            [self showMessage:@"Venue type should be more than 3 characters."
                    withTitle:@"Error"];
            
            return;
        }
        
        
        for (int i = 0; i < near.length; i++) {
            unichar c = [near characterAtIndex:i];
            NSCharacterSet *numericSet = [NSCharacterSet decimalDigitCharacterSet];
            if ([numericSet characterIsMember:c]) {
                [self showMessage:@"The number can not be entered."
                        withTitle:@"Error"];
                return;
            }
        }
    }

    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [service servicesOnCompletion:location nearAtHand:near dateToStringVersion:version comletion:^(NSDictionary* response) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];

        venuseList = (NSMutableArray *)response;
        [self performSegueWithIdentifier:@"ListVC" sender:self];
        
    }];
}




-(void)showMessage:(NSString*)message withTitle:(NSString *)title
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        //do something when click button
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

- (IBAction)searchAction:(id)sender {
    [self getPlacesFromCurrentLocation];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ListVC"]) {
        ListTableViewController *destViewController = segue.destinationViewController;
        destViewController.venuseList = venuseList;
        
    }
}
@end
