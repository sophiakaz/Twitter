//
//  User.h
//  twitter
//
//  Created by sophiakaz on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSString *profileURL;
@property (strong, nonatomic) NSString *bannerURL;
@property (strong, nonatomic) NSString *numFollowers;
@property (strong, nonatomic) NSString *numFollowing;
@property (strong, nonatomic) NSString *numTweets;
@property (strong, nonatomic) NSString *bio;


// Create initializer
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
