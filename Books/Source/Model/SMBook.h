//
//  SMBook.h
//  Books
//
//  Created by Krishna teja Kalluri on 2/3/19.
//  Copyright © 2019 sirusxm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMBook : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *thumbImageUrl;
@property (nonatomic, copy, readonly) NSArray<NSString*> *authors;

- (instancetype)initWithTitle:(NSString *)title thumbImageUrl:(NSString *)thumbImageUrl authors:(NSArray<NSString*> *)authors;
@end

NS_ASSUME_NONNULL_END
