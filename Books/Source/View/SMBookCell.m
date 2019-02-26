//
//  SMBookCell.m
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import "SMBookCell.h"

@implementation SMBookCell

- (void) configureCellWith:(SMBook *)book {
    self.bookTitleLabel.text = [NSString stringWithFormat:@"Title: %@", book.title];
    self.authorsLabel.text = [NSString stringWithFormat:@"Authors: %@", [book.authors componentsJoinedByString:@","]];
    [self loadThumbImageFrom:book.thumbImageUrl];
}

- (void) loadThumbImageFrom: (NSString *)url {
    [self.activityIndicator startAnimating];
    __weak SMBookCell *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        if ( data == nil && weakSelf == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.activityIndicator stopAnimating];
            weakSelf.thumbImageView.image = [UIImage imageWithData:data];
        });
    });
    
}

@end
