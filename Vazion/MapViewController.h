//
//  MapViewController.h
//  Vazion
//
//  Created by noko on 2013/08/22.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AppDelegate.h"
#import "GPS.h"
#import "WeatherInfo.h"
#import "CustomAnnotation.h"
#import "SharedInstance.h"

@interface MapViewController : UIViewController<MKAnnotation,MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mainMapView;

- (IBAction)showMyLocationButtonPushed:(id)sender;
- (IBAction)closeButtonPushed:(id)sender;
- (IBAction)zoomOutButtonPushed:(id)sender;
- (IBAction)zoomInButtonPushed:(id)sender;

@end