//
//  SMHttpSessionClient.h
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMHttpSessionClient : NSObject

+ (void)fetchContentsOfURL:(NSURL *)url
                completion:(void (^)(NSData *data, NSError *error)) completionHandler;

@end

NS_ASSUME_NONNULL_END
