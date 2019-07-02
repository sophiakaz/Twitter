//
//  TweetCell.m
//  twitter
//
//  Created by sophiakaz on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "Tweet.h"
#import "User.h"
#import "TTTAttributedLabel.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*
-(void)setTweet: (Tweet *)tweet{
    self.authorLabel.text = tweet.user.name;
    self.tweetLabel.text = tweet.text;
}
 */

@end
