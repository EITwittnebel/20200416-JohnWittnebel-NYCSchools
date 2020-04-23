//
//  NetworkLayer.h
//  20200416-JohnWittnebel-NYCSchools
//
//  Created by Field Employee on 4/20/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

#ifndef NetworkLayer_h
#define NetworkLayer_h
#import <UIKit/UIKit.h>
#import "FullSchoolData.h"
#import "SatScoreData.h"
#import "PartialSchoolData.h"

@interface NetworkLayer : NSObject
@property UITableView *tableToReload;
@property PartialSchoolData *partial;
@property SatScoreData *sat;
@property struct FullSchoolData *data;

- (void) apiCallPartial: (NSString *) theUrl waitInt: (int *) waitVal intoArr: (NSMutableArray *) arr;

@end

#endif /* NetworkLayer_h */
