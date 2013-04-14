//
//  ViewController.m
//  Delegate
//
//  Created by Jason Ginsberg on 3/10/13.
//  Copyright (c) 2013 Jason Ginsberg. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "SBJSON.h"
#import "iCarousel.h"
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "LeftViewController.h"
#import "IIViewDeckController.h"

@interface ViewController () <UIImagePickerControllerDelegate>

@end

@implementation ViewController

@synthesize popoverController = _popoverController2;

//To Do:
//recent doesnt work after entering search
//delete tableview
//ViewController must pass listOfitems array to leftViewController to create table
//When LeftViewController table cell pressed search must occur. To do this links from ViewController must be sent to LeftViewController and saved in table values. LeftViewController tablecell did press must be able to call method in ViewController OpenView after
//Link: VC-->LC. Then LC store link for each table (in an array probably)
//ListofItems VC-->LC
//LC call Openview2 in VC


//wayback icarousel
//hit song of the day
//spiral timevortex arrow effect when enter pressed



//add backgrounds to table views that match with view keep frame, fix no recent background to move with frame as well
//fix delete table cell for decks
//fix adding table cells past 3 threading issue?
//add sidebar scroll timeline like time machine
//Get rid of topic tab(and logic) add custom UISearch Bar (with clear Background) that autocompletes from a list of all wikipedia timelines manually inputted into array (or possibly added from JSON parsed webpage)-->close table view on side if open
//add arrow on table cell to search table cell data
//Fix Parser to get rid of "n" from \n at end, not scan particular phrases/clean up (e.g. "style" "width")
//From UI search, search certain topics from pre-made list that are the auto complete results, just replace spaces in these items ("Timeline of United States History")--->("Timeline_of_United_States_History").Then search the element's JSON to parse by appending it to link. Add more info from wikipedia on topic (possible search and parse simple.wiki version of what is pressed, might be overly complex"
//Note: Make sure user cannot search topics not in array list
//Overall Clean up code delete unecessary reference files, pictures code, variables,etc..
//add make flash card option, press button, pop window "enter name", then cards and more info saved and can be saved"
//add checkmark flash pop up when flash card button pressed


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    _hit = YES;
    
    _rowNum = 0;
    self.viewDeckController.leftSize = 50;
    
    self.listOfItems = [[NSMutableArray alloc] init];
    self.listOfDecks = [[NSMutableArray alloc] init];
    self.tableView2 = [[UITableView alloc ]initWithFrame:CGRectMake(630, 50, 230, 340) style:UITableViewStylePlain];
    
    self.tableView2.showsVerticalScrollIndicator = NO;
    
    self.tableView2.delegate = self;
    
    self.tableView2.dataSource = self;
    
    self. tableView2.separatorColor = [UIColor clearColor];
    
    if(self.listOfDecks.count==0){
        self.backView2 = [[UIImageView alloc]initWithImage: [UIImage imageNamed: @"table2back.png"]];
        [self.tableView2 addSubview: _backView2];
        [self.tableView2 sendSubviewToBack: _backView2];
    }
    
    
    
    self.tableView2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.tableView2];
    
    
    self.tableView2.rowHeight = 60;
    self.tableView2.backgroundColor = [UIColor clearColor];
    //////////////////////////////////////////////////////
    UIView *containerView2 =
    [[UIView alloc]
     initWithFrame:CGRectMake(0, 0, 300, 60)];
    UILabel *headerLabel2 =
    [[UILabel alloc]
     initWithFrame:CGRectMake(0, 20, 300, 40)];
    headerLabel2.text = NSLocalizedString(@"Study Decks", @"");
    headerLabel2.textColor = [UIColor whiteColor];
    headerLabel2.font = [UIFont fontWithName:@"Avenir Light" size:22];
    headerLabel2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"searchTop"]];
    [containerView2 addSubview:headerLabel2];
    self.tableView2.tableHeaderView = containerView2;
    
    [self updateTime];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
    _textField.delegate = self;
    _test = YES;
    _test2 = NO;
    
}
-(void)updateTime{
    NSDate *now = [NSDate date];
    NSString *strDate = [[NSString alloc] initWithFormat:@"%@",now];
    NSArray *arr = [strDate componentsSeparatedByString:@" "];
    NSString *str;
    str = [arr objectAtIndex:0];
    NSArray *arr_my = [str componentsSeparatedByString:@"-"];
    NSInteger day = [[arr_my objectAtIndex:2] intValue];
    NSInteger month = [[arr_my objectAtIndex:1] intValue];
    NSInteger year = [[arr_my objectAtIndex:0] intValue];
    
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"hh"];
    
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat:@"mm"];
    
    
    _timeLabelYear.text = [NSString stringWithFormat:@"%d",year];
    _timeLabelYear.font =    [UIFont fontWithName:@"DBLCDTempBlack" size:26];
    
    _timeLabelMonth.text = [NSString stringWithFormat:@"%d",month];
    _timeLabelMonth.font =    [UIFont fontWithName:@"DBLCDTempBlack" size:25];
    
    _timeLabelDay.text = [NSString stringWithFormat:@"%d",day];
    _timeLabelDay.font =    [UIFont fontWithName:@"DBLCDTempBlack" size:25];
    
    _timeLabelHour.text = [dateFormat stringFromDate:[NSDate date]];
    _timeLabelHour.font =    [UIFont fontWithName:@"DBLCDTempBlack" size:25];
    
    _timeLabelMin.text = [dateFormat2 stringFromDate:[NSDate date]];
    _timeLabelMin.font =    [UIFont fontWithName:@"DBLCDTempBlack" size:25];
    
    [self performSelector:@selector(updateTime) withObject:self afterDelay:1.0];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


