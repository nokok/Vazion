//
//  NFGPS.h
//  VazionWeather
//
//  Created by noko on 2013/10/06.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLGeocoder.h>
#import <CoreLocation/CLPlacemark.h>

@protocol NFGPSInfomationDelegate <NSObject>
@optional
- (void) gpsInfomationUpdating;
- (void) gpsInfomationUpdated;
- (void) addressUpdated:(NSString*)address
               prefName:(NSString*)prefName
               cityName:(NSString*)cityName;
@end

@interface NFLocation : NSObject<CLLocationManagerDelegate,NFGPSInfomationDelegate>

@property (nonatomic, readonly) NSString *myPrefectureName;
@property (nonatomic, readonly) NSString *myCityName;
@property (nonatomic, readonly) NSString *myAddress;
@property (nonatomic, readonly) Boolean isGPSEnabled;
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;
@property (nonatomic, weak)     id<NFGPSInfomationDelegate> delegate;

- (id)init;
- (void)updateMyGPSInfomation;
+ (NFLocation*)sharedManager;

@end
