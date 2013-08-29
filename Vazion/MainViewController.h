//
//  ViewController.h
//  hoge
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrkAPI.h"
#import "GPS.h"
#import "AppDelegate.h"
#import "WeatherInfo.h"
#import "CustomAnnotation.h"
#import "SharedInstance.h"
@interface MainViewController : UIViewController <MKAnnotation, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UILabel *maxTemperatureTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTemperatureTextLabel;
@property IBOutlet UIButton *gpsRefreshButton;
@property Boolean isInitialized;
@property (weak, nonatomic) IBOutlet UILabel *mainWeather;
@property (weak, nonatomic) IBOutlet UILabel *toValue;
@property (weak, nonatomic) IBOutlet UILabel *nextWeather;
@property (weak, nonatomic) IBOutlet UIButton *enterSendViewButton;
@property (weak, nonatomic) IBOutlet UIView *splashView;
@property (weak, nonatomic) IBOutlet UIImageView *splashCompassIcon;
@property (weak, nonatomic) IBOutlet UIImageView *splashSunIcon;
@property (weak, nonatomic) IBOutlet UIImageView *splashCloudIcon;
@property (weak, nonatomic) IBOutlet UIImageView *splashMoonIcon;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIButton *zoomOutButton;
@property (weak, nonatomic) IBOutlet UIButton *zoomInButton;
@property (weak, nonatomic) IBOutlet UIButton *showMyLocationButton;
@property (weak, nonatomic) IBOutlet MKMapView *overlayedMapView;
- (IBAction)enterDetailViewButtonPushed:(id)sender;
- (IBAction)showMyLocationButtonPushed:(id)sender;
- (IBAction)zoomOutButtonPushed:(id)sender;
- (IBAction)zoomInButtonPushed:(id)sender;
- (IBAction)gpsRefreshButtonLongPushed:(id)sender;
- (IBAction)refreshInfomation;
- (IBAction)closeButtonPushed:(id)sender;
@end
