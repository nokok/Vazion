//
//  GPS.m
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "GPS.h"

@implementation GPS{
@private
    CLLocation *location;
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
}

- (id)init{
    self = [super init];
    if(self){
        location = [[CLLocation alloc]initWithLatitude:_latitude longitude:_longitude];
        locationManager = [[CLLocationManager alloc]init];
        locationManager.delegate = self;
        geocoder = [[CLGeocoder alloc]init];
    }
    return self;
}

- (Boolean)isGPSEnabled{
    return [CLLocationManager locationServicesEnabled];
}

- (void)updateMyAddress{
    [locationManager startUpdatingLocation];
    [self refresh];
}

- (NSString*)getLocationString{
    [geocoder reverseGeocodeLocation:location
                   completionHandler:^(NSArray *placemarks,NSError *error){
                       CLPlacemark *placemark = [placemarks lastObject];
                       _prefName = placemark.administrativeArea;
                       _cityName = placemark.locality;
                   }];
    return [NSString stringWithFormat:@"%@%@",_prefName,_cityName];
}

- (void)refresh{
    location = [[CLLocation alloc]initWithLatitude:_latitude longitude:_longitude];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    [self refresh];
    [self getLocationString];
    _latitude = [newLocation coordinate].latitude;
    _longitude = [newLocation coordinate].longitude;
    NSLog(@"%f,%f",_latitude,_longitude);
    NSLog(@"%@%@",_prefName,_cityName);
    if(_prefName != nil){
        MainViewController *instance = [MainViewController sharedInstance];
        [instance setButtonText:[NSString stringWithFormat:@"%@%@",_prefName,_cityName]];
    }
}

@end