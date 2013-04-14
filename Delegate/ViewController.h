//
//  ViewController.h
//  Delegate
//
//  Created by Jason Ginsberg on /Users/Jason/Desktop/icontrial2.png3/10/13.
//  Copyright (c) 2013 Jason Ginsberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "iCarouselExampleViewController.h"
#import "SBJSON.h"
#import "iCarousel.h"
#import "IIViewDeckController.h"


@interface ViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
   

}
//@property (weak, nonatomic) IBOutlet UIImageView *imageBack;
//@property (strong, nonatomic) IBOutlet UINavigationBar *titleLabel;
//@property (strong, nonatomic) IBOutlet UIImageView *box;

@property (nonatomic) iCarouselExampleViewController *viewController;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property BOOL test;
@property BOOL test2;
@property BOOL hit;


@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITableView *tableView2;

@property (nonatomic) int rowNum;
@property (weak, nonatomic) IBOutlet UILabel *timeLabelHour;
@property (weak, nonatomic) IBOutlet UILabel *timeLabelMin;
@property (weak, nonatomic) IBOutlet UILabel *timeLabelYear;
@property (weak, nonatomic) IBOutlet UILabel *timeLabelDay;
@property (weak, nonatomic) IBOutlet UILabel *timeLabelMonth;

@property (nonatomic, retain) UIPopoverController* popoverController;


@property (strong, nonatomic) IBOutlet UITextView *timeLineText;
@property (strong, nonatomic) IBOutlet NSString *chop;
@property (strong, nonatomic) IBOutlet NSString *link;
@property (strong, nonatomic) IBOutlet NSString *beat;
@property (retain, nonatomic) IBOutlet NSMutableArray *listOfItems;
@property (retain, nonatomic) IBOutlet NSMutableArray *listOfDecks;

@property (weak, nonatomic) IBOutlet UIImageView *bar;


@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (assign, nonatomic) IBOutlet UIImageView *searchBar;
@property (assign, nonatomic) IBOutlet UIImageView *backDrop;
@property (retain, nonatomic) IBOutlet UIImageView *background;
@property (retain, nonatomic) IBOutlet UIImageView *backView2;
@property (weak, nonatomic) IBOutlet UIImageView *back2;


@property (strong, nonatomic) IBOutlet IIViewDeckController *deckController;

- (IBAction)settings:(id)sender;
- (IBAction)history:(id)sender;
- (IBAction)enter:(id)sender;
- (IBAction)backButton:(id)sender;





@end
