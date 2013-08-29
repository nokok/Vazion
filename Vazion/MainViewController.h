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

@interface MainViewController : UIViewController

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

- (IBAction)gpsRefreshButtonLongPushed:(id)sender;
- (void)refreshInfomation;
@end
