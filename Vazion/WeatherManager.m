//
//  WeatherSet.m
//  Vazion
//
//  Created by noko on 2013/08/26.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "WeatherManager.h"



@implementation WeatherManager{
    @private
    Weather *myWeather;
}

- (id)initWithDictionary:(NSDictionary *)weatherDictionary{
    self = [super init];
    if(self){
        AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
        _weatherDictionary = weatherDictionary;
        NSArray *resultArray = [[[_weatherDictionary objectForKey:@"weatherforecast"]objectForKey:@"pref"]objectForKey:@"area"];
        
        NSMutableArray *mutableResultArray = [[NSMutableArray alloc]init];
        
        for(NSDictionary *result in resultArray){
            myWeather = [[Weather alloc] init];
            myWeather.maxTemperator = [[[[[[[result objectForKey:@"info"]
                                            objectAtIndex:0]
                                           objectForKey:@"temperature"]
                                          objectForKey:@"range"]
                                         objectAtIndex:0]
                                        objectForKey:@"text"]
                                       intValue];
            
            myWeather.minTemperator = [[[[[[[result objectForKey:@"info"]
                                            objectAtIndex:0]
                                           objectForKey:@"temperature"]
                                          objectForKey:@"range"]
                                         objectAtIndex:1]
                                        objectForKey:@"text"]
                                       intValue];
            
            NSString *plainWeatherText = [[[[result objectForKey:@"info"]
                                            objectAtIndex:0]
                                           objectForKey:@"weather"]
                                          objectForKey:@"text"];
            
            NSLog(@"%@",plainWeatherText); //晴れ時々くもり
            plainWeatherText = @"くもりのち一時雪";
            if([plainWeatherText isEqualToString:@"晴れ"]){
                myWeather.mainWeather = @"晴";
                myWeather.toValue = @"";
                myWeather.nextWeather = @"";
            }else if([plainWeatherText isEqualToString:@"くもり"]){
                myWeather.mainWeather = @"曇";
                myWeather.toValue = @"";
                myWeather.nextWeather = @"";
            }else if([plainWeatherText isEqualToString:@"雨"]){
                myWeather.mainWeather = plainWeatherText;
                myWeather.toValue = @"";
                myWeather.nextWeather = @"";
            }else{
                NSArray *splitArray;
                if([self findString:plainWeatherText withKey:@"のち"]){
                    splitArray = [plainWeatherText componentsSeparatedByString:@"のち"];
                    myWeather.mainWeather = [self getMainWeatherString:[splitArray objectAtIndex:0]];
                    myWeather.toValue = @"のち";
                    myWeather.nextWeather = [splitArray objectAtIndex:1];
                }else if([self findString:plainWeatherText withKey:@"一時"]){
                    splitArray = [plainWeatherText componentsSeparatedByString:@"一時"];
                    myWeather.mainWeather = [self getMainWeatherString:[splitArray objectAtIndex:0]];
                    myWeather.toValue = @"一時";
                    myWeather.nextWeather = [splitArray objectAtIndex:1];
                }else if([self findString:plainWeatherText withKey:@"時々"]){
                    splitArray = [plainWeatherText componentsSeparatedByString:@"時々"];
                    myWeather.mainWeather = [self getMainWeatherString:[splitArray objectAtIndex:0]];
                    myWeather.toValue = @"時々";
                    myWeather.nextWeather = [splitArray objectAtIndex:1];
                }else if([self findString:plainWeatherText withKey:@"のち一時"]){
                    splitArray = [plainWeatherText componentsSeparatedByString:@"のち"];
                    myWeather.mainWeather = [self getMainWeatherString:[splitArray objectAtIndex:0]];
                    myWeather.toValue = @"のち";
                    myWeather.nextWeather = [splitArray objectAtIndex:1];
                }else if([self findString:plainWeatherText withKey:@"のち時々"]){
                    splitArray = [plainWeatherText componentsSeparatedByString:@"のち"];
                    myWeather.mainWeather = [self getMainWeatherString:[splitArray objectAtIndex:0]];
                    myWeather.toValue = @"のち";
                    myWeather.nextWeather = [splitArray objectAtIndex:1];
                }
                myWeather.latitude = [[[[result objectForKey:@"geo"]objectForKey:@"lat"] objectForKey:@"text"] doubleValue];
                myWeather.longitude = [[[[result objectForKey:@"geo"]objectForKey:@"long"] objectForKey:@"text"] doubleValue];
                //[mutableResultArray addObject:myWeather];
            }
            delegate.myWeather = myWeather;
        }
        
    }
    return self;
}

-(Boolean)findString:(NSString*)string withKey:(NSString*)key{
    if([string rangeOfString:key].location != NSNotFound){
        return true;
    }
    return false;
}

-(NSString*)getMainWeatherString:(NSString*)string{
    if([string isEqualToString:@"晴れ"]){
        return @"晴";
    }else if([string isEqualToString:@"くもり"]){
        return @"曇";
    }else if([string isEqualToString:@"雨"]){
        return @"雨";
    }
    return @"";
}

@end
