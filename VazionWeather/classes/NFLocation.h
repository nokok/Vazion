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
@interface NFLocation : NSObject<CLLocationManagerDelegate>

@property (nonatomic, readonly)NSString *myAddress;
@property (nonatomic, readonly)Boolean isGPSEnabled;

-(id)init;
-(void)updateMyGPSInfomation;
+(NFLocation*)sharedManager;

@end
