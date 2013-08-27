//
//  WeatherSet.h
//  Vazion
//
//  Created by noko on 2013/08/26.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface WeatherManager : NSObject

@property Weather *todayWeather;
@property NSDictionary *weatherDictionary;

-(id)initWithDictionary:(NSDictionary*)weatherDictionary;

@end
