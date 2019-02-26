//
//  SMBook.m
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import "SMBook.h"

@implementation SMBook


- (instancetype)initWithTitle:(NSString *)title thumbImageUrl:(NSString *)thumbImageUrl authors:(NSArray<NSString*> *)authors {
    self = [super init];
    if (!self) return nil;
    
    _title = [title copy];
    _thumbImageUrl = [thumbImageUrl copy];
    _authors = [authors copy];
    
    return self;
}


@end
