//
//  TWCMoviesTableViewCell.h
//  TWCBoxOffice
//
//  Created by Hanuman Kachwa on 20/10/15.
//  Copyright © 2015 Ranjith. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TWCBoxOfficeMovie;

@interface TWCMoviesTableViewCell : UITableViewCell

@property (nonatomic, strong) TWCBoxOfficeMovie *movie;

+ (CGFloat)heightForCellWithMovie:(TWCBoxOfficeMovie *)movie;

@end
