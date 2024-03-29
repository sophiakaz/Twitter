//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "TweetCell.h"
#import "User.h"
#import "APIManager.h"
#import "UIImageView+AFNetworking.h"
#import "Tweet.h"
#import "ComposeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate, ComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tweets;
- (IBAction)tapLogout:(id)sender;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];
    
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            /*
            for (Tweet *tweet in tweets) {
                NSString *text = tweet.text;
                NSLog(@"%@", text);
            }
             */
            self.tweets = tweets;
            [self.tableView reloadData];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    Tweet *tweet = self.tweets[indexPath.row];
    cell.tweet = tweet;
    User *user = tweet.user;
    cell.authorLabel.text = user.name;
    cell.tweetLabel.text = tweet.text;
    cell.handleLabel.text = [@"@" stringByAppendingString:user.screenName];
    cell.timeLabel.text = tweet.createdAtString;
    cell.favoriteLabel.text = [NSString stringWithFormat:@"%d",tweet.favoriteCount];
    cell.retweetLabel.text = [NSString stringWithFormat:@"%d",tweet.retweetCount];
    
    NSString *profileURLString = user.profileURL;
    NSURL *profileURL = [NSURL URLWithString:profileURLString];
    cell.profileImage.image = nil;
    [cell.profileImage setImageWithURL:profileURL];
    
    if (cell.tweet.favorited == YES) {
        cell.favoriteLabel.textColor = [UIColor redColor];
        UIImage *img = [UIImage imageNamed:@"favor-icon-red"];
        [cell.favoriteButton setImage:img forState:UIControlStateNormal];
    }
    
    if (cell.tweet.retweeted == YES) {
        cell.retweetLabel.textColor = [UIColor greenColor];
        UIImage *img = [UIImage imageNamed:@"retweet-icon-green"];
        [cell.retweetButton setImage:img forState:UIControlStateNormal];
    }
    return cell;
}


// Makes a network request to get updated data
// Updates the tableView with the new data
// Hides the RefreshControl
- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.tweets = tweets;
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            [self.tableView reloadData];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
        
    [refreshControl endRefreshing];

}


- (void)didTweet:(Tweet *)tweet{
    [self.tweets addObject:tweet];
    [self.tableView reloadData];
}

- (IBAction)tapLogout:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [[APIManager shared] logout];
}
@end
