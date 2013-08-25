//
//  AppDelegate.h
//  hoge
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "XML.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property UIButton *locationSelectButton;
@property int maxTemperature;
@property int minTemperature;
@property UIActivityIndicatorView *activityIndigator;
@property UIViewController *mainViewController;
@property CLLocationDegrees latitude;
@property CLLocationDegrees longitude;
@property id xmlInstance;
@end
