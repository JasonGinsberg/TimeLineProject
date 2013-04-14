//
//  AppDelegate.h
//  Delegate
//
//  Created by Jason Ginsberg on 3/31/13.
//  Copyright (c) 2013 Jason Ginsberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic) UIViewController *centerController;
@property (retain, nonatomic) UIViewController *leftController;
@property (retain, nonatomic) UIViewController *iCarouselExampleViewController;

@property (retain, nonatomic) UIViewController *imageController;
@end
