//
//  RostersPlayersTableViewController.m
//  Assignment 9
//
//  Created by Anthony Klose on 4/1/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "RostersPlayersTableViewController.h"
#import "BaseballPlayer.h"
#import "RostersPlayerDetailViewController.h"

@interface RostersPlayersTableViewController ()

@end

@implementation RostersPlayersTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer)];
    [[self navigationItem] setRightBarButtonItems:[NSArray arrayWithObjects: addButton, self.editButtonItem, nil]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addPlayer
{
    [self performSegueWithIdentifier:@"addPlayerSegue" sender:self];
}

- (void)doneAddPlayer
{
    [self.players addObject:self.dummyPlayer];
}

- (void)cancelAddPlayer
{
    self.dummyPlayer = nil;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [[self.players objectAtIndex:indexPath.row] fullName];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.players removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table viewdddd
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.players exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showPlayerDetailSegue"]) {
        RostersPlayerDetailViewController* dest = [segue destinationViewController];
        UITableViewCell* cell = (UITableViewCell*)sender;
        dest.player = [self.players objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        dest.navigationItem.title = cell.textLabel.text;
    } else if ([segue.identifier isEqualToString:@"addPlayerSegue"]) {
        RostersAddEditPlayerViewController* dest = [segue destinationViewController];
        self.dummyPlayer = [[BaseballPlayer alloc] initWithFirstName:@"" lastName:@"" position:self.navigationItem.title];
        dest.delegate = self;
        dest.navigationItem.title = @"Add Player";
        dest.player = self.dummyPlayer;
    }
}

@end
