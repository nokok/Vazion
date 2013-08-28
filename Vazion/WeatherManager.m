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
        AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
        _weatherDictionary = weatherDictionary;
        NSArray *resultArray = [[[_weatherDictionary objectForKey:@"weatherforecast"]objectForKey:@"pref"]objectForKey:@"area"];
        
        NSMutableArray *mutableResultArray = [[NSMutableArray alloc]init];
        
        for(NSDictionary *result in resultArray){
            Weather *myWeather = [[Weather alloc] init];
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
            
            if([plainWeatherText isEqualToString:@"晴れ"]){
                NSLog(@"s");
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
                NSRegularExpression *mainRegexp = [NSRegularExpression regularExpressionWithPattern:@"^(晴れ|くもり|雨|雪)"
                                                                                            options:0
                                                                                              error:nil];
                
                NSRegularExpression *centerRegexp = [NSRegularExpression regularExpressionWithPattern:@"((のち)|(一時)|(時々))"
                                                                                              options:0
                                                                                                error:nil];
                NSRegularExpression *nextRegexp = [NSRegularExpression regularExpressionWithPattern:@"((雨)|(雪)|(くもり)|(雷を伴う)|(時々晴れ)|(晴れ)|(雷雨)|(強く降る)|(みぞれ))$"
                                                                                            options:0
                                                                                              error:nil];
                myWeather.mainWeather = [mainRegexp stringByReplacingMatchesInString:plainWeatherText //晴れ時々くもり
                                                                             options:0
                                                                               range:NSMakeRange(0, plainWeatherText.length)
                                                                        withTemplate:@"$1"];
                NSLog(@"main:%@",myWeather.mainWeather);
                myWeather.toValue = [centerRegexp stringByReplacingMatchesInString:plainWeatherText
                                                                           options:0
                                                                             range:NSMakeRange(0, plainWeatherText.length)
                                                                      withTemplate:@"$1"];
                NSLog(@"to:%@",myWeather.toValue);
                myWeather.nextWeather = [nextRegexp stringByReplacingMatchesInString:plainWeatherText
                                                                             options:0
                                                                               range:NSMakeRange(0,plainWeatherText.length)
                                                                        withTemplate:@"$1"];
                NSLog(@"next:%@",myWeather.nextWeather); 
                myWeather.latitude = [[[[result objectForKey:@"geo"]objectForKey:@"lat"] objectForKey:@"text"] doubleValue];
                myWeather.longitude = [[[[result objectForKey:@"geo"]objectForKey:@"long"] objectForKey:@"text"] doubleValue];
                //[mutableResultArray addObject:myWeather];
            }
            delegate.myWeather = myWeather;
        }
        
    }
    return self;
}

@end
