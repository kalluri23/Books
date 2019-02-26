//
//  SMBookSearchViewController.m
//  Books
//
//  Created by Krishna teja Kalluri on 2/1/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import "SMBookSearchViewController.h"

@interface SMBookSearchViewController ()

@end

@implementation SMBookSearchViewController

#pragma mark Lifecycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    [self bindViewModel];
}

#pragma mark View Model Binding
- (void)bindViewModel {
    __weak SMBookSearchViewController *weakSelf = self;
    _viewModel.reloadData = ^(void) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (weakSelf.viewModel.numberofItemsInCollectionView > 0) {
                [weakSelf.noResultsLabel setHidden:YES];
                [weakSelf.booksCollectionView reloadData];
            }else {
                [weakSelf.noResultsLabel setHidden:NO];
            }
            [weakSelf.activityIndicator stopAnimating];
        });
    };
}

#pragma mark Collection View DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_viewModel numberofItemsInCollectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SMBookCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SMBookCell" forIndexPath:indexPath];
    [cell configureCellWith:[_viewModel bookAtIndexPath:indexPath]];
    return cell;
}

#pragma mark Collection View Flow Layout Delegate
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(160, [self heightForBookCellAtIndexPath:indexPath]);
}

#pragma mark Text Field Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([textField.text length] + [string length] > 3) {
        [self.activityIndicator startAnimating];
        [_viewModel fetchBooksWithSearchString:[NSString stringWithFormat:@"%@%@", textField.text, string]];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self.activityIndicator startAnimating];
    [_viewModel fetchBooksWithSearchString:[NSString stringWithFormat:@"%@", textField.text]];
    return YES;
}

#pragma mark Helper Methods
- (CGFloat)heightForBookCellAtIndexPath:(NSIndexPath *)indexPath {
    static SMBookCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    __weak SMBookSearchViewController *weakSelf = self;
    dispatch_once(&onceToken, ^{
        sizingCell = [weakSelf.booksCollectionView dequeueReusableCellWithReuseIdentifier:@"SMBookCell" forIndexPath:indexPath];
    });
    
    [sizingCell configureCellWith:[_viewModel bookAtIndexPath:indexPath]];
    return [self calculateHeightForConfiguredBookCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredBookCell:(SMBookCell *)sizingCell {
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}


@end
