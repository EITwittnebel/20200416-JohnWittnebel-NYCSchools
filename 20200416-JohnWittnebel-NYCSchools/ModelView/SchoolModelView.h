//
//  SchoolModelView.h
//  20200416-JohnWittnebel-NYCSchools
//
//  Created by Field Employee on 4/21/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkLayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchoolModelView : NSObject
@property NetworkLayer *network;
@property NSMutableArray *data;
@property NSMutableArray *partial;
@property NSMutableArray *sat;

- (void) fullApiCall;
- (void) mergeApis;

@end

NS_ASSUME_NONNULL_END
