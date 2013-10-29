//
//  NFWeatherViewController.h
//  VazionWeather
//
//  Created by noko on 2013/10/28.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFLocation.h"
#import "NFWeather.h"

@interface NFWeatherViewController : UIViewController<NFGPSInfomationDelegate,NFWeatherInfomationDelegate>

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *updateTimeLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainProbablityLabel;
@property (weak, nonatomic) IBOutlet UILabel *temprature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;


- (IBAction)updateButtonClicked:(id)sender;
@end
