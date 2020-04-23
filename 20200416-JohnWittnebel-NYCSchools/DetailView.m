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
    
  bool satScores = false;
  
  for (int i=0; i<self.satData.count; ++i) {
    if (self.satData[i][@"dbn"] == self.dbn) {
      self.mathScore.text = [@"Average math SAT score: " stringByAppendingString: self.satData[i][@"sat_math_avg_score"]];
      self.readingScore.text = [@"Average reading SAT score: " stringByAppendingString: self.satData[i][@"sat_critical_reading_avg_score"]];
      self.writingScore.text = [@"Average writing SAT score: " stringByAppendingString: self.satData[i][@"sat_writing_avg_score"]];
      satScores = true;
      break;
    }
  }
  if (!satScores) {
    self.mathScore.text = @"SAT scores unavailble for this school.";
    self.readingScore.text = @"SAT scores unavailble for this school.";
    self.writingScore.text = @"SAT scores unavailble for this school.";
  }
  
  self.detailName.text = self.name;
  self.descLabel.text = self.desc;
//  if (self.detailName.text == nil) {
//  NSLog(@"bad");
//  }
  [super viewDidLoad];
}

@end
