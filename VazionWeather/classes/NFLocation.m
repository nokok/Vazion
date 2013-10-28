//
//  NFGPS.m
//  VazionWeather
//
//  Created by noko on 2013/10/06.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "NFLocation.h"

@implementation NFLocation{
    @private
    CLLocation *location;
    CLLocationManager *locationManager;
}

-(id)init{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

-(id)initSharedInstance{
    self = [super init];
    if(self){
        locationManager = [[CLLocationManager alloc]init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        [locationManager startUpdatingLocation];
    }
    return self;
}

+(NFLocation*)sharedManager{
    static NFLocation* sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[NFLocation alloc]initSharedInstance];
    });
    return sharedInstance;
}

-(void)updateMyGPSInfomation{
    [locationManager stopUpdatingLocation];
    [locationManager startUpdatingLocation];
    [self.delegate gpsInfomationUpdating];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    _longitude = newLocation.coordinate.longitude;
    _latitude = newLocation.coordinate.latitude;
    location = locationManager.location;
    [self reverseGeocordeWithLatitude:_latitude longitude:_longitude];
    [locationManager stopUpdatingLocation];
    [self.delegate gpsInfomationUpdated];
}

- (void)reverseGeocordeWithLatitude:(double)latitude longitude:(double)longitude {
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    location = [[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray* placemarks,NSError *error){
        if([placemarks count] > 0){
            CLPlacemark *placemark = [placemarks firstObject];
            _myPrefectureName = placemark.administrativeArea;
            _myCityName = placemark.locality;
            _myAddress = [NSString stringWithFormat:@"%@%@",_myPrefectureName,_myCityName];
            
            [self.delegate addressUpdated:_myAddress prefName:_myPrefectureName cityName:_myCityName];
        }
    }];
}

@end
