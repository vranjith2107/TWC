//
//  TWCHTTPSessionManager.m
//  TWCBoxOffice
//
//  Created by Hanuman Kachwa on 20/10/15.
//  Copyright © 2015 Ranjith. All rights reserved.
//

#import "TWCHTTPSessionManager.h"


static NSString * const TWCHTTPSessionManagerAPIBaseURLString = @"http://api.rottentomatoes.com/api/public/v1.0";

@implementation TWCHTTPSessionManager

+ (instancetype)sharedClient {
    static TWCHTTPSessionManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[TWCHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:TWCHTTPSessionManagerAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