- (void)previewBounceLeftView {
    [self.viewDeckController previewBounceView:IIViewDeckLeftSide];
}

- (void)previewBounceRightView {
    [self.viewDeckController previewBounceView:IIViewDeckRightSide];
}

- (void)previewBounceTopView {
    [self.viewDeckController previewBounceView:IIViewDeckTopSide];
}

- (void)previewBounceBottomView {
    [self.viewDeckController previewBounceView:IIViewDeckBottomSide];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    
    return YES;
    
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView beginUpdates];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Do whatever data deletion you need to do...
        [self.listOfDecks removeObjectAtIndex:indexPath.row];
        if(self.listOfDecks.count==0){
            self.tableView2.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table2back.png"]];
        }
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationRight ];
    }
    [tableView endUpdates];
    
    
}

- (IBAction)history:(id)sender {
    
    if (_hit){
        _hit = NO;
        [self.viewDeckController openLeftView];
        self.deckController.enabled = NO;

        NSLog(@"working");
        
        
    }
    else{
        _hit = YES;
        self.deckController.enabled = YES;
        
        [self.viewDeckController closeLeftView];
        
        
    }
    //    if (_test&&_test2){
    //        CGRect boxFrame2 = self.tableView2.frame;
    //        boxFrame2.origin.x = 630;
    //
    //        [UIView beginAnimations:nil context:nil];
    //        [UIView setAnimationDuration:0.25];
    //        [UIView setAnimationDelay:0.12];
    //        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //
    //        self.tableView2.frame = boxFrame2;
    //        [UIView commitAnimations];
    //        _test2= NO;
    //
    //        CGRect boxFrame = self.tableView.frame;
    //        boxFrame.origin.x = 1;
    //        [UIView beginAnimations:nil context:nil];
    //        [UIView setAnimationDuration:0.25];
    //        [UIView setAnimationDelay:0.12];
    //        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //
    //        self.tableView.frame = boxFrame;
    //
    //        [UIView commitAnimations];
    //        _test= NO;
    //
    //
    //
    //
    //    }
    //    else if (_test&&!_test2){
    //        CGRect boxFrame = self.tableView.frame;
    //        boxFrame.origin.x = 1;
    //
    //        [UIView beginAnimations:nil context:nil];
    //        [UIView setAnimationDuration:0.25];
    //        [UIView setAnimationDelay:0.12];
    //        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //
    //        self.tableView.frame = boxFrame;
    //
    //        [UIView commitAnimations];
    //        _test = NO;
    //
    //    }
    //    else if (!_test&&!_test2){
    //
    //        CGRect boxFrame = self.tableView.frame;
    //        boxFrame.origin.x = -281;
    //
    //        [UIView beginAnimations:nil context:nil];
    //        [UIView setAnimationDuration:0.25];
    //        [UIView setAnimationDelay:0.12];
    //        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //
    //        self.tableView.frame = boxFrame;
    //
    //        [UIView commitAnimations];
    //        _test= YES;
    //
    //
    //    }
}
- (IBAction)settings:(id)sender {
    if (!_test2&!_test){
        CGRect boxFrame = self.tableView.frame;
        boxFrame.origin.x = -281;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationDelay:0.12];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        self.tableView.frame = boxFrame;
        
        [UIView commitAnimations];
        _test= YES;
        
        
        CGRect boxFrame2 = self.tableView2.frame;
        boxFrame2.origin.x = 90;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationDelay:0.12];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        self.tableView2.frame = boxFrame2;
        
        [UIView commitAnimations];
        _test2 = YES;
        
        
        
    }
    
    else if (!_test2&&_test){
        CGRect boxFrame2 = self.tableView2.frame;
        boxFrame2.origin.x = 90;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationDelay:0.12];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        self.tableView2.frame = boxFrame2;
        
        [UIView commitAnimations];
        _test2 = YES;
        
    }
    
    else if (_test2&&_test){
        CGRect boxFrame2 = self.tableView2.frame;
        boxFrame2.origin.x = 630;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationDelay:0.12];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        self.tableView2.frame = boxFrame2;
        [UIView commitAnimations];
        _test2= NO;
        
        
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (IBAction)enter:(id)sender {
    //when search term logged
    _background.hidden = YES;
    _backView2.hidden = YES;
    
    
    iCarouselExampleViewController *viewController = [[iCarouselExampleViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
    
    [self.tableView beginUpdates];
    [self.listOfItems addObject:self.textField.text];
    NSArray *paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:[self.listOfItems count]-1 inSection:0]];
    [[self tableView] insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
    
    //this is where search term must take parameter
    
    //        self.link = @"Timeline_of_United_States_history_(1790%E2%80%931819)";
    //      [self openView2:UIViewAnimationOptionTransitionCurlDown];
    
}


-(void)openView2:(UIViewAnimationOptions)options{
    NSString *queryString = self.link;
    
    UIView *fromView, *toView;
    if ([self.view1 superview] != nil)
    {
        fromView = self.view1;
        toView = self.view2;
    }
    else
    {
        fromView = self.view2;
        toView = self.view1;
    }
    
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:1.0
                       options:options
                    completion:^(BOOL finished) {
                        // animation completed
                    }];
    
    //where search happens
    NSString *defaultAPICall = [NSString stringWithFormat:@"http://en.wikipedia.org/w/api.php?action=query&rvprop=content&prop=revisions&format=json&titles=%@", queryString];
    
    
    
    [self apiCall: defaultAPICall];
    
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [_textField resignFirstResponder];
    return YES;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.listOfDecks.count;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.tableView) {
        //this is where search term must take parameter
        self.link = @"Timeline_of_United_States_history_(1790%E2%80%931819)";
        [self openView2:UIViewAnimationOptionTransitionCurlDown];
        
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //is there a cell that can be reused
    
    
    
    static NSString *cellID = @"Cell Identifier";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    
    if (!cell) {
        
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableViewLabel.png"]];
        
        
        
    }
    else{
        
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        if (tableView == self.tableView) {
            
            
            
            
            //name = value for key in array of recent searchers
            if (_rowNum == 0){
                NSString *cellValue = [self.listOfItems objectAtIndex:indexPath.row];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.text = cellValue;
                cell.textLabel.textColor = [UIColor whiteColor];
                
            }
            
            
        }
        else{
            
            if (_rowNum == 0){
                
                
                NSString *cellValue = [self.listOfDecks objectAtIndex:indexPath.row];
                
                
                cell.textLabel.text = cellValue;
                cell.textLabel.textColor = [UIColor whiteColor];
                
            }
        }
    }
    
    
    return cell;
    
}



