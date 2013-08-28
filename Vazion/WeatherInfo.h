//
//  WeatherInfo.h
//  Vazion
//
//  Created by noko on 2013/08/29.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherSendViewController.h"

@interface WeatherInfo : NSObject

@property double latitude;
@property double longitude;
@property WeatherStatus *weather;
@property Boolean isWithThunderbolt;
@property Boolean isWithStrongWind;
@property Boolean isWithSnow;
@property NSString *timestamp;


@end
