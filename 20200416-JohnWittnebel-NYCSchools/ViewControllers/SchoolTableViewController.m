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
#import "FullSchoolData.h"

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
  return [self.modelView.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"schoolCell"];
  UILabel *cellLabel = [cell viewWithTag:1000];
  //TODO: fix
  cellLabel.text = ((FullSchoolData *)self.modelView.data[indexPath.row]).name;
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  NSIndexPath *path = [self.tableView indexPathForCell:sender];
  DetailView *dest = segue.destinationViewController;
  dest.data = self.modelView.data[path.row];
}


@end
