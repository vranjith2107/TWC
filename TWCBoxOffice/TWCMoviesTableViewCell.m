//
//  TWCMoviesTableViewCell.m
//  TWCBoxOffice
//
//  Created by Hanuman Kachwa on 20/10/15.
//  Copyright © 2015 Ranjith. All rights reserved.
//

#import "TWCMoviesTableViewCell.h"
#import "TWCBoxOfficeMovie.h"
#import "UIImageView+AFNetworking.h"

@implementation TWCMoviesTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.textColor = [UIColor darkGrayColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    self.detailTextLabel.numberOfLines = 5;
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return self;
}

- (void)setMovie:(TWCBoxOfficeMovie *)movie { 
    _movie = movie;
    
    self.textLabel.text = _movie.movieTitle;
    self.detailTextLabel.text = _movie.synopsis;
    [self.imageView setImageWithURL:[NSURL URLWithString:_movie.thumbnailURL] placeholderImage:[UIImage imageNamed:@"play_movie_icon"]];
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForCellWithMovie:(TWCBoxOfficeMovie *)movie {
    return (CGFloat)fmaxf(70.0f, (float)[self detailTextHeight:movie.synopsis] + 45.0f);
}

+ (CGFloat)detailTextHeight:(NSString *)text {
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(90.0f, 80.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]} context:nil];
    return rectToFit.size.height;
}

#pragma mark - UIView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
    self.textLabel.frame = CGRectMake(70.0f, 6.0f, self.frame.size.width-70.0f, 20.0f);
    
    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0.0f, 25.0f);
    CGFloat calculatedHeight = [[self class] detailTextHeight:self.movie.synopsis];
    detailTextLabelFrame.size.height = calculatedHeight;
    detailTextLabelFrame.size.width = detailTextLabelFrame.size.width-25.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
}

@end
