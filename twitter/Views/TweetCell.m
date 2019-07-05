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
#import "APIManager.h"

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

- (IBAction)didTapFavorite:(id)sender {
    if (self.tweet.favorited == NO) {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [self refreshData];
        
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    else {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self refreshData];

        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
    }
}

- (IBAction)didTapRetweet:(id)sender {
    if (self.tweet.retweeted == NO) {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [self refreshData];

        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
    else {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [self refreshData];
        
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
}

- (void)refreshData {
    self.favoriteLabel.text = [NSString stringWithFormat:@"%d",self.tweet.favoriteCount];
    self.retweetLabel.text = [NSString stringWithFormat:@"%d",self.tweet.retweetCount];
    
    if (self.tweet.favorited == NO) {
        self.favoriteLabel.textColor = [UIColor lightGrayColor];
        UIImage *img = [UIImage imageNamed:@"favor-icon"];
        [self.favoriteButton setImage:img forState:UIControlStateNormal];
    }
    else{
        self.favoriteLabel.textColor = [UIColor redColor];
        UIImage *img = [UIImage imageNamed:@"favor-icon-red"];
        [self.favoriteButton setImage:img forState:UIControlStateNormal];
    }
    if (self.tweet.retweeted == NO) {
        self.retweetLabel.textColor = [UIColor lightGrayColor];
        UIImage *img = [UIImage imageNamed:@"retweet-icon"];
        [self.retweetButton setImage:img forState:UIControlStateNormal];
    }
    else{
        self.retweetLabel.textColor = [UIColor greenColor];
        UIImage *img = [UIImage imageNamed:@"retweet-icon-green"];
        [self.retweetButton setImage:img forState:UIControlStateNormal];
    }
}



@end
