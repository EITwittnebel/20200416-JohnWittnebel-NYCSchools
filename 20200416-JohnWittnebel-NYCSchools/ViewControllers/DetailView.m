//
//  DetailView.m
//  20200416-JohnWittnebel-NYCSchools
//
//  Created by Field Employee on 4/22/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

- (void)viewDidLoad {
  self.mathScore.text = [@"Average math SAT score: " stringByAppendingString: self.data.satMathScore];
  self.readingScore.text = [@"Average reading SAT score: " stringByAppendingString: self.data.satReadingScore];
  self.writingScore.text = [@"Average writing SAT score: " stringByAppendingString: self.data.satWritingScore];
  
  self.detailName.text = self.data.name;
  self.descLabel.text = self.data.overview;
  [super viewDidLoad];
}

- (IBAction)backButton:(id)sender {
  [self dismissViewControllerAnimated:true completion:nil];
}
@end
