//
//  GPS.h
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MainViewController.h"
#import "AppDelegate.h"
#import "XML.h"

@interface GPS : NSObject<CLLocationManagerDelegate>

@property NSString *prefectureName;
@property NSString *cityName;
@property CLLocationDegrees latitude;
@property CLLocationDegrees longitude;

- (id)init;
- (Boolean)isGPSEnabled;
- (void)updateMyAddress;
- (NSString*)getLocationString;
- (void)refresh;
+ (GPS*)sharedManager;

@end
