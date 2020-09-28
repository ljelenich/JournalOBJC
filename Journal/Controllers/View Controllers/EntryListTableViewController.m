//
//  EntryListTableViewController.m
//  Journal
//
//  Created by LAURA JELENICH on 9/28/20.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "Entry.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (NSString *)stringForDate:(NSDate *)date
{
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    dateFormat.dateFormat = @"MM-dd-yyyy";
    return [dateFormat stringFromDate:date];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return EntryController.sharedInstance.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    Entry *entry = EntryController.sharedInstance.entries[indexPath.row];
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = [self stringForDate:entry.timestamp];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Entry *entry = EntryController.sharedInstance.entries[indexPath.row];
        [EntryController.sharedInstance removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        EntryDetailViewController *entryVC = (segue.destinationViewController);
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Entry *entry = EntryController.sharedInstance.entries[indexPath.row];
        entryVC.entry = entry;
    }
}


@end
