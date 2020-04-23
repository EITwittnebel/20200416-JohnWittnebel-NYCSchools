//
//  DetailView.h
//  20200416-JohnWittnebel-NYCSchools
//
//  Created by Field Employee on 4/22/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FullSchoolData.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *mathScore;
@property (weak, nonatomic) IBOutlet UILabel *detailName;
@property (weak, nonatomic) IBOutlet UILabel *readingScore;
@property (weak, nonatomic) IBOutlet UILabel *writingScore;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
- (IBAction)backButton:(id)sender;
@property FullSchoolData *data;

@end

NS_ASSUME_NONNULL_END
