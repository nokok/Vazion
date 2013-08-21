//
//  WeatherSendViewController.h
//  hoge
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherSendViewController : UIViewController

@property NSString *weather;
@property bool isWithThunderbolt;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property bool isWithStrongWind;
@property IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *sunnyButton;
@property (weak, nonatomic) IBOutlet UIButton *rainyButton;
@property (weak, nonatomic) IBOutlet UIButton *cloudyButton;
@property (weak, nonatomic) IBOutlet UIButton *withThunderboltButton;
@property (weak, nonatomic) IBOutlet UIButton *withStrongWindButton;

- (IBAction)sunnyButtonPushed:(id)sender;
- (IBAction)rainyButtonPushed:(id)sender;
- (IBAction)cloudyButtonPushed:(id)sender;
- (IBAction)withThunderboltButtonPushed:(id)sender;
- (IBAction)withStrongWIndButtonPushed:(id)sender;
- (IBAction)backButtonPushed:(id)sender;

- (IBAction)sendButtonPushed:(id)sender;

@end
