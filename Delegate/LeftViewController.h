//
//  LeftViewController.h
//  Delegate
//
//  Created by Jason Ginsberg on 4/13/13.
//  Copyright (c) 2013 Jason Ginsberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "IIViewDeckController.h"
#import "ViewController.h"


@interface LeftViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>{
    

    
}
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet NSMutableArray *listOfItems;
@property (retain, nonatomic) IBOutlet UIImageView *background;
@property (nonatomic) int rowNum;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UISegmentedControl *show;
@property (weak, nonatomic) IBOutlet UILabel *backLabel;
@property (strong, nonatomic) IBOutlet NSString *link;

@end
