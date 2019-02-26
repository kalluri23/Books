//
//  SMBookSearchViewModel.m
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import "SMBookSearchViewModel.h"


@interface SMBookSearchViewModel ()

@property (nonatomic, copy) NSArray<SMBook *> *books;

@end

@implementation SMBookSearchViewModel

  /**
   Makes API call with supplied search string
  */
- (void)fetchBooksWithSearchString:(NSString *)string {
    
    [[SMBooksApiManager sharedService] fetchVolumesFor:string
                                       success:^(NSArray<SMBook *> *books){
                                           NSLog(@"%ld", [books count]);
                                           [self setBooks:books];
                                           self.reloadData();
    }                                   failure:^(NSError *error) {
                                                   
    }];
    
    
}

- (NSUInteger) numberofItemsInCollectionView {
    if (_books != nil) {
        return [_books count];
    }else {
        return 0;
    }
}

- (SMBook *)bookAtIndexPath:(NSIndexPath *)indexPath {
    return self.books[indexPath.item];
}

@end
