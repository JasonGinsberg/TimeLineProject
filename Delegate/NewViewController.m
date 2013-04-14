//
//  NewViewController.m
//  Delegate
//
//  Created by Jason Ginsberg on 3/10/13.
//  Copyright (c) 2013 Jason Ginsberg. All rights reserved.
// get results of JSON Key "*" send search item from first view controller
// changing transitions between views
// breaking down long string blocks and interpreting information and
// eliminating spaces in search term strings

#import "NewViewController.h"
#import "AFNetworking.h"
#import "SBJSON.h"


@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // webview
    //        NSURL *url = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/American_Civil_War"];
    //    NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
    //    [_webView loadRequest:requestURL];
    [super viewDidLoad];
    
    // Initializing Data Source
    //change to variable so any search works
    NSString *defaultAPICall = @"http://en.wikipedia.org/w/api.php?action=query&rvprop=content&prop=revisions&format=json&titles=Timeline_of_United_States_history_(1790%E2%80%931819)";
    [self apiCall: defaultAPICall];
}


-(void)apiCall:(NSString *)term{
    //interact with AFNetworking
    
    //NSURL for request
    
    NSURL *url = [[NSURL alloc] initWithString:term];
    
    
    //JSONRequestOperationWithRequest is a class method that accepts an NSURL request and two blocks, success and failure
    
    
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        //225218 change to variable so any search works
        _chop  = [[NSString alloc]initWithFormat:@"%@",[[[[JSON objectForKey:@"query"]objectForKey:@"pages"]objectForKey:@"225218"]objectForKey:@"revisions"]];
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end


