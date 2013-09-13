//
//  Weather.h
//  Vazion
//
//  Created by noko on 2013/08/25.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property double latitude;
@property double longitude;
@property NSString *location;
@property NSString *mainWeather;
@property NSString *toValue;
@property NSString *nextWeather;
@property int maxTemperator;
@property int minTemperator;

@end
