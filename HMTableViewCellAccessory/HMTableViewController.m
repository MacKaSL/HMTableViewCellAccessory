//
//  HMTableViewController.m
//  HMTableViewCellAccessory
//
//  Created by Himal Madhushan on 1/29/15.
//  Copyright (c) 2015 MacKa. All rights reserved.
//

#import "HMTableViewController.h"

@interface HMTableViewController () {
    NSIndexPath *previousIndexPath, *currentIndexPath;
}

@end

@implementation HMTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"HMTableViewCellAccessory";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
    previousIndexPath = nil;
    currentIndexPath = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

-(void)configureCell:(HMCustomCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.lblCell.text = [NSString stringWithFormat:@"Cell %li",(long)indexPath.row];
    cell.imgViewAccessory.hidden = YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    currentIndexPath = indexPath;
    
    HMCustomCell *cell = nil;
    
    if (!previousIndexPath) {
        previousIndexPath = currentIndexPath;
    }
    
    if (previousIndexPath != currentIndexPath) {
        cell = (HMCustomCell *) [tableView cellForRowAtIndexPath:previousIndexPath];
        cell.imgViewAccessory.transform = CGAffineTransformMakeScale(0, 0);
        
        
        cell = (HMCustomCell *) [tableView cellForRowAtIndexPath:currentIndexPath];
        cell.imgViewAccessory.hidden = NO;
        
        cell.imgViewAccessory.transform = CGAffineTransformMakeScale(0, 0);
        
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            cell.imgViewAccessory.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
        }];
        
        previousIndexPath = currentIndexPath;
    }
    
    if (previousIndexPath == currentIndexPath) {
        cell = (HMCustomCell *) [tableView cellForRowAtIndexPath:previousIndexPath];
        cell.imgViewAccessory.hidden = NO;
        
        cell.imgViewAccessory.transform = CGAffineTransformMakeScale(0, 0);
        
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            cell.imgViewAccessory.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
