//
//  ViewController.m
//  20200416-JohnWittnebel-NYCSchools
//
//  Created by Field Employee on 4/20/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

#import "SchoolTableViewController.h"
#import "SchoolModelView.h"
#import "DetailView.h"

@interface SchoolTableViewController ()
@property SchoolModelView *modelView;
@end

@implementation SchoolTableViewController

- (void)viewDidLoad {
  self.modelView = [[SchoolModelView alloc] init];
  self.modelView.network = [[NetworkLayer alloc] init];
  [self.modelView fullApiCall];
  [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.modelView.partial count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"schoolCell"];
  UILabel *cellLabel = [cell viewWithTag:1000];
  cellLabel.text = self.modelView.partial[indexPath.row][@"school_name"];
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  NSIndexPath *path = [self.tableView indexPathForCell:sender];
  DetailView *dest = segue.destinationViewController;
  dest.dbn = self.modelView.partial[path.row][@"dbn"];
  dest.desc = self.modelView.partial[path.row][@"overview_paragraph"];
  dest.name = self.modelView.partial[path.row][@"school_name"];
  dest.satData = self.modelView.sat;
}


@end
