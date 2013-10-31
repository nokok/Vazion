//
//  NFWeatherSendViewController.h
//  VazionWeather
//
//  Created by noko on 2013/10/28.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NFWeatherSendViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *weatherSelector;
@property (weak, nonatomic) IBOutlet UISwitch *publishSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *anonymousPostSwitch;
@property (weak, nonatomic) IBOutlet UIButton *thunderboltButton;
@property (weak, nonatomic) IBOutlet UIButton *strongwindButton;
@property (weak, nonatomic) IBOutlet UIButton *hailButton;
@property (weak, nonatomic) IBOutlet UIButton *fogButton;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

- (IBAction)withThunderboltButtonPushed:(id)sender;
- (IBAction)withStrongwindButtonPushed:(id)sender;
- (IBAction)withHailButtonPushed:(id)sender;
- (IBAction)withFogButtonPushed:(id)sender;
- (IBAction)sendButtonPushed:(id)sender;
- (IBAction)addPictureButtonPushed:(id)sender;
- (IBAction)publishSwitchValueChanged:(id)sender;

@end
