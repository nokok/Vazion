//
//  WeatherSendViewController.m
//  Vazion
//
//  Created by noko on 2013/08/21.
//  Copyright (c) 2013年 noko. All rights reserved.
//

#import "WeatherSendViewController.h"

@interface WeatherSendViewController ()

@end

@implementation WeatherSendViewController{
    @private
    UIColor *backgroundColor;
    UIColor *buttonColor;
    UIColor *buttonTextColor;
    UIColor *selectedButtonTextColor;
}

typedef enum WeatherStatus : NSInteger {
    SUNNY,
    CLOUDY,
    RAINY,
} WeatherStatus;

- (id)initWithNibName:(NSString *)nibNameOrUIControlStateNormal bundle:(NSBundle *)nibBundleOrUIControlStateNormal
{
    self = [super initWithNibName:nibNameOrUIControlStateNormal bundle:nibBundleOrUIControlStateNormal];
    if (self) {
        // Custom initialization
        backgroundColor = [UIColor blackColor];
        buttonColor = [UIColor whiteColor];
        buttonTextColor = [UIColor whiteColor];
        _isWithThunderBolt = NO;
        _isWithStrongWind = NO;
        _isWithSnow = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sunnyButtonPushed:(id)sender {
    [self buttonColorChange:SUNNY];
}

- (IBAction)cloudyButtonPushed:(id)sender {
    [self buttonColorChange:CLOUDY];
}

- (IBAction)rainyButtonPushed:(id)sender {
    [self buttonColorChange:RAINY];
}

- (IBAction)withThunderBoltButtonPushed:(id)sender {
    
    if(_isWithThunderBolt){
        [_withThunderBoltButton setBackgroundColor:[UIColor whiteColor]];
        _isWithThunderBolt = NO;
        [_withThunderBoltButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        [_withThunderBoltButton setBackgroundColor:[UIColor blackColor]];
        _isWithThunderBolt = YES;
        [_withThunderBoltButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

- (IBAction)withStrongWindButtonPushed:(id)sender {
    if(_isWithStrongWind){
        [_withStrongWindButton setBackgroundColor:[UIColor whiteColor]];
        _isWithStrongWind = NO;
        [_withStrongWindButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        [_withStrongWindButton setBackgroundColor:[UIColor blackColor]];
        _isWithStrongWind = YES;
        [_withStrongWindButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

- (IBAction)didEndOnExit:(id)sender {
    [_textField endEditing:YES];
}

- (IBAction)withSnowButtonPushed:(id)sender {
    if(_isWithSnow){
        [_withSnowButton setBackgroundColor:[UIColor whiteColor]];
        [_withSnowButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _isWithSnow = NO;
    }else{
        [_withSnowButton setBackgroundColor:[UIColor blackColor]];
        [_withSnowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _isWithSnow = YES;
    }
}

- (IBAction)closeButtonPushed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)buttonColorChange:(WeatherStatus)button{
    if(button == SUNNY){
        [_sunnyButton setBackgroundColor:[UIColor colorWithRed:0.9f green:0.9f blue:0.4f alpha:1.0f]];
        [_cloudyButton setBackgroundColor:buttonColor];
        [_rainyButton setBackgroundColor:buttonColor];
    }else if(button == CLOUDY){
        [_sunnyButton setBackgroundColor:buttonColor];
        [_cloudyButton setBackgroundColor:[UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f]];
        [_rainyButton setBackgroundColor:buttonColor];
    }else if(button == RAINY){
        [_sunnyButton setBackgroundColor:buttonColor];
        [_cloudyButton setBackgroundColor:buttonColor];
        [_rainyButton setBackgroundColor:[UIColor colorWithRed:0.4f green:0.6f blue:0.9f alpha:1.0f]];
    }
}
@end
