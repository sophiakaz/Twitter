//
//  ComposeViewController.h
//  twitter
//
//  Created by sophiakaz on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate
- (void)didTweet:(Tweet *)tweet;
@end


@interface ComposeViewController : UIViewController

- (IBAction)buttonClose:(UIBarButtonItem *)sender;
- (IBAction)buttonTweet:(UIBarButtonItem *)sender;

@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
