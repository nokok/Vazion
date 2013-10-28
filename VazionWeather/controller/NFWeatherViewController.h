//
//  NFWeatherViewController.h
//  VazionWeather
//
//  Created by noko on 2013/10/28.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFLocation.h"

@interface NFWeatherViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *updateTimeLabel;

- (IBAction)updateButtonClicked:(id)sender;
@end
