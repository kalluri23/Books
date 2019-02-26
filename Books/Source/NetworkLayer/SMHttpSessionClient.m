//
//  SMHttpSessionClient.m
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import "SMHttpSessionClient.h"

@implementation SMHttpSessionClient

+ (NSURLSession *)dataSession {
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    return session;
}

  /**
   Creates a NSURLsessionDataTask
  */
+ (void)fetchContentsOfURL:(NSURL *)url
                completion:(void (^)(NSData *data, NSError *error)) completionHandler {
    
    NSURLSessionDataTask *dataTask =
    [[self dataSession] dataTaskWithURL:url
                      completionHandler:
     
     ^(NSData *data, NSURLResponse *response, NSError *error) {
         
         if (completionHandler == nil) return;
         
         if (error) {
             completionHandler(nil, error);
             return;
         }
         completionHandler(data, nil);
     }];
    
    [dataTask resume];
}


@end
