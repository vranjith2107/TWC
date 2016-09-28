//
//  TWCBoxOfficeMovies.m
//  TWCBoxOffice
//
//  Created by Hanuman Kachwa on 20/10/15.
//  Copyright © 2015 Ranjith. All rights reserved.
//

#import "TWCBoxOfficeMovie.h"
#import "TWCHTTPSessionManager.h"

@implementation TWCBoxOfficeMovie

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.movieID = (NSUInteger)[[attributes valueForKeyPath:@"id"] integerValue];
    self.movieTitle = [attributes valueForKeyPath:@"title"];
    
    self.synopsis = [attributes valueForKeyPath:@"synopsis"];
    self.thumbnailURL = [attributes valueForKeyPath:@"posters.thumbnail"];

    return self;
}

#pragma mark -

+ (NSURLSessionDataTask *)getBoxOfficeMoviesWithBlock:(void (^)(NSArray *moviesList, NSError *error))block {
    NSDictionary *parameters = @{@"apikey": TWC_API_KEY, @"limit": @"10"};
    return [[TWCHTTPSessionManager sharedClient] GET:@"/api/public/v1.0/lists/movies/box_office.json" parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *moviesFromResponse = [JSON valueForKeyPath:@"movies"];
        NSMutableArray *mutableMovies = [NSMutableArray arrayWithCapacity:[moviesFromResponse count]];
        for (NSDictionary *attributes in moviesFromResponse) {
            TWCBoxOfficeMovie *movie = [[TWCBoxOfficeMovie alloc] initWithAttributes:attributes];
            [mutableMovies addObject:movie];
        }
        
        if (block) {
            block([NSArray arrayWithArray:mutableMovies], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end
