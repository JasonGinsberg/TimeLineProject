//
//  NewViewController.h
//  Delegate
//
//  Created by Jason Ginsberg on 3/10/13.
//  Copyright (c) 2013 Jason Ginsberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"

@protocol NewViewControllerDelegate <NSObject>
@end


@interface NewViewController : UIViewController<UIWebViewDelegate> {

}

//@property(nonatomic, retain) IBOutlet UIWebView *webView;

@property (nonatomic, retain) id <NewViewControllerDelegate> delegate;
- (IBAction)backButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *timeLineText;
@property (strong, nonatomic) IBOutlet NSString *chop;

@end
