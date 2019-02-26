//
//  SMBooksApiManager.h
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SMHttpSessionClient.h"
#import "SMBook.h"

NS_ASSUME_NONNULL_BEGIN

@interface SMBooksApiManager : NSObject

+ (SMBooksApiManager *)sharedService;
- (void)fetchVolumesFor:(NSString *)searchString success:(void(^)(NSArray<SMBook *>*))success failure:(void(^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
