//
//  SharedInstance.h
//  Vazion
//
//  Created by noko on 2013/08/29.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface SharedInstance : NSObject

@property MKMapView *sharedMapView;

+ (SharedInstance*) sharedManager;

@end
