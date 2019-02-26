//
//  SMBooksApiManager.m
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import "SMBooksApiManager.h"

static NSString * const API_KEY = @"AIzaSyCQYMrkudFuTxEOEUM_g3ZuRYxygiiKg7U";

static NSString * const baseUrl = @"https://www.googleapis.com/books/v1/volumes";

@implementation SMBooksApiManager

+ (SMBooksApiManager *)sharedService {
    static SMBooksApiManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[SMBooksApiManager alloc] init];
    });
    
    return _sharedClient;
}

    /**
     Makes API call to Volumes end point to search books with supplies search string
    */

- (void)fetchVolumesFor:(NSString *)searchString success:(void(^)(NSArray<SMBook *>*))success failure:(void(^)(NSError *error))failure {
    NSString *searchUrl = [NSString stringWithFormat:@"%@?q=%@&key=%@", baseUrl, searchString, API_KEY];
    NSURL *volumesSearchUrl = [NSURL URLWithString:searchUrl];
    
    [SMHttpSessionClient fetchContentsOfURL:volumesSearchUrl completion:^(NSData *data, NSError *error) {
        
        if (error == nil) {
            NSError *jsonParsingError = nil;
            NSDictionary *volumesJSON = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonParsingError];
            
            if (jsonParsingError == nil) {
                NSMutableArray<SMBook *> *resutlBooks = [NSMutableArray array];
                NSArray *books = volumesJSON[@"items"];
                [books enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
                    NSDictionary *aBook = obj;
                    NSString *title = aBook[@"volumeInfo"][@"title"];
                    NSArray<NSString *> *authors = aBook[@"volumeInfo"][@"authors"];
                    NSString *thumbImageUrl = aBook[@"volumeInfo"][@"imageLinks"][@"smallThumbnail"];
                    SMBook *resultBook = [[SMBook alloc] initWithTitle:title thumbImageUrl:thumbImageUrl authors:authors];
                    [resutlBooks addObject:resultBook];
                }];
                success(resutlBooks);
            }
            else {
                failure(jsonParsingError);
                NSLog(@"JSON parsing Error: %@", jsonParsingError);
            }
        }
    }];
}


@end
