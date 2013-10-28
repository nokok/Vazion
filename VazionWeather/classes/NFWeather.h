//
//  NFWeather.h
//  VazionWeather
//
//  Created by noko on 2013/10/06.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFLocation.h"

@interface NFWeather : NSObject<NFWeatherInfomationDelegate>

@property (readonly) NSString *myWeather;

- (id)init;
+ (NFWeather*)sharedManager;

@end
