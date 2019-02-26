//
//  SMBookCell.h
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMBook.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMBookCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *bookTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorsLabel;

- (void) configureCellWith:(SMBook *)book;

@end

NS_ASSUME_NONNULL_END
