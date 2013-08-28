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
    AppDelegate *delegate;
}

+ (GPS*)sharedManager{
    static GPS* sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GPS alloc]initSharedInstance];
    });
    return sharedInstance;
}

- (id)initSharedInstance{
    self = [super init];
    if(self){
        delegate = [[UIApplication sharedApplication]delegate];
        location = [[CLLocation alloc]initWithLatitude:_latitude longitude:_longitude];
        locationManager = [[CLLocationManager alloc]init];
        locationManager.delegate = self;
        geocoder = [[CLGeocoder alloc]init];
    }
    return self;
}

- (id)init{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
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
                       _prefectureName = placemark.administrativeArea;
                       _cityName = placemark.locality;
                   }];
    return [NSString stringWithFormat:@"%@%@",_prefectureName,_cityName];
}

- (void)refresh{
    location = [[CLLocation alloc]initWithLatitude:delegate.myLatitude longitude:delegate.myLongitude];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    [self refresh];
    [self getLocationString];
    delegate.myLatitude = [newLocation coordinate].latitude;
    delegate.myLongitude = [newLocation coordinate].longitude;
    if(_prefectureName != nil){
        [delegate.locationSelectButton setTitle:[NSString stringWithFormat:@"%@%@",_prefectureName,_cityName]
                                       forState:UIControlStateNormal];
        XML *xmlInstance = delegate.sharedXmlInstance;
        [xmlInstance refreshDictionary:_prefectureName];
        [xmlInstance refreshInfomation];
        [delegate.activityIndigator stopAnimating];
        delegate.activityIndigator.hidden = YES;
        [((MainViewController*)delegate.mainViewController) refreshInfomation];
    }
}

@end