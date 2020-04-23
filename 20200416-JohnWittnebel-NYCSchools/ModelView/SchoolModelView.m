//
//  SchoolModelView.m
//  20200416-JohnWittnebel-NYCSchools
//
//  Created by Field Employee on 4/21/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

#import "SchoolModelView.h"
#import "FullSchoolData.h"
#import "NetworkLayer.h"


@implementation SchoolModelView

- (void) fullApiCall {
  int *waitValue = malloc(sizeof(int));
  *waitValue = 0;
  
  self.partial = [[NSMutableArray alloc] init];
  self.sat = [[NSMutableArray alloc] init];
  self.data = [[NSMutableArray alloc] init];
  
  [self.network apiCallPartial:@"https://data.cityofnewyork.us/resource/s3k6-pzi2.json" waitInt:waitValue intoArr: self.partial];
  [self.network apiCallPartial:@"https://data.cityofnewyork.us/resource/f9bf-2cp4.json" waitInt:waitValue intoArr: self.sat];
  
  while (*waitValue != 2) {}
  
  [self mergeApis];
}

- (void) mergeApis {
  for (int i=0; i<self.sat.count; ++i) {
    NSString *curr = self.sat[i][@"dbn"];
    for (int j=0; j<self.partial.count; ++j) {
      if (curr == self.partial[j][@"dbn"]) {
        NSString *name = self.partial[j][@"school_name"];
        NSString *overview = self.partial[j][@"overview_paragraph"];
        NSString *satTakers = self.sat[i][@"num_of_sat_test_takers"];
        NSString *satReadingScore = self.sat[i][@"sat_critical_reading_avg_score"];
        NSString *satMathScore = self.sat[i][@"sat_math_avg_score"];
        NSString *satWritingScore = self.sat[i][@"sat_writing_avg_score"];
        FullSchoolData *newEntry = [[FullSchoolData alloc] init];
        newEntry.name = name;
        newEntry.overview = overview;
        newEntry.satMathScore = satMathScore;
        newEntry.satReadingScore = satReadingScore;
        newEntry.satWritingScore = satWritingScore;
        newEntry.satTakers = satTakers;
        [self.data addObject:newEntry];
      }
    }
  }
}

@end
