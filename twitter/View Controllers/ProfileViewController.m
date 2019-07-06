//
//  ProfileViewController.m
//  twitter
//
//  Created by sophiakaz on 7/5/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "User.h"
#import "APIManager.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UIImageView *profilePageImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numTweets;
@property (weak, nonatomic) IBOutlet UILabel *numFollowers;
@property (weak, nonatomic) IBOutlet UILabel *numFollowing;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[APIManager shared] getUser:^(User *user, NSError *error) {
        if(user) {
            NSString *bannerURLString = user.bannerURL;
            NSURL *bannerURL = [NSURL URLWithString:bannerURLString];
            self.backImage.image = nil;
            [self.backImage setImageWithURL:bannerURL];
            
            NSString *profileURLString = user.profileURL;
            NSURL *profileURL = [NSURL URLWithString:profileURLString];
            self.profilePageImage.image = nil;
            [self.profilePageImage setImageWithURL:profileURL];
            
            self.nameLabel.text = user.name;
            self.handleLabel.text = [@"@" stringByAppendingString:user.screenName];
            self.numTweets.text = user.numTweets;
            self.numFollowers.text = user.numFollowers;
            self.numFollowing.text = user.numFollowing;
            self.bioLabel.text = user.bio;
        }
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
