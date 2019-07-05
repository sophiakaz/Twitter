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
    
    self.tweet.favorited = YES;
    self.tweet.favoriteCount += 1;
    
    //refreshdata
    
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
        }
    }];
    
}

- (void)refreshData:(NSIndexPath *)indexPath {
    /*
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    Tweet *tweet = self.tweets[indexPath.row];
    User *user = tweet.user;
    cell.favoriteLabel.text = [NSString stringWithFormat:@"%d",tweet.favoriteCount];
    cell.retweetLabel.text = [NSString stringWithFormat:@"%d",tweet.retweetCount];
    
    //[cell setTweet:tweet];
    return cell;
     */
}



@end
