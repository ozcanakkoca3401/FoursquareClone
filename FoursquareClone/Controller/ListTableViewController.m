//
//  ListTableViewController.m
//  FoursquareClone
//
//  Created by Özcan AKKOCA on 17.01.2018.
//  Copyright © 2018 Özcan AKKOCA. All rights reserved.
//

#import "ListTableViewController.h"

@interface ListTableViewController ()

@end

@implementation ListTableViewController

@synthesize venuseList, service, tipsList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Places";
    service = [[Services alloc] init];
    tipsList = [[NSMutableArray alloc] init];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return venuseList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
 
    Venue *v1 = nil;
    v1 = [venuseList objectAtIndex:indexPath.row];
    
    cell.city.text = v1.city;
    cell.place.text = v1.place;
    cell.district.text = v1.district;
    cell.country.text = v1.country;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 91;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //4ac997b8f964a52015c020e3
    
    Venue *v1 = nil;
    v1 = [venuseList objectAtIndex:indexPath.row];
    
    [service tipsOnCompletion:v1.id comletion:^(id responseObject) {
        tipsList = responseObject;
        
        [self performSegueWithIdentifier:@"PopupSegue" sender:self];
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PopupSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        PopUpViewController *destViewController = segue.destinationViewController;
        destViewController.tipsList = tipsList;
        destViewController.venue = [venuseList objectAtIndex:indexPath.row];
        
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
