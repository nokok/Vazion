//
//  WeatherSendViewController.h
//  Vazion
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

typedef enum WeatherStatus : NSInteger {
    UNDEFINED = 0,
    SUNNY = 1,
    CLOUDY = 2,
    RAINY = 3,
} WeatherStatus;

@interface WeatherSendViewController : UIViewController
@property Boolean isWithThunderBolt;
@property Boolean isWithStrongWind;
@property Boolean isWithSnow;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *sunnyButton;
@property (weak, nonatomic) IBOutlet UIButton *cloudyButton;
@property (weak, nonatomic) IBOutlet UIButton *rainyButton;
@property (weak, nonatomic) IBOutlet UIButton *withThunderBoltButton;
@property (weak, nonatomic) IBOutlet UIButton *withStrongWindButton;
@property (weak, nonatomic) IBOutlet UIButton *withSnowButton;
@property WeatherStatus weather;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

- (IBAction)sunnyButtonPushed:(id)sender;
- (IBAction)cloudyButtonPushed:(id)sender;
- (IBAction)rainyButtonPushed:(id)sender;
- (IBAction)withThunderBoltButtonPushed:(id)sender;
- (IBAction)withStrongWindButtonPushed:(id)sender;
- (IBAction)withSnowButtonPushed:(id)sender;
- (IBAction)closeButtonPushed:(id)sender;
- (IBAction)sendButtonPushed:(id)sender;

@end
