//
//  DetailViewController.m
//  TWCBoxOffice
//
//  Created by Hanuman Kachwa on 20/10/15.
//  Copyright © 2015 Ranjith. All rights reserved.
//

#import "TWCDetailViewController.h"
#import "TWCBoxOfficeMovie.h"
#import "UIImageView+AFNetworking.h"

@interface TWCDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation TWCDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        TWCBoxOfficeMovie *movie = self.detailItem;
        self.synopsisLabel.text = movie.synopsis;
        self.titleLabel.text = movie.movieTitle;
        [self.imageView setImageWithURL:[NSURL URLWithString:movie.thumbnailURL] placeholderImage:[UIImage imageNamed:@"play_movie_icon"]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
