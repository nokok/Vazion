//
//  GPS.m
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "GPS.h"

@class CLLocationManager;

@implementation GPS{
@private
    CLLocationManager *locationManager;
}

-(id)init{
    self = [super init];
    if(self){
        locationManager = [[CLLocationManager alloc]init];
    }
    return self;
}

-(Boolean)isGPSEnabled{
    return [CLLocationManager locationServicesEnabled];
}

@end
