//
//  User.m
//  twitter
//
//  Created by sophiakaz on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profileURL = dictionary[@"profile_image_url_https"];
        self.bannerURL = dictionary[@"profile_image_url_https"];
        self.numFollowers = dictionary[@"followers_count"];
        self.numFollowing = dictionary[@"friends_count"];
        self.numTweets = dictionary[@"statuses_count"];
        self.bio = dictionary[@"description"];
        // Initialize any other properties
    }
    return self;
}
@end
