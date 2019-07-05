//
//  TweetCell.h
//  twitter
//
//  Created by sophiakaz on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;

@property (weak, nonatomic) IBOutlet UILabel *retweetLabel;
- (IBAction)didTapFavorite:(id)sender;
- (IBAction)didTapRetweet:(id)sender;
@property (strong, nonatomic) Tweet *tweet; //originally strong
- (void)refreshData;

/*
-(void)setTweet: (Tweet *)tweet;
 */
@end

NS_ASSUME_NONNULL_END
