//
//  TWCHTTPSessionManager.h
//  TWCBoxOffice
//
//  Created by Hanuman Kachwa on 20/10/15.
//  Copyright © 2015 Ranjith. All rights reserved.
//

#import "AFHTTPSessionManager.h"

#define TWC_API_KEY @"s9gd3xzejzsyjzrj5zfu3d6a"

@interface TWCHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
