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
        
    NSString *next = @"のち";
        
        /*
        
        
        
         「私の書いた正規表現は役に立ったんですよね。 何か直接の手柄はなくてもこの正規表現は天気の抽出の糧になったんですよね」
         
         「もちろん・・いや・・今回の実装で私は、いや、今回も・・くっ・・何も動きませんでしたぁぁ！！
         私が無能なばかりにただいたずらに時間を浪費し、正規表現を動かすことが、できませんでしたぁぁ！！」
        
         
        
        
        */
        
        
        AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
        _weatherDictionary = weatherDictionary;
        NSArray *resultArray = [[[_weatherDictionary objectForKey:@"weatherforecast"]objectForKey:@"pref"]objectForKey:@"area"];
        
        //NSMutableArray *mutableResultArray = [[NSMutableArray alloc]init];
        
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
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"朝の内" withString:@""];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"で雷を伴う" withString:@"と雷"];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"朝夕" withString:@""];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"夕方" withString:next];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"一時強く降る" withString:@""];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"山沿い雷雨" withString:@""];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"山沿い雪" withString:@""];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"午後は" withString:next];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"昼頃から" withString:next];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"夕方から" withString:next];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"夜は" withString:next];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"夜半から" withString:next];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"明け方霧" withString:@""];
            plainWeatherText = [plainWeatherText stringByReplacingOccurrencesOfString:@"海上海岸は霧か霧雨" withString:@""];
            
            
            if([plainWeatherText isEqualToString:@"晴れ"]){
                [self labelSet:@"晴" toLabel:@"" next:@""];
            }else if([plainWeatherText isEqualToString:@"くもり"]){
                [self labelSet:@"曇" toLabel:@"" next:@""];
            }else if([plainWeatherText isEqualToString:@"雨"]){
                [self labelSet:@"雨" toLabel:@"" next:@""];
            }else if([plainWeatherText isEqualToString:@"雪"]){
                [self labelSet:@"雪" toLabel:@"" next:@""];
            }else if([plainWeatherText isEqualToString:@"雨と雷"]){
                [self labelSet:@"雨" toLabel:@"ときどき" next:@"雷"];
            }else if([plainWeatherText isEqualToString:@"雪と雷"]){
                [self labelSet:@"雪" toLabel:@"ときどき" next:@"雷"];
            }else if([plainWeatherText isEqualToString:@"霧"]){
                [self labelSet:@"霧" toLabel:@"" next:@""];
            }else{
                NSArray *splitArray;
                if([self findString:plainWeatherText withKey:next]){
                
                    splitArray = [plainWeatherText componentsSeparatedByString:next];
                    [self labelSet:[self getMainWeatherString:[splitArray objectAtIndex:0]]
                                                      toLabel:next
                                                         next:[splitArray objectAtIndex:1]];
                    
                }else if([self findString:plainWeatherText withKey:@"一時"]){
                
                    splitArray = [plainWeatherText componentsSeparatedByString:@"一時"];
                    [self labelSet:[self getMainWeatherString:[splitArray objectAtIndex:0]]
                           toLabel:@"一時"
                              next:[splitArray objectAtIndex:1]];
                
                }else if([self findString:plainWeatherText withKey:@"時々"]){
                    
                    splitArray = [plainWeatherText componentsSeparatedByString:@"時々"];
                    [self labelSet:[self getMainWeatherString:[splitArray objectAtIndex:0]]
                           toLabel:@"ときどき"
                              next:[splitArray objectAtIndex:1]];
                
                }else if([self findString:plainWeatherText withKey:@"のち一時"]){
                    
                    splitArray = [plainWeatherText componentsSeparatedByString:next];
                    [self labelSet:[self getMainWeatherString:[splitArray objectAtIndex:0]]
                           toLabel:next
                              next:[splitArray objectAtIndex:1]];
                
                }else if([self findString:plainWeatherText withKey:@"のち時々"]){
                    
                    splitArray = [plainWeatherText componentsSeparatedByString:next];
                    [self labelSet:[self getMainWeatherString:[splitArray objectAtIndex:0]]
                           toLabel:next
                              next:[splitArray objectAtIndex:1]];
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
    }else if([string isEqualToString:@"霧"]){
        return @"霧";
    }
    return @"";
}

-(void)labelSet:(NSString*)main toLabel:(NSString*)to next:(NSString*)next{
    myWeather.mainWeather = main;
    myWeather.toValue = to;
    myWeather.nextWeather = next;
}

@end
