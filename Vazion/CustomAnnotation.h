//
//  CustomAnnotation.h
//  Vazion
//
//  Created by noko on 2013/08/29.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject <MKAnnotation>

@property CLLocationCoordinate2D coordinate;
@property UIImage *image;
@property NSString *title;
@property NSString *subtitle;

@end
