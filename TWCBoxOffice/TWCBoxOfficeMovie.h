//
//  TWCBoxOfficeMovies.h
//  TWCBoxOffice
//
//  Created by Hanuman Kachwa on 20/10/15.
//  Copyright © 2015 Ranjith. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface TWCBoxOfficeMovie : NSObject

@property (nonatomic, assign) NSUInteger movieID;
@property (nonatomic, strong) NSString *movieTitle;
@property (nonatomic, strong) NSString *synopsis;

@property (nonatomic, strong) NSString *thumbnailURL;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (NSURLSessionDataTask *)getBoxOfficeMoviesWithBlock:(void (^)(NSArray *moviesList, NSError *error))block;

@end