-(void)apiCall:(NSString *)term{
    //interact with AFNetworking
    
    //NSURL for request
    
    NSURL *url = [[NSURL alloc] initWithString:term];
    
    
    //JSONRequestOperationWithRequest is a class method that accepts an NSURL request and two blocks, success and failure
    
    
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        //variable so any search works//////////////////////////////
        NSMutableCharacterSet *nonAlphaNumericCharacters2 = [[NSMutableCharacterSet alloc] init];
        [nonAlphaNumericCharacters2 formUnionWithCharacterSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]];
        
        _beat  = [[NSString alloc]initWithFormat:@"%@",[[JSON objectForKey:@"query"]objectForKey:@"pages"]];
        NSMutableArray *substrings2 = [NSMutableArray new];
        NSScanner *scanner2 = [NSScanner scannerWithString:_beat];
        NSString *substring2 = nil;
        [scanner2 scanUpToString:@"=" intoString:&substring2];
        [substrings2 addObject:substring2];
        [scanner2 scanString:@"=" intoString:nil];
        NSString *cut =
        [[[[substrings2 valueForKey:@"description"] componentsJoinedByString:@"\n\n"] componentsSeparatedByCharactersInSet:nonAlphaNumericCharacters2]
         componentsJoinedByString:@""];
        ////////////////////////////////////////////////
        
        
        
        _chop  = [[NSString alloc]initWithFormat:@"%@",[[[[JSON objectForKey:@"query"]objectForKey:@"pages"]objectForKey:cut]objectForKey:@"revisions"]];
        
        _timeLineText.text = _chop;
        
        
        
        NSMutableArray *substrings = [NSMutableArray new];
        NSScanner *scanner = [NSScanner scannerWithString:_chop];
        while(![scanner isAtEnd]) {
            NSString *substring = nil;
            [scanner scanUpToString:@"*" intoString:&substring];
            [substrings addObject:substring];
            [scanner scanString:@"*" intoString:nil];
            
            
        }
        // do something with substrings
        NSMutableCharacterSet *nonAlphaNumericCharacters = [[NSMutableCharacterSet alloc] init];
        [nonAlphaNumericCharacters formUnionWithCharacterSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]];
        [nonAlphaNumericCharacters removeCharactersInString:@" "];
        [nonAlphaNumericCharacters removeCharactersInString:@"\n"];
        
        NSString *trimmedReplacement =
        [[[[substrings valueForKey:@"description"] componentsJoinedByString:@"\n\n"] componentsSeparatedByCharactersInSet:nonAlphaNumericCharacters ]
         componentsJoinedByString:@""];
        
        _timeLineText.text = trimmedReplacement;
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
        
    }];
    
    [operation start];
    
    
}



- (IBAction)backButton:(id)sender {
    
    [self.tableView reloadData];
    [self.tableView2 reloadData];
    [self openView2:UIViewAnimationOptionTransitionCurlUp];
    
    //	UIView *theWindow = [_view2 superview];
    //
    //	// remove the current view and replace with myView1
    //	[_view2 removeFromSuperview];
    //	[theWindow addSubview:_view1];
    //	
    //	// set up an animation for the transition between the views
    //	CATransition *animation = [CATransition animation];
    //	[animation setDuration:0.5];
    //	[animation setType:kCATransitionReveal];
    //    [animation setSubtype:kCATransitionFromLeft];
    //    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    //	
    //	[[theWindow layer] addAnimation:animation forKey:@"SwitchToView2"];
}



@end
