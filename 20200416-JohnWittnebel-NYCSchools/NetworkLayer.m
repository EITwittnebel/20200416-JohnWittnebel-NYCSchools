//
//  NetworkLayer.m
//  20200416-JohnWittnebel-NYCSchools
//
//  Created by Field Employee on 4/20/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkLayer.h"

@interface NetworkLayer ()

@end

@implementation NetworkLayer

- (void) apiCallPartial: (NSString *)theUrl waitInt: (int *)waitVal intoArr: (NSMutableArray *)arr {
 // NSURLSessionConfiguration *config = NSURLSessionConfiguration.defaultSessionConfiguration;
  NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:theUrl]];

  //create the Method "GET"
  [urlRequest setHTTPMethod:@"GET"];

  NSURLSession *session = [NSURLSession sharedSession];

  NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
  {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if(httpResponse.statusCode == 200)
    {
      NSError *parseError = nil;
      NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
      
      for (int i=0; i<responseDictionary.count; ++i) {
        arr[i] = ((NSArray *)responseDictionary)[i];
      }
     // NSLog(@"The response is - %@",arr[1][@"dbn"]);
    }
    else
    {
      NSLog(@"Error");
    }
    *waitVal += 1;
    
  }];
  [dataTask resume];
  
}


@end
