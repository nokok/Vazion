//
//  NFWeather.m
//  VazionWeather
//
//  Created by noko on 2013/10/06.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "NFWeather.h"

@implementation NFWeather{
    @private
    NSDictionary *prefectureNameDictionary;
}

#pragma mark -
#pragma mark Initializer
- (id)initSharedInstance{
    self = [super init];
    if(self){
        
    }
    return self;
}

#pragma mark -
#pragma mark Singleton SharedInstanceManager
+(NFWeather*)sharedManager{
    static NFWeather* sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[NFWeather alloc]initSharedInstance];
    });
    return sharedInstance;
}

- (id)init{
    self = [super init];
    if(self) {
        
    }
    return self;
}

#pragma mark -
#pragma mark Fetch from drk7.jp server
-(void)fetchXMLData:(NSString *)prefName{
    NSURL *url = [NSURL URLWithString:[NSString
                                       stringWithFormat:@"%@%@",@"http://www.drk7.jp/weather/xml/",
                                       [prefectureNameDictionary objectForKey:prefName]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *fetchedXMLData = [NSURLConnection
                              sendSynchronousRequest:request
                              returningResponse:nil
                              error:nil];
    NSDictionary *parsedXMLData = [self encodingDataToDictionary:fetchedXMLData];
    
    NSArray *resultSet = [[[parsedXMLData objectForKey:@"weatherforecast"]objectForKey:@"pref"]objectForKey:@"area"];
    NSDictionary *result = [resultSet objectAtIndex:[self chooseNearestData:parsedXMLData]];
    
    NSDictionary *weather = [[result objectForKey:@"info"]objectAtIndex:0];
    
    NSData *imageData = [NSData dataWithContentsOfURL:
                         [NSURL URLWithString:
                          [[weather objectForKey:@"img"]objectForKey:@"text"]]];
    UIImage *image = [[UIImage alloc]initWithData:imageData];
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSHourCalendarUnit fromDate:now];
    
    NSString* rainfallchance;
    
    NSArray *rainDataArray = [[weather objectForKey:@"rainfallchance"]objectForKey:@"period"];
    
    if(dateComponents.hour >= 0 && 7 > dateComponents.hour){
        rainfallchance = [[rainDataArray objectAtIndex:0]objectForKey:@"text"];
    }else if(dateComponents.hour >= 7 && 13 > dateComponents.hour){
        rainfallchance = [[rainDataArray objectAtIndex:1]objectForKey:@"text"];
    }else if(dateComponents.hour >=13 && 19 > dateComponents.hour){
        rainfallchance = [[rainDataArray objectAtIndex:2]objectForKey:@"text"];
    }else{
        rainfallchance = [[rainDataArray objectAtIndex:3]objectForKey:@"text"];
    }
    
    NSArray *temperatureArray = [[weather objectForKey:@"temperature"]objectForKey:@"range"];
    
    [self.delegate
     weatherInfomationFetched: [[weather objectForKey:@"weather"]objectForKey:@"text"]
     img:image
     maxTemp:[[temperatureArray objectAtIndex:0]objectForKey:@"text"]
     minTemp:[[temperatureArray objectAtIndex:1]objectForKey:@"text"]
     rainProbablity:rainfallchance];
    
}

- (NSDictionary*)encodingDataToDictionary:(NSData*)data{
    NSError *error;
    return [XMLReader dictionaryForXMLData:data error:&error];
}

- (int)chooseNearestData:(NSDictionary*)dic{
    NSArray *resultSet = [[[dic objectForKey:@"weatherforecast"]objectForKey:@"pref"]objectForKey:@"area"];
    
    double myLatitude = [NFLocation sharedManager].latitude;
    double myLongitude = [NFLocation sharedManager].longitude;
    
    int nearestIndex = 0;
    double minDiff = 0.0f;
    
    int i=0;
    for(NSDictionary *result in resultSet){
        
        double latitude = [[[[result objectForKey:@"geo"]objectForKey:@"lat"] objectForKey:@"text"] doubleValue];
        double longitude = [[[[result objectForKey:@"geo"]objectForKey:@"long"] objectForKey:@"text"] doubleValue];

        CLLocation *location = [[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
        double latDiff,lonDiff;
        
        latDiff = fabs(location.coordinate.latitude - myLatitude);
        lonDiff = fabs(location.coordinate.longitude - myLongitude);
        
        if(minDiff == 0.0){
            minDiff = latDiff * lonDiff;
        }
        if(minDiff > latDiff * lonDiff){
            minDiff = latDiff * lonDiff;
            nearestIndex = i;
        }
        i++;
    }
    return nearestIndex;
}

@end
