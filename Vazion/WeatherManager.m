//
//  WeatherSet.m
//  Vazion
//
//  Created by noko on 2013/08/26.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "WeatherManager.h"



@implementation WeatherManager

- (id)initWithDictionary:(NSDictionary *)weatherDictionary{
    self = [super init];
    if(self){
        _weatherDictionary = weatherDictionary;
        NSArray *resultArray = [[[_weatherDictionary objectForKey:@"weatherforecast"]objectForKey:@"pref"]objectForKey:@"area"];
        
        NSMutableArray *mutableResultArray = [[NSMutableArray alloc]init];
        
        for(NSDictionary *result in resultArray){
            Weather *myWeather = [[Weather alloc] init];
            myWeather.maxTemperator = [[[[[[[result objectForKey:@"info"]objectAtIndex:0] objectForKey:@"temperature"]objectForKey:@"range"]objectAtIndex:0]objectForKey:@"text"] intValue];
            
            myWeather.maxTemperator = [[[[[[[result objectForKey:@"info"]objectAtIndex:0] objectForKey:@"temperature"]objectForKey:@"range"]objectAtIndex:1]objectForKey:@"text"] intValue];
            
            NSString *plainWeatherText = [[[[result objectForKey:@"info"]objectAtIndex:0] objectForKey:@"weather"]objectForKey:@"text"];
            NSLog(@"%@",plainWeatherText);
            myWeather.latitude = [[[[result objectForKey:@"geo"]objectForKey:@"lat"] objectForKey:@"text"] doubleValue];
            myWeather.longitude = [[[[result objectForKey:@"geo"]objectForKey:@"long"] objectForKey:@"text"] doubleValue];
            [mutableResultArray addObject:myWeather];
        }
        
        //取ってきたデータで一番近いデータを選ぶ処理
    }
    return self;
}

@end
