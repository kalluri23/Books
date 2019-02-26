//
//  SMBookSearchViewModel.h
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMBooksApiManager.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMBookSearchViewModel : NSObject

@property (nonatomic, strong) void (^reloadData)(void);

- (void)fetchBooksWithSearchString:(NSString *)string;

- (SMBook *)bookAtIndexPath:(NSIndexPath *)indexPath;

- (NSUInteger) numberofItemsInCollectionView;

@end

NS_ASSUME_NONNULL_END
