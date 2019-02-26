//
//  SMBookSearchViewController.h
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMBookSearchViewModel.h"
#import "SMBookCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMBookSearchViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UICollectionView *booksCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (weak, nonatomic) IBOutlet SMBookSearchViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UILabel *noResultsLabel;

@end

NS_ASSUME_NONNULL_END
