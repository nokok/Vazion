//
//  WeatherSendViewController.h
//  Vazion
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherSendViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *sunnyButton;
@property (weak, nonatomic) IBOutlet UIButton *cloudyButton;
@property (weak, nonatomic) IBOutlet UIButton *rainyButton;

- (IBAction)sunnyButtonPushed:(id)sender;
- (IBAction)cloudyButtonPushed:(id)sender;
- (IBAction)rainyButtonPushed:(id)sender;

@end
