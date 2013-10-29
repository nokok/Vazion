//
//  NFWeather.h
//  VazionWeather
//
//  Created by noko on 2013/10/06.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLReader.h"
#import "NFLocation.h"

@protocol NFWeatherInfomationDelegate <NSObject>
@required
- (void) weatherInfomationFetched:(NSString*)weather img:(UIImage*)image maxTemp:(NSString*)maxTemp minTemp:(NSString*)minTemp rainProbablity:(NSString*)rainProb;
@end

@interface NFWeather : NSObject

@property (readonly) NSString *myWeather;
@property id<NFWeatherInfomationDelegate> delegate;

- (id)init;
+ (NFWeather*)sharedManager;
- (void)fetchXMLData:(NSString*)prefName;

@end
